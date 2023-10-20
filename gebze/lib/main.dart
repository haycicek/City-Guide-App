import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gebze/models/Database.dart';
import 'package:gebze/screens/splash.dart';

void main() async {
  await Database.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
  List<Map<String,dynamic>> documents = [];
  final db = FirebaseFirestore.instance;
  db.collection("categories").get().then(
  (querySnapshot) {
    for (var docSnapshot in querySnapshot.docs) {
      documents.add(docSnapshot.data());
    }
  },
  );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(documents: documents),
    );
  }
}
