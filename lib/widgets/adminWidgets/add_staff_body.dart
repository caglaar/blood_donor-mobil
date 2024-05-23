import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/functions/generating_functions.dart';
import 'package:e_blood_donor/models/users_models/admin_model.dart';
import 'package:e_blood_donor/models/users_models/staff_model.dart';
import 'package:e_blood_donor/providers/adminProvider/add_staff_provider.dart';
import 'package:e_blood_donor/providers/generalAdminProvider/register_hospitalAdmin_provider.dart'; // Admin provider'ını ekleyin
import 'package:e_blood_donor/widgets/homeWidgets/form_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class AddStaffPage extends StatelessWidget {
  const AddStaffPage({Key? key, required StaffModel staff, required this.admin}) : super(key: key);
  final AdminModel admin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Staff Register Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: ColorStyles.appBarBackgroundColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer2<AddStaffProvider, HospitalAdminRegisterProvider>(
            builder: (context, addStaffProvider, adminProvider, child) {
              return FormBuilder(
                key: addStaffProvider.formKey,
                onChanged: () {
                  addStaffProvider.formKey.currentState!.save();
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormRegister(
                        initialValue: addStaffProvider.staff.name,
                        keyValue: 'name',
                        hintText: 'Name',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: addStaffProvider.staff.surname,
                        keyValue: 'surname',
                        hintText: 'Surname',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: addStaffProvider.staff.mail,
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
                        initialValue: addStaffProvider.staff.password,
                        keyValue: 'password',
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: addStaffProvider.staff.gender,
                        keyValue: 'gender',
                        hintText: 'Gender',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: addStaffProvider.staff.birthDate,
                        keyValue: 'birthDate',
                        hintText: 'Birth Date',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: addStaffProvider.staff.phoneNumber,
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
                            if (addStaffProvider.formKey.currentState!
                                .saveAndValidate()) {
                              addStaffProvider.formKey.currentState!.save();
                              addStaffProvider.staff = addStaffProvider.staff.copyWith(
                                userId: "",
                                staffId: GeneratingFunctions.generateRandomId(),
                                mail: addStaffProvider
                                    .formKey.currentState!.value['mail'],
                                name: addStaffProvider
                                    .formKey.currentState!.value['name'],
                                surname: addStaffProvider
                                    .formKey.currentState!.value['surname'],
                                birthDate: addStaffProvider
                                    .formKey.currentState!.value['birthDate'],
                                phoneNumber: addStaffProvider
                                    .formKey.currentState!.value['phoneNumber'],
                                password: addStaffProvider
                                    .formKey.currentState!.value['password'],
                                gender: addStaffProvider
                                    .formKey.currentState!.value['gender'],
                                hospitalId: admin.hospitalId
                              );
                              addStaffProvider.registerStaff;

                              // Formları temizle
                              addStaffProvider.formKey.currentState!.reset();

                              // Toast mesajı göster
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
