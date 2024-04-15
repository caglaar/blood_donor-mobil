import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/models/users_models/donor_model.dart';
import 'package:e_blood_donor/providers/donorProvider/donor_take_appoint_provider.dart';
import 'package:e_blood_donor/widgets/donorWidgets/appointment_button.dart';
import 'package:e_blood_donor/widgets/donorWidgets/appointment_waiting_circular.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          body: Consumer<DonoTakeAppointmentProvider>(
            builder: (context, takeAppointmentProvider, child) {
            if (takeAppointmentProvider.pressedButton == false) {
              return Center(
                child: TakeAppointmentButton
                (
                  message: "Take Appointment",
                  onPressed: (){
                    takeAppointmentProvider.takeAppointments(donor);
                  }
                ),
              );
            } 
            else 
            {
              if(takeAppointmentProvider.isAppoitmentLoading == 0)
              {
                return Center(child: Text("ERROR"),);
              }
              else if(takeAppointmentProvider.isAppoitmentLoading == 1)
              {
                return AppointmentWaitingCircular();
              }
              else
              {
                return Center (child: Text("MAP GELCEK"),);
              }
            }
          },
        )
        );
      }
}