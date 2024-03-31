import 'package:e_blood_donor/models/users_models/donor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorRegisterProvider extends ChangeNotifier {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  DonorModel _donor = DonorModel.getEmptyClass();

  void addDonor(FirebaseFirestore _firestore) async {
  try {
    await _firestore.collection('users').add({
      'gender': donor.gender,
      'name': donor.name,
      'birthDate': donor.birthDate,
      'mail': donor.mail,
      'surname': donor.surname,
      'password': donor.password,
      'phoneNumber': donor.phoneNumber,
      'userId': donor.userId
    });
    try {
      await _firestore.collection('donors').add({
      'bloodGroup': donor.bloodGroup,
      'donorId': donor.donorId,
      'userId': donor.userId
    });
    print("Donor Başarılı olusturuldu");
    } catch (e) {
      print("Donor bilgileri ekleme hatası");
    }
    print('User Bilgileri Başarılı olustu başarıyla eklendi.');
  } catch (e) {
    print('User ekleme hatası: $e');
  }
}


  DonorModel get donor => _donor;

  set donor(DonorModel value) {
    _donor = value;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    addDonor(_firestore);
    notifyListeners();
  }
}
