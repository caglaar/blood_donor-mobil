import 'package:e_blood_donor/models/users_models/user_model.dart';
import 'package:e_blood_donor/service/user_services/user_personal_info_service.dart';
import 'package:flutter/material.dart';

class UserPersonalInfoForm extends StatefulWidget {
  final UserModel user;

  const UserPersonalInfoForm({Key? key, required this.user})
      : super(key: key);

  @override
  _UserPersonalInfoFormState createState() => _UserPersonalInfoFormState();
}

class _UserPersonalInfoFormState extends State<UserPersonalInfoForm> {
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
    // Initialize controllers with current user data
    birthDateController = TextEditingController(text: widget.user.birthDate);
    genderController = TextEditingController(text: widget.user.gender);
    mailController = TextEditingController(text: widget.user.mail);
    nameController = TextEditingController(text: widget.user.name);
    passwordController = TextEditingController(text: widget.user.password);
    phoneNumberController =
        TextEditingController(text: widget.user.phoneNumber);
    surnameController = TextEditingController(text: widget.user.surname);
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
                  widget.user.birthDate = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Doğum Tarihi'),
            ),
            TextField(
              controller: genderController,
              onChanged: (newValue) {
                setState(() {
                  widget.user.gender = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Cinsiyet'),
            ),
            TextField(
              controller: mailController,
              onChanged: (newValue) {
                setState(() {
                  widget.user.mail = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'E-posta'),
            ),
            TextField(
              controller: nameController,
              onChanged: (newValue) {
                setState(() {
                  widget.user.name = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'İsim'),
            ),
            TextField(
              controller: passwordController,
              onChanged: (newValue) {
                setState(() {
                  widget.user.password = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Şifre'),
            ),
            TextField(
              controller: phoneNumberController,
              onChanged: (newValue) {
                setState(() {
                  widget.user.phoneNumber = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Telefon Numarası'),
            ),
            TextField(
              controller: surnameController,
              onChanged: (newValue) {
                setState(() {
                  widget.user.surname = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Soyisim'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {               
                  updateUserData(widget.user);
              },
              child: Text('Bilgileri Güncelle'),
            ),
          ],
        ),
      ),
    );
  }
}
