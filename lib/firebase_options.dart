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
    apiKey: 'AIzaSyBqrc1pxMV7cJ-YH0pr2S6RrS8K-6keDjw',
    appId: '1:412523529245:web:47c9fd818a82cf1bd732f4',
    messagingSenderId: '412523529245',
    projectId: 'premierepark-80f15',
    authDomain: 'premierepark-80f15.firebaseapp.com',
    storageBucket: 'premierepark-80f15.appspot.com',
    measurementId: 'G-S4BCD78HJY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGxMJM6FPns3PcozvcZohHmv4gJeIMEjM',
    appId: '1:412523529245:android:482148955edfa104d732f4',
    messagingSenderId: '412523529245',
    projectId: 'premierepark-80f15',
    storageBucket: 'premierepark-80f15.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2quO9WVL3fP9cnsEK5MMe5E1hjqcqczw',
    appId: '1:412523529245:ios:2d5d479d5584a547d732f4',
    messagingSenderId: '412523529245',
    projectId: 'premierepark-80f15',
    storageBucket: 'premierepark-80f15.appspot.com',
    iosClientId: '412523529245-k9t7umhu5e0f45tgtjopbrhr0f0s3s0g.apps.googleusercontent.com',
    iosBundleId: 'com.example.premierepark',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2quO9WVL3fP9cnsEK5MMe5E1hjqcqczw',
    appId: '1:412523529245:ios:2d5d479d5584a547d732f4',
    messagingSenderId: '412523529245',
    projectId: 'premierepark-80f15',
    storageBucket: 'premierepark-80f15.appspot.com',
    iosClientId: '412523529245-k9t7umhu5e0f45tgtjopbrhr0f0s3s0g.apps.googleusercontent.com',
    iosBundleId: 'com.example.premierepark',
  );
}