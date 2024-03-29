import 'package:e_blood_donor/models/user_models/user_model.dart';

class StaffModel extends UserModel {
  late String hospitalId;
  late String staffId;
  StaffModel({
    required this.hospitalId,
    required this.staffId,
    required String userId,
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
  static StaffModel getEmptyClass() {
    return StaffModel(
      userId: "",
      mail: "",
      name: "",
      surname: "",
      birthDate: "",
      phoneNumber: "",
      password: "",
      gender: "",
      hospitalId: "",
      staffId: "",
    );
  }

  StaffModel copyWith({
    String? userId,
    String? mail,
    String? name,
    String? surname,
    String? birthDate,
    String? phoneNumber,
    String? password,
    String? gender,
    String? staffId,
    String? hospitalId,
  }) {
    return StaffModel(
      userId: userId ?? this.userId,
      mail: mail ?? this.mail,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      birthDate: birthDate ?? this.birthDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      staffId: staffId ?? this.staffId,
      hospitalId: hospitalId ?? this.hospitalId,
    );
  }


}