import 'package:e_blood_donor/models/users_models/admin_model.dart';
import 'package:e_blood_donor/models/users_models/staff_model.dart';
import 'package:e_blood_donor/widgets/adminWidgets/update_stock_body.dart';
import 'package:e_blood_donor/widgets/adminWidgets/admin_information_body.dart';
import 'package:e_blood_donor/widgets/adminWidgets/add_staff_body.dart';
import 'package:e_blood_donor/providers/adminProvider/admin_bottom_bar_provider.dart';
import 'package:e_blood_donor/widgets/adminWidgets/admin_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/hospital_models/hospital_model.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key, required this.admin, required this.hospital, required this.staff}) : super(key: key);
  final AdminModel admin;
  final HospitalModel hospital;
  final StaffModel staff;

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  late Set<StatelessWidget> pages = {
    AddStaffPage(staff: widget.staff, admin: widget.admin,),
    AdminInfoPage(admin: widget.admin, hospital: widget.hospital,),
    UpdateStockPage(admin: widget.admin),
  };
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminBottomBarProvider>(
        builder: (context,adminBottomBarProvider,child) {
          return Scaffold(
              body: PageView.builder(
                itemBuilder: (context, position) {
                  return pages.elementAt(adminBottomBarProvider.selectedIndex);
                },
                onPageChanged: (value) {
                  adminBottomBarProvider.setSelectedIndex(value);
                  pages.elementAt(adminBottomBarProvider.selectedIndex);
                },
                itemCount: pages.length,
                controller: adminBottomBarProvider.pageController,
              ),
              bottomNavigationBar: AdminBottomBar(
                  currentIndex: adminBottomBarProvider.selectedIndex,
                  onItemTapped: adminBottomBarProvider.setSelectedIndex
              )
          );
        }
    );
  }
}
