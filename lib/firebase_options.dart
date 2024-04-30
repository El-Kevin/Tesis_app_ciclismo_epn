// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAHmVbFPi2jEIXuVb-KVuhixpOC7AzOjC4',
    appId: '1:1008603040928:web:52c7f1ce4e878445e00dc5',
    messagingSenderId: '1008603040928',
    projectId: 'app-club-ciclismo-epn',
    authDomain: 'app-club-ciclismo-epn.firebaseapp.com',
    storageBucket: 'app-club-ciclismo-epn.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJGg2F0BcNPodVnjM2i1CruS7E446MafE',
    appId: '1:1008603040928:android:c7709a48da122342e00dc5',
    messagingSenderId: '1008603040928',
    projectId: 'app-club-ciclismo-epn',
    storageBucket: 'app-club-ciclismo-epn.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzNh46azRMPPgQCBWtOvlfYiZcnrzDlPE',
    appId: '1:1008603040928:ios:94d5824aee270922e00dc5',
    messagingSenderId: '1008603040928',
    projectId: 'app-club-ciclismo-epn',
    storageBucket: 'app-club-ciclismo-epn.appspot.com',
    iosBundleId: 'com.example.tesisAppCiclismoEpn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzNh46azRMPPgQCBWtOvlfYiZcnrzDlPE',
    appId: '1:1008603040928:ios:94d5824aee270922e00dc5',
    messagingSenderId: '1008603040928',
    projectId: 'app-club-ciclismo-epn',
    storageBucket: 'app-club-ciclismo-epn.appspot.com',
    iosBundleId: 'com.example.tesisAppCiclismoEpn',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAHmVbFPi2jEIXuVb-KVuhixpOC7AzOjC4',
    appId: '1:1008603040928:web:7008506e31d0f3dfe00dc5',
    messagingSenderId: '1008603040928',
    projectId: 'app-club-ciclismo-epn',
    authDomain: 'app-club-ciclismo-epn.firebaseapp.com',
    storageBucket: 'app-club-ciclismo-epn.appspot.com',
  );
}
