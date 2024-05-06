import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/models/appointment_models/appointment_model.dart';
import 'package:e_blood_donor/models/users_models/staff_model.dart';
import 'package:e_blood_donor/providers/staffProvider/staff_appointment_provider.dart';
import 'package:e_blood_donor/widgets/staffWidgets/staff_appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StaffAppointmentsPage extends StatelessWidget {
  StaffAppointmentsPage({Key? key, required this.staff}) : super(key: key);
  final StaffModel staff;

  @override
  Widget build(BuildContext context) {
    final appointmentProvider =
        Provider.of<StaffAppointmentProvider>(context, listen: false);
    appointmentProvider.getAppointments(staff);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Appointments Page",
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
      body: Consumer<StaffAppointmentProvider>(
        builder: (context, appointmentProvider, child) {
          if (appointmentProvider.appointments.isEmpty) {
            // Randevu yoksa
            return Center(
              child: appointmentProvider.isLoading
                  ? const CircularProgressIndicator() // Veri çekilirken dönen çember
                  : const Text("Randevunuz bulunmuyor"), // Veri çekildiğinde
            );
          } else {
            return ListView.builder(
              itemCount: appointmentProvider.appointments.length,
              itemBuilder: (context, index) {
                AppointmentModel appointment =
                    appointmentProvider.appointments[index];
                return StaffAppointmentCard(
                  appointment: appointment,
                 
                );
              },
            );
          }
        },
      ),
    );
  }
}
