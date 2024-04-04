import 'package:e_blood_donor/models/users_models/donor_model.dart';
import 'package:e_blood_donor/service/auth_service.dart';
import 'package:e_blood_donor/service/donor_services/donor_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorLoginProvider extends ChangeNotifier {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  DonorModel _donor = DonorModel.getEmptyClass();
  UserAuthService userService = UserAuthService();
  DonorServices donorService = DonorServices();

  Future<bool> signInDonor() async {
    bool signInSuccess = await userService.signIn(donor);
    if (signInSuccess) {
      print("\nGİRDİ BURAYA");
      await donorService.loginDonor(donor);
      return (true);
    } else {
      return (false);
    }
  }


  DonorModel get donor => _donor;

  set donor(DonorModel value) {
    _donor = value;
    signInDonor();
    notifyListeners();
  }
}
