import 'package:e_blood_donor/widgets/donorWidgets/appointment_maps.dart';
import 'package:e_blood_donor/widgets/generalAdminWidgets/add_hospital_body.dart';
import 'package:e_blood_donor/providers/adminProvider/admin_bottom_bar_provider.dart';
import 'package:e_blood_donor/widgets/generalAdminWidgets/add_hospital_admin_body.dart';
import 'package:e_blood_donor/widgets/generalAdminWidgets/generaladmin_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class GeneralAdminHomePage extends StatefulWidget {
  const GeneralAdminHomePage({Key? key}) : super(key: key);

  @override
  State<GeneralAdminHomePage> createState() => _DonorHomePageState();
}

class _DonorHomePageState extends State<GeneralAdminHomePage> {
  late Set<StatelessWidget> pages = {
    AddHospitalPage(latitude: 0, longitude: 0,),
    AddHospitalAdminPage()
  };
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminBottomBarProvider>(
        builder: (context,generalAdminBottomBarProvider,child) {
          return Scaffold(
              body: PageView.builder(
                itemBuilder: (context, position) {
                  return pages.elementAt(generalAdminBottomBarProvider.selectedIndex);
                },
                onPageChanged: (value) {
                  generalAdminBottomBarProvider.setSelectedIndex(value);
                  pages.elementAt(generalAdminBottomBarProvider.selectedIndex);
                },
                itemCount: pages.length,
                controller: generalAdminBottomBarProvider.pageController,
              ),
              bottomNavigationBar: GeneralAdminBottomBar(
                  currentIndex: generalAdminBottomBarProvider.selectedIndex,
                  onItemTapped: generalAdminBottomBarProvider.setSelectedIndex
              )
          );
        }
    );
  }
}
