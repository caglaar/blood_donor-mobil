import 'package:e_blood_donor/pages/mainPage/home_page.dart';
import 'package:e_blood_donor/setup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: SetupProviders.providers,
      child:  MaterialApp(
        title: 'E-BloodDonor',
        home: HomePage(),
      ),
    );
  }
}
