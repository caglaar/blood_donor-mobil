import 'package:e_blood_donor/const/textConsts.dart';
import 'package:e_blood_donor/pages/adminHomePage/admin_login_page.dart';
import 'package:e_blood_donor/pages/donorHomePage/donor_login_page.dart';
import 'package:e_blood_donor/pages/staffHomePage/staff_login_page.dart';
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