import 'package:e_blood_donor/models/users_models/admin_model.dart';
import 'package:e_blood_donor/service/genraladmin_services/register_hospitaladmin.dart';
import 'package:e_blood_donor/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class HospitalAdminRegisterProvider extends ChangeNotifier {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  AdminModel _admin = AdminModel.getEmptyClass();
  UserAuthService userService = UserAuthService();
  RegisterHospitalAdmin registerAdmin = RegisterHospitalAdmin();

  AdminModel get admin => _admin;

  set admin(AdminModel value) {
    _admin = value;
    signUpAdmin();
    notifyListeners();
  }

  Future<void> signUpAdmin() async {
    bool signUpSuccess = await userService.signUp(admin);
    if (signUpSuccess) {
      print("\nGİRDİ BURAYA");
      await registerAdmin.registerHospitalAdmin(admin);
    } else {
      // Kayıt başarısız mesajı veya işlemleri
    }
  }
}