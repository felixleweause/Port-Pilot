import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDNs2eNLms9TgVAQxgH8lpXOKvEGP9Rftk",
            authDomain: "park-pilot-e16f3.firebaseapp.com",
            projectId: "park-pilot-e16f3",
            storageBucket: "park-pilot-e16f3.appspot.com",
            messagingSenderId: "695742528103",
            appId: "1:695742528103:web:286670731d482d11a172c2",
            measurementId: "G-ENX6DQ4ZE7"));
  } else {
    await Firebase.initializeApp();
  }
}
