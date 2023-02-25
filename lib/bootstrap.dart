// ignore_for_file: constant_identifier_names, lines_longer_than_80_chars

import 'dart:async';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrition/core/config/providers.dart';
import 'package:nutrition/core/device/device.dart';
import 'package:nutrition/core/log/log.dart';

import 'package:nutrition/firebase_options.dart';
import 'package:nutrition/dart_define.dart';

// ignore: prefer-static-class
Future<void> bootstrap(FutureOr<Widget> Function() app) async {
  await runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      await _initOrientationApp();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      _initFlutterError();
      PlatformDispatcher.instance.onError = _onPlatformDispatcherError;
      _initAppMetrica();
      await _initFirebase();
      await _initCrashlytic();
      await _showSettingAppInLog();

      final overrides = await overrideProviders();

      runApp(
        ProviderScope(
          overrides: overrides,
          observers: [if (DartDefine.IS_DEBUG) LogRiverpod()],
          child: await app(),
        ),
      );
    },
    (error, stackTrace) {
      if (DartDefine.IS_ANALYTICS) {
        FirebaseCrashlytics.instance.recordError(error, stackTrace);
      } else {
        logger.e('App Zone Stack Trace', error.toString(), stackTrace);
      }
    },
  );
  FlutterNativeSplash.remove();
  log.v('** close NATIVE splash**');
}

/* ****************************** */

Future<void> _showSettingAppInLog() async {
  final userAgent = await DeviceInfo.getUserAgent();
  final packageName = await DeviceInfo.getPackageName();
  log.i(
    'IS_DEBUG = ${DartDefine.IS_DEBUG} | IS_PROD = ${DartDefine.IS_ANALYTICS}\n$packageName\n$userAgent',
  );
}

Future<void> _initCrashlytic() async {
  if (kDebugMode && !kIsWeb) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else if (!kIsWeb) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    // Passing all uncaught errors from the framework to Crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }
}

Future<void> _initFirebase() async {
  final _ = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void _initAppMetrica() {
  unawaited(
    AppMetrica.activate(
      const AppMetricaConfig(DartDefine.API_KEY_APP_METRIC),
    ),
  );
}

Future<void> _initOrientationApp() async {
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
}

void _initFlutterError() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    FlutterError.dumpErrorToConsole(details);
    log.e(details.exceptionAsString(), '🚑', details.stack);
  };
}

// ignore: prefer-static-class, unused_element
bool _onPlatformDispatcherError(Object error, StackTrace stack) {
  logger.e('error: FlutterError', error, stack);

  return true;
}
