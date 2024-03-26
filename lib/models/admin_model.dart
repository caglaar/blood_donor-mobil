import 'package:e_blood_donor/models/user_model.dart';

class AdminModel extends UserModel {
  late int hospitalId;
  late int adminId;
  AdminModel({
    required this.hospitalId,
    required this.adminId,
    required int userId,
    required String mail,
    required String name,
    required String surname,
    required String birthDate,
    required String phoneNumber,
    required String password,
    required String gender,
  }) : super(
          userId: userId,
          mail: mail,
          name: name,
          surname: surname,
          birthDate: birthDate,
          phoneNumber: phoneNumber,
          password: password,
          gender: gender,
        );
}