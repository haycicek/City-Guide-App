import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Database{
  static Future<void> init() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: 'AIzaSyDjlWnSmOPnxO7MmgWPA7xDym-87wqCJ2c',
    appId: '1:770319919532:android:2eb6a4e6f29401bb8df209',
    messagingSenderId: '770319919532',
    projectId: 'gebze-eac69',
    storageBucket: 'gebze-eac69.appspot.com'
  ),
  );
  }
}
