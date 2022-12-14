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
    apiKey: 'AIzaSyD1ZoDzJFb3Kv64v_Ms3b9ccu8IJInOoMI',
    appId: '1:120224478273:web:1aceb82f4d457cae2482c0',
    messagingSenderId: '120224478273',
    projectId: 'blocktalk-571b3',
    authDomain: 'blocktalk-571b3.firebaseapp.com',
    storageBucket: 'blocktalk-571b3.appspot.com',
    measurementId: 'G-Y40NL8HM92',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8JzNUtjjHs1zxEnCuJgB1n8cz4mN6XFQ',
    appId: '1:120224478273:android:c796bb8d30a0a1462482c0',
    messagingSenderId: '120224478273',
    projectId: 'blocktalk-571b3',
    storageBucket: 'blocktalk-571b3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCafxYKcIwUwN_xQqHgPNuvqJPl2ZFItLY',
    appId: '1:120224478273:ios:331bbdb40c42aee32482c0',
    messagingSenderId: '120224478273',
    projectId: 'blocktalk-571b3',
    storageBucket: 'blocktalk-571b3.appspot.com',
    iosClientId: '120224478273-idrpcl2fabshhu6ra7ta0u1itvjofohu.apps.googleusercontent.com',
    iosBundleId: 'com.example.blockTalk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCafxYKcIwUwN_xQqHgPNuvqJPl2ZFItLY',
    appId: '1:120224478273:ios:331bbdb40c42aee32482c0',
    messagingSenderId: '120224478273',
    projectId: 'blocktalk-571b3',
    storageBucket: 'blocktalk-571b3.appspot.com',
    iosClientId: '120224478273-idrpcl2fabshhu6ra7ta0u1itvjofohu.apps.googleusercontent.com',
    iosBundleId: 'com.example.blockTalk',
  );
}
