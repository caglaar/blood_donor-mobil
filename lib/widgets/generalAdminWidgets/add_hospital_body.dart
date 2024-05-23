import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/functions/generating_functions.dart';
import 'package:e_blood_donor/providers/hospitalProvider/add_hospital_provider.dart';
import 'package:e_blood_donor/widgets/generalAdminWidgets/hospital_map_widget.dart';
import 'package:e_blood_donor/widgets/homeWidgets/form_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class AddHospitalPage extends StatelessWidget {
  final double latitude;
  final double longitude;

  const AddHospitalPage({Key? key, required this.latitude, required this.longitude}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Hospital Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: ColorStyles.appBarBackgroundColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<AddHospitalProvider>(
            builder: (context, addProvider, child) {
              return FormBuilder(
                key: addProvider.formKey,
                onChanged: () {
                  addProvider.formKey.currentState!.save();
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormRegister(
                        initialValue: addProvider.hospital.mail,
                        keyValue: 'address',
                        hintText: 'Hospital Address',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: addProvider.hospital.name,
                        keyValue: 'name',
                        hintText: 'Hospital Name',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: addProvider.hospital.address,
                        keyValue: 'mail',
                        hintText: 'Hospital Email',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MapWidget()),
                            );
                          },
                          child: const Text('Go to Hospital Map'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (addProvider.formKey.currentState!
                                .saveAndValidate()) {
                              addProvider.formKey.currentState!.save();
                              addProvider.hospital =
                                  addProvider.hospital.copyWith(
                                    hospitalId: GeneratingFunctions.generateRandomId(),
                                    mail: addProvider
                                        .formKey.currentState!.value['address'],
                                    name: addProvider
                                        .formKey.currentState!.value['name'],
                                    address: addProvider
                                        .formKey.currentState!.value['mail'],
                                    apStock: addProvider.hospital.apStock,
                                    geoPoint: GeoPoint(latitude, longitude),
                                  );
                              print("Hospital after update: ${addProvider.hospital.toString()}");

                              // Formları temizle
                              addProvider.formKey.currentState!.reset();

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