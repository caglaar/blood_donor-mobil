import 'package:e_blood_donor/models/users_models/staff_model.dart';
import 'package:e_blood_donor/service/user_services/user_personal_info_service.dart';
import 'package:flutter/material.dart';

class StaffPersonalInfoForm extends StatefulWidget {
  final StaffModel staff;

  const StaffPersonalInfoForm({Key? key, required this.staff})
      : super(key: key);

  @override
  _StaffPersonalInfoFormState createState() => _StaffPersonalInfoFormState();
}

class _StaffPersonalInfoFormState extends State<StaffPersonalInfoForm> {
  late TextEditingController birthDateController;
  late TextEditingController genderController;
  late TextEditingController mailController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController phoneNumberController;
  late TextEditingController surnameController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current staff data
    birthDateController = TextEditingController(text: widget.staff.birthDate);
    genderController = TextEditingController(text: widget.staff.gender);
    mailController = TextEditingController(text: widget.staff.mail);
    nameController = TextEditingController(text: widget.staff.name);
    passwordController = TextEditingController(text: widget.staff.password);
    phoneNumberController =
        TextEditingController(text: widget.staff.phoneNumber);
    surnameController = TextEditingController(text: widget.staff.surname);
  }

  @override
  void dispose() {
    // Dispose controllers when they are no longer needed
    birthDateController.dispose();
    genderController.dispose();
    mailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    surnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: birthDateController,
              onChanged: (newValue) {
                setState(() {
                  widget.staff.birthDate = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Doğum Tarihi'),
            ),
            TextField(
              controller: genderController,
              onChanged: (newValue) {
                setState(() {
                  widget.staff.gender = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Cinsiyet'),
            ),
            TextField(
              controller: mailController,
              onChanged: (newValue) {
                setState(() {
                  widget.staff.mail = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'E-posta'),
            ),
            TextField(
              controller: nameController,
              onChanged: (newValue) {
                setState(() {
                  widget.staff.name = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'İsim'),
            ),
            TextField(
              controller: passwordController,
              onChanged: (newValue) {
                setState(() {
                  widget.staff.password = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Şifre'),
            ),
            TextField(
              controller: phoneNumberController,
              onChanged: (newValue) {
                setState(() {
                  widget.staff.phoneNumber = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Telefon Numarası'),
            ),
            TextField(
              controller: surnameController,
              onChanged: (newValue) {
                setState(() {
                  widget.staff.surname = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Soyisim'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                
                  updateUserData(widget.staff);
                
                
              },
              child: Text('Bilgileri Güncelle'),
            ),
          ],
        ),
      ),
    );
  }
}
