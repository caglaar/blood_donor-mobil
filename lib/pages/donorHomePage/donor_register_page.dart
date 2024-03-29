import 'package:e_blood_donor/const/colorConst.dart';
import 'package:e_blood_donor/providers/register_provider.dart';
import 'package:e_blood_donor/widgets/homeWidgets/form_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import '';

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
        backgroundColor: ColorStyles.appBarBackgroundColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<RegisterProvider>(
            builder: (context, registerProvider, child) {
              return FormBuilder(
                key: registerProvider.formKey,
                onChanged: () {
                  registerProvider.formKey.currentState!.save();
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormRegister(
                        initialValue: registerProvider.donor.name,
                        keyValue: 'name',
                        hintText: 'Name',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: registerProvider.donor.surname,
                        keyValue: 'surname',
                        hintText: 'Surname',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: registerProvider.donor.mail,
                        keyValue: 'mail',
                        hintText: 'Mail',
                         validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]), 
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: registerProvider.donor.password,
                        keyValue: 'password',
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: registerProvider.donor.gender,
                        keyValue: 'gender',
                        hintText: 'Gender',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: registerProvider.donor.birthDate,
                        keyValue: 'birthDate',
                        hintText: 'Birth Date',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: registerProvider.donor.phoneNumber,
                        keyValue: 'phoneNumber',
                        hintText: 'Phone Number',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: registerProvider.donor.bloodGroup,
                        keyValue: 'bloodGroup',
                        hintText: 'Blood Group',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (registerProvider.formKey.currentState!
                                .saveAndValidate()) {
                              registerProvider.formKey.currentState!.save();
                              registerProvider.donor =
                                  registerProvider.donor.copyWith(
                                mail: registerProvider
                                    .formKey.currentState!.value['mail'],
                                name: registerProvider
                                    .formKey.currentState!.value['name'],
                                surname: registerProvider
                                    .formKey.currentState!.value['surname'],
                                birthDate: registerProvider
                                    .formKey.currentState!.value['birthDate'],
                                phoneNumber: registerProvider
                                    .formKey.currentState!.value['phoneNumber'],
                                password: registerProvider
                                    .formKey.currentState!.value['password'],
                                gender: registerProvider
                                    .formKey.currentState!.value['gender'],
                                bloodGroup: registerProvider
                                    .formKey.currentState!.value['bloodGroup'],
                              );
                              print("Donor after update: ${registerProvider.donor.toString()}");
                            }
                          },
                          child: const Text('Register'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
