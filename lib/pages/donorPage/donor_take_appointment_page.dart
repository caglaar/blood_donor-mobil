import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/models/users_models/donor_model.dart';
import 'package:flutter/material.dart';

class DonorTakeAppointmentPage extends StatelessWidget {
  DonorTakeAppointmentPage({Key? key, required this.donor}) : super(key: key);
  final DonorModel donor;

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Take Appointment Page",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.power_settings_new_sharp),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: ColorStyles.appBarBackgroundColor,
          ),
          //body: IndexedStack(children: [],)
        );
      }
}