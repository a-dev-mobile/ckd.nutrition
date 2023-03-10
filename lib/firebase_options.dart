// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members, no_default_cases
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAK3OfhGtaBBa5PckYaL7K0U3H90gBz8g4',
    appId: '1:96038361233:web:0c709ebcb2bee52ebf8730',
    messagingSenderId: '96038361233',
    projectId: 'prod-ckd-nutrition',
    authDomain: 'prod-ckd-nutrition.firebaseapp.com',
    storageBucket: 'prod-ckd-nutrition.appspot.com',
    measurementId: 'G-TQV5C90G0N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDE0LdtI3V3MYd0S0ms_uhsq2kJ78uEwrA',
    appId: '1:96038361233:android:c43ba1f8da1740abbf8730',
    messagingSenderId: '96038361233',
    projectId: 'prod-ckd-nutrition',
    storageBucket: 'prod-ckd-nutrition.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9y_DoTj_ULI7R4aqEKzsXAyWiZLOvHYw',
    appId: '1:96038361233:ios:67b2ab1497aa8d2abf8730',
    messagingSenderId: '96038361233',
    projectId: 'prod-ckd-nutrition',
    storageBucket: 'prod-ckd-nutrition.appspot.com',
    iosClientId:
        '96038361233-84c7pk658vu43m55j3rki2t48n9863nh.apps.googleusercontent.com',
    iosBundleId: 'mobile.ckd.nutrition',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9y_DoTj_ULI7R4aqEKzsXAyWiZLOvHYw',
    appId: '1:96038361233:ios:67b2ab1497aa8d2abf8730',
    messagingSenderId: '96038361233',
    projectId: 'prod-ckd-nutrition',
    storageBucket: 'prod-ckd-nutrition.appspot.com',
    iosClientId:
        '96038361233-84c7pk658vu43m55j3rki2t48n9863nh.apps.googleusercontent.com',
    iosBundleId: 'mobile.ckd.nutrition',
  );
}
