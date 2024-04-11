import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/models/appointment_models/appointment_model.dart';
import 'package:e_blood_donor/models/users_models/donor_model.dart';
import 'package:e_blood_donor/providers/donorProvider/donor_appointment_provider.dart';
import 'package:e_blood_donor/widgets/donorWidgets/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonorAppointmentsPage extends StatelessWidget {
  DonorAppointmentsPage({Key? key, required this.donor}) : super(key: key);
  final DonorModel donor;

  @override
  Widget build(BuildContext context) {
    // DonorAppointmentProvider'ı al
    final appointmentProvider=Provider.of<DonorAppointmentProvider>(context,listen: false);
    appointmentProvider.getAppointments(donor);
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
      body: Consumer<DonorAppointmentProvider>(
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
                return AppointmentCard(appointment: appointment);
              },
            );
          }
        },
      ),
    );
  }
}
