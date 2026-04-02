import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAXjkEtQoKlXmPqZdShuvSI76Z64QWGAxk',
    appId: '1:494465692412:web:ea7a38ab5a208ced299d79',
    messagingSenderId: '494465692412',
    projectId: 'chat-app-8c268',
    authDomain: 'chat-app-8c268.firebaseapp.com',
    storageBucket: 'chat-app-8c268.firebasestorage.app',
    measurementId: 'G-K8VQYVSWRV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBh3vwqukY1NGfyE1gQsc23WkP5odeANC8',
    appId: '1:494465692412:android:7682611e3aeab760299d79',
    messagingSenderId: '494465692412',
    projectId: 'chat-app-8c268',
    storageBucket: 'chat-app-8c268.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6ri6OpPhtotBloktaM0RupqZXkp3cONE',
    appId: '1:494465692412:ios:c630a918089b3683299d79',
    messagingSenderId: '494465692412',
    projectId: 'chat-app-8c268',
    storageBucket: 'chat-app-8c268.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6ri6OpPhtotBloktaM0RupqZXkp3cONE',
    appId: '1:494465692412:ios:c630a918089b3683299d79',
    messagingSenderId: '494465692412',
    projectId: 'chat-app-8c268',
    storageBucket: 'chat-app-8c268.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAXjkEtQoKlXmPqZdShuvSI76Z64QWGAxk',
    appId: '1:494465692412:web:42bc519e64d87782299d79',
    messagingSenderId: '494465692412',
    projectId: 'chat-app-8c268',
    authDomain: 'chat-app-8c268.firebaseapp.com',
    storageBucket: 'chat-app-8c268.firebasestorage.app',
    measurementId: 'G-YZ41WQ3T1F',
  );
}
