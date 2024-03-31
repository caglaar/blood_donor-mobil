import 'package:e_blood_donor/models/users_models/donor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorLoginProvider extends ChangeNotifier {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  DonorModel _donor = DonorModel.getEmptyClass();

  Future<bool> checkUserCredentials() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  try {
    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .where('mail', isEqualTo: _donor.mail)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Kullanıcı bulundu,
      var userDoc = querySnapshot.docs.first;
      var userData = userDoc.data()  ;
      String savedPassword = userData['password'] ?? "";

      if (savedPassword == donor.password) {
        // Şifre eşleşiyor
        _donor.name = userData['name'] ?? "";
        _donor.surname = userData['surname'] ?? "";
        _donor.phoneNumber = userData['phoneNumber'] ?? "";
        _donor.userId = userData['userId'] ?? "";
        _donor.birthDate = userData['birthDate'] ?? "";
        _donor.gender = userData['gender'] ?? "";
        
      return (true);

      } else {
        print('Şifre eşleşmiyor!');
        return (false);
      }
    } else {
      print('Kullanıcı bulunamadı!');
      return (false);  
    }
  } catch (e) {
    print('Veri okuma hatası: $e');
    return (false);

  }
}


  DonorModel get donor => _donor;

  set donor(DonorModel value) {
    _donor = value;
    checkUserCredentials();
    notifyListeners();
  }
}
