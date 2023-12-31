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
    apiKey: 'AIzaSyB58WvOS-zsTuKfs3pCQNPacprnwjjKP3I',
    appId: '1:778943463004:web:2538ee1e6900a3b0a33099',
    messagingSenderId: '778943463004',
    projectId: 'ayo-curhat-3b698',
    authDomain: 'ayo-curhat-3b698.firebaseapp.com',
    storageBucket: 'ayo-curhat-3b698.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEn1LD1NHPMfhhb83iCIvV7U-a72pnkJk',
    appId: '1:778943463004:android:f8b73d55c589d950a33099',
    messagingSenderId: '778943463004',
    projectId: 'ayo-curhat-3b698',
    storageBucket: 'ayo-curhat-3b698.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxy2aK5a5iWlTZL-LdyhsWPbsJzsHdWvo',
    appId: '1:778943463004:ios:e01b19f43ccbd25fa33099',
    messagingSenderId: '778943463004',
    projectId: 'ayo-curhat-3b698',
    storageBucket: 'ayo-curhat-3b698.appspot.com',
    iosBundleId: 'com.example.apiTutorial',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCxy2aK5a5iWlTZL-LdyhsWPbsJzsHdWvo',
    appId: '1:778943463004:ios:e8b5cda633063840a33099',
    messagingSenderId: '778943463004',
    projectId: 'ayo-curhat-3b698',
    storageBucket: 'ayo-curhat-3b698.appspot.com',
    iosBundleId: 'com.example.apiTutorial.RunnerTests',
  );
}
