import 'package:e_blood_donor/models/users_models/admin_model.dart';
import 'package:e_blood_donor/service/auth_service.dart';
import 'package:e_blood_donor/service/admin_services/admin_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AdminLoginProvider extends ChangeNotifier {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  AdminModel _admin = AdminModel.getEmptyClass();
  UserAuthService userService = UserAuthService();
  AdminAuthServices adminAuthServices = AdminAuthServices();

  Future<bool> signInAdmin() async {
    bool signInSuccess = await userService.signIn(admin);
    if (signInSuccess) {
      await adminAuthServices.loginAdmin(admin);
      return (true);
    } else {
      return (false);
    }
  }

  AdminModel get admin => _admin;

  set admin(AdminModel value) {
    _admin = value;
    signInAdmin();
    notifyListeners();
  }
}