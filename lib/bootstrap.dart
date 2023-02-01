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

import 'package:nutrition/core/storage/storage.dart';
import 'package:nutrition/firebase_options.dart';
import 'package:nutrition/global.dart';
import 'package:nutrition/navigation/navigation.dart';
import 'package:path_provider/path_provider.dart';

// ignore: prefer-static-class
Future<void> bootstrap(FutureOr<Widget> Function() app) async {
  await runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      // Orientation app
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
        FlutterError.dumpErrorToConsole(details);
        log.e(details.exceptionAsString(), '🚑', details.stack);
      };

      Bloc.observer = LogBloc();
      Bloc.transformer = bloc_concurrency.sequential<Object?>();
      PlatformDispatcher.instance.onError = _onPlatformDispatcherError;

      unawaited(
        AppMetrica.activate(
          const AppMetricaConfig(DartDefine.API_KEY_APP_METRIC),
        ),
      );
      final _ = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      if (kDebugMode && !kIsWeb) {
        await FirebaseCrashlytics.instance
            .setCrashlyticsCollectionEnabled(false);
      } else if (!kIsWeb) {
        await FirebaseCrashlytics.instance
            .setCrashlyticsCollectionEnabled(true);
        // Passing all uncaught errors from the framework to Crashlytics
        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      }

      // App Info Output
      final userAgent = await DeviceInfo.getUserAgent();
      final packageName = await DeviceInfo.getPackageName();
      log.i(
        'IS_DEBUG = ${DartDefine.IS_DEBUG} | IS_PROD = ${DartDefine.IS_ANALYTICS}\n$packageName\n$userAgent',
      );

      HydratedBloc.storage = await _hydratedStorageBuild();
      runApp(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => AppStorage(isShowLog: true),
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
        logger.e('App Zone Stack Trace', error.toString(), stackTrace);
      }
    },
  );

  FlutterNativeSplash.remove();
  log.v('** close NATIVE splash**');
}

// ignore: prefer-static-class, unused_element
HydratedAesCipher _encryptionCipher() {
  const password = DartDefine.APP_DB_PASSWORD;
  final byteskey = sha256.convert(utf8.encode(password)).bytes;

  return HydratedAesCipher(byteskey);
}

// ignore: prefer-static-class, unused_element
Future<Storage> _hydratedStorageBuild() async {
  return HydratedStorage.build(
    encryptionCipher: _encryptionCipher(),
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
}

// ignore: prefer-static-class, unused_element
bool _onPlatformDispatcherError(Object error, StackTrace stack) {
  logger.e('error: FlutterError', error, stack);

  return true;
}
