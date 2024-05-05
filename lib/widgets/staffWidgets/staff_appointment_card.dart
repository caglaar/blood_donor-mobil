import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/models/appointment_models/appointment_model.dart';
import 'package:flutter/material.dart';

class StaffAppointmentCard extends StatelessWidget {
  const StaffAppointmentCard(
      {super.key, required this.appointment, required this.onPressed});

  final AppointmentModel appointment;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color:  Color.fromARGB(255, 248, 230, 209) ,
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(appointment.hospitalName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date: ${appointment.date}"),
                  Text("Staff Name: ${appointment.staffName}"),
                  Text("Active: ${appointment.isActive ? 'Yes' : 'No'}"),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              onPressed();
            },
           
            child: Container(
              width: 64, // Container'ın genişliği
              height: 64, // Container'ın yüksekliği
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 255, 255, 255), // Düğmenin arka plan rengi
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // değişiklik yüksekliği
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.check_outlined,
                  size: 40, // İkon boyutu
                  color: ColorStyles.appBarBackgroundColor, // İkon rengi
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
