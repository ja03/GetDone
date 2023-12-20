import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter/foundation.dart';



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
    apiKey: '  AIzaSyBfjx4BsTcBqCkpaJgFfQUVeiAIph4-K8k',
    appId: '1:192096785181:web:c1d0dd8b62d94c2b0407f4',
    messagingSenderId: '192096785181',
    projectId: 'vpproject1-b888e',
    authDomain: 'vpproject1-b888e.firebaseapp.com',
    storageBucket: 'vpproject1-b888e.appspot.com',
    measurementId: 'G-S78SBPFKZF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJAsu3pa93YHe0w21FQAPdDTiUwWvXCFM',
    appId: '1:192096785181:android:0fcf3afea283969f0407f4',
    messagingSenderId: '192096785181',
    projectId: 'vpproject1-b888e',
    storageBucket: 'vpproject1-b888e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSqq7BsGbgAuvnanYA-8I2g03VdqeZjWg',
    appId: '1:192096785181:ios:fd18f71119e1a2bd0407f4',
    messagingSenderId: '192096785181',
    projectId: 'vpproject1-b888e',
    storageBucket: 'vpproject1-b888e.appspot.com',
    iosBundleId: 'com.example.getdone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDSqq7BsGbgAuvnanYA-8I2g03VdqeZjWg',
    appId: '1:192096785181:ios:7b9a5f173700698e0407f4',
    messagingSenderId: '192096785181',
    projectId: 'vpproject1-b888e',
    storageBucket: 'vpproject1-b888e.appspot.com',
    iosBundleId: 'com.example.getdone.RunnerTests',
  );
}

