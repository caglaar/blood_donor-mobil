import 'package:e_blood_donor/models/users_models/staff_model.dart';
import 'package:flutter/material.dart';

class StaffHomePage extends StatefulWidget {
  const StaffHomePage({Key? key, required this.staff}) : super(key: key);
  final StaffModel staff;
  

  @override
  State<StaffHomePage> createState() => _StaffHomePageState();
}

class _StaffHomePageState extends State<StaffHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("StaffPage") ,
    );
  }
}