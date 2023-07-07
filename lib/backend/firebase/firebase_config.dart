import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCNbtLHmQsbdch-vVvttlDYm3tLEDHalwU",
            authDomain: "softdev-twitterclone.firebaseapp.com",
            projectId: "softdev-twitterclone",
            storageBucket: "softdev-twitterclone.appspot.com",
            messagingSenderId: "281153576177",
            appId: "1:281153576177:web:1147868ae55e1537b89d50"));
  } else {
    await Firebase.initializeApp();
  }
}
