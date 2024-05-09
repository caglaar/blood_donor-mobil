import 'package:e_blood_donor/models/users_models/staff_model.dart';
import 'package:e_blood_donor/service/auth_service.dart';
import 'package:e_blood_donor/service/staff_services/staff_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class StaffLoginProvider extends ChangeNotifier {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  StaffModel _staff =StaffModel.getEmptyClass();
   UserAuthService userService = UserAuthService();
   StaffAuthServices staffAuthServices= StaffAuthServices();
   

  Future<bool> signInStaff() async {
    
    bool signInSuccess = await userService.signIn(_staff);
    
    if (signInSuccess) {
      await staffAuthServices.loginStaff(_staff);
      print("gggasdasd");
      return (true);
    } else {
      print("iiiiiiiiii");
      return (false);
    }
  }

  StaffModel get staff=>_staff;

  set staff(StaffModel value) {
    _staff = value;
    signInStaff();
    notifyListeners();
  }

}