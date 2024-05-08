import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/models/users_models/staff_model.dart';
import 'package:e_blood_donor/widgets/staffWidgets/staff_personal_info_form.dart';
import 'package:flutter/material.dart';

class StaffPersonalInfoPage extends StatelessWidget {
  final StaffModel staff;

  const StaffPersonalInfoPage({Key? key, required this.staff}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Personal Info Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.power_settings_new_sharp),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: ColorStyles.appBarBackgroundColor,
      ),
      body: StaffPersonalInfoForm(staff: staff),
    );
  }
}


