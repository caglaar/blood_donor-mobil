import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/functions/generating_functions.dart';
import 'package:e_blood_donor/providers/generalAdminProvider/register_hospitalAdmin_provider.dart';
import 'package:e_blood_donor/widgets/homeWidgets/form_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import 'package:e_blood_donor/widgets/generalAdminWidgets/list_hospitals_widget.dart'; // ListHospitals widget'ını ekleyin

class AddHospitalAdminPage extends StatelessWidget {
  const AddHospitalAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hospital Admin Register Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: ColorStyles.appBarBackgroundColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<HospitalAdminRegisterProvider>(
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
                        initialValue: registerProvider.admin.name,
                        keyValue: 'name',
                        hintText: 'Name',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: registerProvider.admin.surname,
                        keyValue: 'surname',
                        hintText: 'Surname',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: registerProvider.admin.mail,
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
                        initialValue: registerProvider.admin.password,
                        keyValue: 'password',
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: registerProvider.admin.gender,
                        keyValue: 'gender',
                        hintText: 'Gender',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: registerProvider.admin.birthDate,
                        keyValue: 'birthDate',
                        hintText: 'Birth Date',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: registerProvider.admin.phoneNumber,
                        keyValue: 'phoneNumber',
                        hintText: 'Phone Number',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            final selectedHospitalId = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListHospitals(),
                              ),
                            );

                            if (selectedHospitalId != null) {
                              // Hospital ID'yi admin nesnesine atayın
                              registerProvider.admin = registerProvider.admin.copyWith(
                                  hospitalId: selectedHospitalId
                              );

                              // Hospital ID'nin atandığını kontrol edin
                              print("Selected Hospital ID: $selectedHospitalId");
                              print("Admin with Hospital ID: ${registerProvider.admin}");

                              // Toast mesajı göster
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Hospital ID başarıyla seçildi: $selectedHospitalId'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child: const Text('View Hospitals'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (registerProvider.formKey.currentState!
                                .saveAndValidate()) {
                              registerProvider.formKey.currentState!.save();
                              registerProvider.admin = registerProvider.admin.copyWith(
                                userId: "",
                                adminId: GeneratingFunctions.generateRandomId(),
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
                              );

                              print("Admin after update: ${registerProvider.admin}");

                              // Hospital Admin'i kaydetme işlemi
                              await registerProvider.registerAdmin;

                              // Formları temizle
                              registerProvider.formKey.currentState!.reset();

                              // Toast mesajı göster
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Kayıt başarılı!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
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
