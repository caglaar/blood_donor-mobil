import 'package:e_blood_donor/models/users_models/user_model.dart';

class AdminModel extends UserModel {
  late String hospitalId;
  late String adminId;
  AdminModel({
    required this.hospitalId,
    required this.adminId,
    required String userId,
    required String mail,
    required String name,
    required String surname,
    required String birthDate,
    required String phoneNumber,
    required String password,
    required String gender,
    required int type,
  }) : super(
          userId: userId,
          mail: mail,
          name: name,
          surname: surname,
          birthDate: birthDate,
          phoneNumber: phoneNumber,
          password: password,
          gender: gender,
          type: type
        );
  
  AdminModel copyWith({
    String? userId,
    String? mail,
    String? name,
    String? surname,
    String? birthDate,
    String? phoneNumber,
    String? password,
    String? gender,
    String? hospitalId,
    String? adminId,
    int? type,
  }) {
    return AdminModel(
      userId: userId ?? this.userId,
      mail: mail ?? this.mail,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      birthDate: birthDate ?? this.birthDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      hospitalId: hospitalId ?? this.hospitalId,
      adminId: adminId ?? this.adminId,
      type: type ?? this.type,
    );
  }
  static AdminModel getEmptyClass() {
    return AdminModel(
      userId: "",
      mail: "",
      name: "",
      surname: "",
      birthDate: "",
      phoneNumber: "",
      password: "",
      gender: "",
      hospitalId: "",
      adminId: "",
      type: 2
    );
  }
}