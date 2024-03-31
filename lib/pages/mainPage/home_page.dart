import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/const/text_consts.dart';
import 'package:e_blood_donor/pages/adminPage/admin_login_page.dart';
import 'package:e_blood_donor/pages/donorPage/donor_login_page.dart';
import 'package:e_blood_donor/pages/staffPage/staff_login_page.dart';
import 'package:e_blood_donor/widgets/homeWidgets/button_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome E-Blood Donor App",style: TextStyles.titleStyle,),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: ColorStyles.appBarBackgroundColor,
      ),
      body:  const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonHome(message: "Donor Login",page: DonorLoginPage(),),
            SizedBox(height: 15,),
            ButtonHome(message: "Staff Login",page: StaffLoginPage(),),
            SizedBox(height: 15,),
            ButtonHome(message: "Admin Login",page: AdminLoginPage(),),

      
          ]
          ),
      ),
    );
  }
}