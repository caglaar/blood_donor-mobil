import 'package:e_blood_donor/models/users_models/staff_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StaffPersonalInfoPage extends StatelessWidget {
  StaffPersonalInfoPage({Key? key, required this.staff}) : super(key: key);
  final StaffModel staff;

  @override
  Widget build(BuildContext context) {
    return Container( child: Text("Staff Personal Info Page"),);
  }
}