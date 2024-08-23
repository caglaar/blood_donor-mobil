import 'package:e_blood_donor/models/hospital_models/hospital_model.dart';
import 'package:e_blood_donor/models/users_models/admin_model.dart';
import 'package:e_blood_donor/models/users_models/donor_model.dart';
import 'package:e_blood_donor/models/users_models/staff_model.dart';
import 'package:e_blood_donor/models/users_models/user_model.dart';
import 'package:e_blood_donor/service/admin_services/admin_auth_service.dart';
import 'package:e_blood_donor/service/auth_service.dart';
import 'package:e_blood_donor/service/donor_services/donor_auth_service.dart';
import 'package:e_blood_donor/service/hospital_services/add_hospital_services.dart';
import 'package:e_blood_donor/service/staff_services/staff_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AuthServiceProvider extends ChangeNotifier {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  UserModel _user = UserModel.getEmptyClass();
  StaffModel _staff = StaffModel.getEmptyClass();
  AdminModel _admin = AdminModel.getEmptyClass();
  HospitalModel _hospital = HospitalModel.getEmptyClass();
  UserAuthService userService = UserAuthService();
  AdminAuthServices adminService = AdminAuthServices();
  DonorAuthServices donorService = DonorAuthServices();
  StaffAuthServices staffService = StaffAuthServices();
  AddHospitalService hospitalService = AddHospitalService();
  DonorModel _donor = DonorModel.getEmptyClass();


  Future<int> signIn() async {
    bool signInSuccess = await userService.signIn(user);
    if (signInSuccess) {
      if(user.type == 0)
      {
        _donor = DonorModel(userId: user.userId, mail: user.mail, name: user.name, surname: user.surname, birthDate: user.birthDate, phoneNumber: user.phoneNumber, password: user.password, gender: user.gender, type: user.type, bloodGroup: "", donorId: "");
        await donorService.loginDonor(donor);
        return (0);
      }
      else if(user.type == 1)
      {
        _staff = StaffModel(hospitalId: "", staffId: "", userId: user.userId, mail: user.mail, name: user.name, surname: user.surname, birthDate: user.birthDate, phoneNumber: user.phoneNumber, password: user.password, gender: user.gender, type: user.type);
        await staffService.loginStaff(staff);
        return (1);
      }
      else if(user.type == 2)
      {
        _admin = AdminModel(hospitalId: "", adminId: "", userId: user.userId, mail: user.mail, name: user.name, surname: user.surname, birthDate: user.birthDate, phoneNumber: user.phoneNumber, password: user.password, gender: user.gender, type: user.type);
        await adminService.loginAdmin(admin,hospital);
        return (2);
      }
      else if(user.type == 3)
      {
        _admin = AdminModel(hospitalId: "", adminId: "", userId: user.userId, mail: user.mail, name: user.name, surname: user.surname, birthDate: user.birthDate, phoneNumber: user.phoneNumber, password: user.password, gender: user.gender, type: user.type);
        return (3);
      }
      else
        return (-1);
    } else {
      return (-1);
    }
  }


  UserModel get user => _user;
  DonorModel get donor => _donor;
  StaffModel get staff => _staff;
  AdminModel get admin => _admin;
  HospitalModel get hospital => _hospital;

  set user(UserModel value) {
    _user = value;
    signIn();
    notifyListeners();
  }
}
