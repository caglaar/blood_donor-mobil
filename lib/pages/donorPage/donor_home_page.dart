import 'package:e_blood_donor/models/users_models/donor_model.dart';
import 'package:flutter/material.dart';

class DonorHomePage extends StatelessWidget {
  const DonorHomePage({super.key, required this.donor});
  final DonorModel donor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("DONOR SAYFASI \n ${donor.toString()}"),
      ),
    );
  }
}