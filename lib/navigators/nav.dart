import 'package:e_blood_donor/models/users_models/donor_model.dart';
import 'package:e_blood_donor/widgets/donorWidgets/donor_appointments_body.dart';
import 'package:e_blood_donor/widgets/donorWidgets/donor_information_body.dart';
import 'package:e_blood_donor/widgets/donorWidgets/donor_take_appointment_body.dart';
import 'package:e_blood_donor/providers/donorProvider/donor_bottom_bar_provider.dart';
import 'package:e_blood_donor/widgets/donorWidgets/donor_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonorHomePage extends StatelessWidget {
  const DonorHomePage({Key? key, required this.donor}) : super(key: key);
  final DonorModel donor;

  @override
  Widget build(BuildContext context) {
    return Consumer<DonorBottomBarProvider>(
      builder: (context,donorBottomBarProvider,child) {
        return Scaffold(
          body: IndexedStack(
            index: donorBottomBarProvider.selectedIndex,
            children: [
              DonorAppointmentsPage(donor: donor),
              DonorInformationPage(donor: donor),
              DonorTakeAppointmentPage(donor: donor),
            ],
          ),
          bottomNavigationBar: DonorBottomBar(
            currentIndex: donorBottomBarProvider.selectedIndex, 
            onItemTapped: donorBottomBarProvider.setSelectedIndex
          )
        );
      }
    );
  }
}
