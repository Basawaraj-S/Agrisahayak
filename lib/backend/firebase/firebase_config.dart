import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBdsXBS7w-hCnpmniapSHWh0TdbKBYgwF4",
            authDomain: "agri-sahayak-n36cj2.firebaseapp.com",
            projectId: "agri-sahayak-n36cj2",
            storageBucket: "agri-sahayak-n36cj2.firebasestorage.app",
            messagingSenderId: "12656395717",
            appId: "1:12656395717:web:6b5089d56b8e89f53537ac"));
  } else {
    await Firebase.initializeApp();
  }
}
