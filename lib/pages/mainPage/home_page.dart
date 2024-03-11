import 'package:e_blood_donor/const/textConsts.dart';
import 'package:e_blood_donor/widgets/homeWidgets/button_home.dart';
import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome E-Blood Donor App",style: TextStyles.titleStyle,),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonHome(message: "Donor Login"),
            SizedBox(height: 15,),
            ButtonHome(message: "Staff Login"),
            SizedBox(height: 15,),
            ButtonHome(message: "Admin Login"),

      
          ]
          ),
      ),
    );
  }
}