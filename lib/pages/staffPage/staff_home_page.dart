import 'package:e_blood_donor/models/users_models/staff_model.dart';
import 'package:e_blood_donor/providers/staffProvider/staff_bottom_bar_provider.dart';
import 'package:e_blood_donor/widgets/staffWidgets/staff_appointments_body.dart';
import 'package:e_blood_donor/widgets/staffWidgets/staff_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/staffWidgets/staff_personal_info_body.dart';



class StaffHomePage extends StatefulWidget {
  const StaffHomePage({Key? key, required this.staff}) : super(key: key);
  final StaffModel staff;
  

  @override
  State<StaffHomePage> createState() => _StaffHomePageState();
}

class _StaffHomePageState extends State<StaffHomePage> {
  late Set<StatelessWidget> pages = {StaffAppointmentsPage(staff:widget.staff),
  StaffPersonalInfoPage(staff: widget.staff), 
  };
  @override
  Widget build(BuildContext context) {
    return Consumer<StaffBottomBarProvider>(
      builder: (context,staffBottomBarProvider,child) {
        return Scaffold(
          body: PageView.builder(
            itemBuilder: (context, position) {
              return pages.elementAt(staffBottomBarProvider.selectedIndex);
            },
            onPageChanged: (value) {
              staffBottomBarProvider.setSelectedIndex(value);
              pages.elementAt(staffBottomBarProvider.selectedIndex);
            },
            itemCount: pages.length,
            controller: staffBottomBarProvider.pageController,
          ),
          bottomNavigationBar: StaffBottomBar(
            currentIndex: staffBottomBarProvider.selectedIndex, 
            onItemTapped: staffBottomBarProvider.setSelectedIndex
          )
        );
      }
    );
  }
}