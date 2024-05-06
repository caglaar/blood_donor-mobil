import 'package:e_blood_donor/models/users_models/admin_model.dart';
import 'package:flutter/material.dart';


class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key, required this.admin}) : super(key: key);
  final AdminModel admin;

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  Widget build(BuildContext context) {
    return  const Scaffold(
    );
  }
}
