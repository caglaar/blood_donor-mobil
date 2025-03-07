import 'package:e_blood_donor/models/users_models/donor_model.dart';
import 'package:e_blood_donor/widgets/donorWidgets/donor_appointments_body.dart';
import 'package:e_blood_donor/widgets/donorWidgets/donor_information_body.dart';
import 'package:e_blood_donor/widgets/donorWidgets/donor_take_appointment_body.dart';
import 'package:e_blood_donor/providers/donorProvider/donor_bottom_bar_provider.dart';
import 'package:e_blood_donor/widgets/donorWidgets/donor_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonorHomePage extends StatefulWidget {
  const DonorHomePage({Key? key, required this.donor}) : super(key: key);
  final DonorModel donor;
  
  @override
  State<DonorHomePage> createState() => _DonorHomePageState();
}

class _DonorHomePageState extends State<DonorHomePage> {
  late Set<StatelessWidget> pages = {DonorAppointmentsPage(donor: widget.donor),
                              DonorInformationPage(donor: widget.donor),
                              DonorTakeAppointmentPage(donor: widget.donor),};
  @override
  Widget build(BuildContext context) {
    return Consumer<DonorBottomBarProvider>(
      builder: (context,donorBottomBarProvider,child) {
        return Scaffold(
          body: PageView.builder(
            itemBuilder: (context, position) {
              return pages.elementAt(donorBottomBarProvider.selectedIndex);
            },
            onPageChanged: (value) {
              donorBottomBarProvider.setSelectedIndex(value);
              pages.elementAt(donorBottomBarProvider.selectedIndex);
            },
            itemCount: pages.length,
            controller: donorBottomBarProvider.pageController,
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
