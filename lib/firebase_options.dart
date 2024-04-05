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
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWrXQ0H7ERMT8ruLcMVqMFHGB-aaC43a8',
    appId: '1:279923602288:android:6beb302f30705fdb1bd5b5',
    messagingSenderId: '279923602288',
    projectId: 'tutonotas-e0faa',
    databaseURL: 'https://tutonotas-e0faa-default-rtdb.firebaseio.com',
    storageBucket: 'tutonotas-e0faa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8Oa1zFVW4aPltiKz_TCneeeOR7AvoTUU',
    appId: '1:279923602288:ios:da7a159acd8921b61bd5b5',
    messagingSenderId: '279923602288',
    projectId: 'tutonotas-e0faa',
    databaseURL: 'https://tutonotas-e0faa-default-rtdb.firebaseio.com',
    storageBucket: 'tutonotas-e0faa.appspot.com',
    iosBundleId: 'com.example.tutotest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8Oa1zFVW4aPltiKz_TCneeeOR7AvoTUU',
    appId: '1:279923602288:ios:d6bf0ed3fc681f911bd5b5',
    messagingSenderId: '279923602288',
    projectId: 'tutonotas-e0faa',
    databaseURL: 'https://tutonotas-e0faa-default-rtdb.firebaseio.com',
    storageBucket: 'tutonotas-e0faa.appspot.com',
    iosBundleId: 'com.example.tutotest.RunnerTests',
  );
}