import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/const/date_picker.dart';
import 'package:e_blood_donor/const/password_form.dart';
import 'package:e_blood_donor/functions/generating_functions.dart';
import 'package:e_blood_donor/providers/generalAdminProvider/register_hospitalAdmin_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:e_blood_donor/widgets/generalAdminWidgets/list_hospitals_widget.dart';

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
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'name',
                        decoration: InputDecoration(
                          labelText: 'Name',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'surname',
                        decoration: InputDecoration(
                          labelText: 'Surname',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'mail',
                        decoration: InputDecoration(
                          labelText: 'Mail',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: const Icon(Icons.email),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PasswordField(
                        name: 'password',
                        hintText: 'Password',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(6),
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderDropdown<String>(
                        name: 'gender',
                        decoration: InputDecoration(
                          labelText: 'Select Gender',
                          prefixIcon: const Icon(Icons.man),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'Please select a gender',
                          ),
                        ]),
                        items: ['Erkek', 'Kadın']
                            .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                            .toList(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DatePickerField(
                          name: 'birthDate',
                          hintText: 'Birth Date',
                          initialDate: DateTime.now()
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'phoneNumber',
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: const Icon(Icons.phone_android_outlined),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.equalLength(11)
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            final selectedHospitalId = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListHospitals(),
                              ),
                            );

                            if (selectedHospitalId != null) {
                              registerProvider.admin = registerProvider.admin.copyWith(
                                  hospitalId: selectedHospitalId
                              );

                              print("Selected Hospital ID: $selectedHospitalId");
                              print("Admin with Hospital ID: ${registerProvider.admin}");

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Hospital ID başarıyla seçildi: $selectedHospitalId'),
                                  duration: const Duration(seconds: 2),
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
                            if (registerProvider.formKey.currentState!.saveAndValidate()) {
                              registerProvider.formKey.currentState!.save();
                              registerProvider.admin = registerProvider.admin.copyWith(
                                userId: "",
                                adminId: GeneratingFunctions.generateRandomId(),
                                mail: registerProvider.formKey.currentState!.value['mail'],
                                name: registerProvider.formKey.currentState!.value['name'],
                                surname: registerProvider.formKey.currentState!.value['surname'],
                                birthDate: registerProvider.formKey.currentState!.value['birthDate'].toString(),
                                phoneNumber: registerProvider.formKey.currentState!.value['phoneNumber'],
                                password: registerProvider.formKey.currentState!.value['password'],
                                gender: registerProvider.formKey.currentState!.value['gender'],
                              );

                              print("Admin after update: ${registerProvider.admin}");

                              await registerProvider.registerAdmin;

                              registerProvider.formKey.currentState!.reset();

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
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