import 'package:e_blood_donor/models/users_models/donor_model.dart';
import 'package:e_blood_donor/service/auth_service.dart';
import 'package:e_blood_donor/service/donor_services/donor_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DonorRegisterProvider extends ChangeNotifier {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  DonorModel _donor = DonorModel.getEmptyClass();
  UserAuthService userService = UserAuthService();
  DonorServices donorService = DonorServices();
  
  DonorModel get donor => _donor;

  set donor(DonorModel value) {
    _donor = value;
    signUpDonor();

    notifyListeners();
  }

  Future<void> signUpDonor() async {
    bool signUpSuccess = await userService.signUp(donor);
    if (signUpSuccess) {
      print("\nGİRDİ BURAYA");
      donorService.registerDonor(donor);
    } else {
      // Kayıt başarısız mesajı veya işlemleri
    }
  }
}
