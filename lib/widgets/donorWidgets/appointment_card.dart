import 'package:e_blood_donor/models/appointment_models/appointment_model.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appointment.isActive ? Colors.green[200] : Colors.red[200],
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
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
    );
  }
}
