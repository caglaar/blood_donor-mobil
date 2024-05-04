import 'package:e_blood_donor/models/users_models/staff_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StaffAppointmentsPage extends StatelessWidget {
  StaffAppointmentsPage({Key? key, required this.staff}) : super(key: key);
  final StaffModel staff;

  @override
  Widget build(BuildContext context) {
    return Container( child: Text("appointments page"),);
  }
}