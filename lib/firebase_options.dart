// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```-
///
///, j nb dxq sa.
///
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
    apiKey: 'AIzaSyBwidlniFfneyd9fIj5H-aMb-w61qFieSQ',
    appId: '1:874410386112:web:b9e5e2e2f91abf9428c325',
    messagingSenderId: '874410386112',
    projectId: 'madproj-2d69d',
    authDomain: 'madproj-2d69d.firebaseapp.com',
    storageBucket: 'madproj-2d69d.appspot.com',
    measurementId: 'G-HE816SPKZ0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCGobedKi0191U300wgvHf2mECg0DN_88',
    appId: '1:874410386112:android:86535d2dca72b22028c325',
    messagingSenderId: '874410386112',
    projectId: 'madproj-2d69d',
    storageBucket: 'madproj-2d69d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8SAAF2Z1P1khBIL5kMOiaCLpXS72NSRo',
    appId: '1:874410386112:ios:612ca0ec2855c80228c325',
    messagingSenderId: '874410386112',
    projectId: 'madproj-2d69d',
    storageBucket: 'madproj-2d69d.appspot.com',
    iosBundleId: 'com.example.madsocialproj2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8SAAF2Z1P1khBIL5kMOiaCLpXS72NSRo',
    appId: '1:874410386112:ios:c3df03a69913273f28c325',
    messagingSenderId: '874410386112',
    projectId: 'madproj-2d69d',
    storageBucket: 'madproj-2d69d.appspot.com',
    iosBundleId: 'com.example.madsocialproj2.RunnerTests',
  );
}
