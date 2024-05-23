import 'package:e_blood_donor/models/users_models/staff_model.dart';
import 'package:e_blood_donor/service/admin_services/register_staff.dart';
import 'package:e_blood_donor/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddStaffProvider extends ChangeNotifier {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  StaffModel _staff = StaffModel.getEmptyClass();
  UserAuthService userService = UserAuthService();
  RegisterStaff registerStaff = RegisterStaff();

  StaffModel get staff => _staff;

  set staff(StaffModel value) {
    _staff = value;
    signUpStaff();
    notifyListeners();
  }

  Future<void> signUpStaff() async {
    bool signUpSuccess = await userService.signUp(staff);
    if (signUpSuccess) {
      print("\nGİRDİ BURAYA");
      await registerStaff.registerStaff(staff);
    } else {
      // Kayıt başarısız mesajı veya işlemleri
    }
  }
}