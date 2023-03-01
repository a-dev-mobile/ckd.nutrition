// ignore_for_file: constant_identifier_names, lines_longer_than_80_chars

import 'dart:async';
import 'dart:convert';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:crypto/crypto.dart';
import 'package:dadata/dadata.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';




import 'package:nutrition/core/device/device.dart';
import 'package:nutrition/core/log/log.dart';
import 'package:nutrition/core/network/network_client.dart';

import 'package:nutrition/core/storage/storage.dart';
import 'package:nutrition/firebase_options.dart';
import 'package:nutrition/global.dart';
import 'package:nutrition/navigation/navigation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: prefer-static-class

// ignore: prefer-static-class
Future<void> bootstrap(FutureOr<Widget> Function() app) async {
  await runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      // Orientation app
      await _setOrientationDevice();

      _startSplash(widgetsBinding);

      _initFlutterError();

      _initSettingBloc();

      PlatformDispatcher.instance.onError = _onPlatformDispatcherError;

      _initAppMetric();

      await _initFirebaseAndCrashlytic();


      await _showLogAboutApp();

      HydratedBloc.storage = await _hydratedStorageBuild();
      final sp = await SharedPreferences.getInstance();
      runApp(
        MultiRepositoryProvider(
          providers: [
              RepositoryProvider(
              create: (context) => NetworkClient(),
            ),
            RepositoryProvider(
              create: (context) => AppStorage(isShowLog: true, pref: sp),
            ),
            RepositoryProvider(
              create: (context) => AppRouter(storage: context.read()),
            ),
            RepositoryProvider(
              create: (context) =>
                  DaDataClient(apiKey: DartDefine.API_KEY_DADATA),
            ),
          
          ],
          child: await app(),
        ),
      );
    },
    (error, stackTrace) {
      if (DartDefine.IS_ANALYTICS) {
        FirebaseCrashlytics.instance.recordError(error, stackTrace);
      } else {
        log.e('App Zone Stack Trace', error.toString(), stackTrace);
      }
    },
  );

  FlutterNativeSplash.remove();
  log.v('** close NATIVE splash **');
}

Future<void> _showLogAboutApp() async {
  final userAgent = await DeviceInfo.getUserAgent();
  final packageName = await DeviceInfo.getPackageName();
  log.wtf(
    'IS_DEBUG = ${DartDefine.IS_DEBUG} | IS_PROD = ${DartDefine.IS_ANALYTICS}\n$packageName\n$userAgent',
  );
}

Future<void> _initFirebaseAndCrashlytic() async {
  final _ = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kDebugMode && !kIsWeb) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else if (!kIsWeb) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    // Passing all uncaught errors from the framework to Crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }
}

void _initAppMetric() {
  unawaited(
    AppMetrica.activate(
      const AppMetricaConfig(DartDefine.API_KEY_APP_METRIC),
    ),
  );
}

void _initSettingBloc() {
  Bloc.observer = LogBloc();
  Bloc.transformer = bloc_concurrency.sequential<Object?>();
}

void _initFlutterError() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    FlutterError.dumpErrorToConsole(details);
    log.e(details.exceptionAsString(), '🚑', details.stack);
  };
}

void _startSplash(WidgetsBinding widgetsBinding) {
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
}

Future<void> _setOrientationDevice() async {
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
}

// ignore: prefer-static-class, unused_element
HydratedAesCipher _encryptionCipher() {
  const password = DartDefine.APP_DB_PASSWORD;
  final byteskey = sha256.convert(utf8.encode(password)).bytes;

  return HydratedAesCipher(byteskey);
}

Future<Storage> _hydratedStorageBuild() async {
  return HydratedStorage.build(
    encryptionCipher: _encryptionCipher(),
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
}

bool _onPlatformDispatcherError(Object error, StackTrace stack) {
  log.e('error: FlutterError', error, stack);

  return true;
}
