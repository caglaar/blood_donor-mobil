import 'package:e_blood_donor/providers/register_provider.dart';
import 'package:e_blood_donor/widgets/homeWidgets/form_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonorRegisterPage extends StatelessWidget {
  const DonorRegisterPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Donor Register Login Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<RegisterProvider>(
            builder: (context, registerProvider, child) {
              return Form(
                key: ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextFormWidget(
                      str: (value) {
                        print(value);
                        registerProvider.donor.name = value;
                      },
                      name: "name",
                    ),
                    MyTextFormWidget(
                      str: (value) {
                        registerProvider.donor.surname = value;
                      },
                      name: "surname",
                    ),
                    MyTextFormWidget(
                      str: (value) {
                        registerProvider.donor.mail = value;
                      },
                      name: "mail",
                    ),
                    MyTextFormWidget(
                      str: (value) {
                        registerProvider.donor.password = value;
                      },
                      name: "password",
                    ),
                    MyTextFormWidget(
                      str: (value) {
                        registerProvider.donor.gender = value;
                      },
                      name: "gender",
                    ),
                    MyTextFormWidget(
                      str: (value) {
                        registerProvider.donor.birthDate = value;
                      },
                      name: "birth date",
                    ),
                    MyTextFormWidget(
                      str: (value) {
                        registerProvider.donor.phoneNumber = value;
                      },
                      name: "phone number",
                    ),
                    MyTextFormWidget(
                      str: (value) {
                        registerProvider.donor.bloodGroup = value;
                      },
                      name: "blood group",
                    ),
                    // Diğer MyTextFormWidget'ları buraya ekleyin
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          registerProvider.updateValues(); // DonorModel'i direkt kullanmak gerekmiyor
                          print("Donor after update: ${registerProvider.donor.toString()}");
                        },
                        child: const Text('Register'),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
