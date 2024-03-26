import 'package:e_blood_donor/models/user_model.dart';

class StaffModel extends UserModel {
  late int hospitalId;
  late int staffId;
  StaffModel({
    required this.hospitalId,
    required this.staffId,
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