import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/models/users_models/admin_model.dart';
import 'package:e_blood_donor/models/hospital_models/hospital_model.dart';
import 'package:flutter/material.dart';

class AdminInfoPage extends StatelessWidget {
  AdminInfoPage({Key? key, required this.admin, required this.hospital}) : super(key: key);
  final AdminModel admin;
  final HospitalModel hospital;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Donor Information",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: ColorStyles.appBarBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          constraints: BoxConstraints(maxWidth: 400.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInfoRow("Name", admin.name),
              _buildInfoRow("Surname", admin.surname),
              _buildInfoRow("Mail", admin.mail),
              _buildInfoRow("Birth Date", admin.birthDate),
              _buildInfoRow("Phone Number", admin.phoneNumber),
              _buildInfoRow("Gender", admin.gender),
              _buildInfoRow("Hospital Name", hospital.name),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.0,
            child: Text(
              label + ":",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
