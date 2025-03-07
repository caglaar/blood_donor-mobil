import 'package:e_blood_donor/firebase_options.dart';
import 'package:e_blood_donor/pages/mainPage/home_page.dart';
import 'package:e_blood_donor/setup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
    runApp(const MyApp());
  } catch (e) {
    print('Firebase bağlantı hatası: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: SetupProviders.providers,
      child:  const MaterialApp(
        title: 'E-BloodDonor',
        home: HomePage(),
      ),
    );
  }
}
