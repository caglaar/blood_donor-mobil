import 'package:e_blood_donor/models/users_models/user_model.dart';

class DonorModel extends UserModel {
  late String donorId;
  late String bloodGroup;

  DonorModel({
    required String userId,
    required String mail,
    required String name,
    required String surname,
    required String birthDate,
    required String phoneNumber,
    required String password,
    required String gender,
    required int type,
    required this.bloodGroup,
    required this.donorId,

  }) : super(
          userId: userId,
          mail: mail,
          name: name,
          surname: surname,
          birthDate: birthDate,
          phoneNumber: phoneNumber,
          password: password,
          gender: gender,
          type: type,
        );

  DonorModel copyWith({
    String? userId,
    String? mail,
    String? name,
    String? surname,
    String? birthDate,
    String? phoneNumber,
    String? password,
    String? gender,
    String? bloodGroup,
    String? donorId,
    int? type,
  })
  {
    return DonorModel(
      userId: userId ?? this.userId,
      mail: mail ?? this.mail,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      birthDate: birthDate ?? this.birthDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      donorId: donorId ?? this.donorId,
      type: type ?? this.type,
      
    );
  }

  static DonorModel getEmptyClass() {
    return DonorModel(
      userId: "",
      mail: "",
      name: "",
      surname: "",
      birthDate: "",
      phoneNumber: "",
      password: "",
      gender: "",
      bloodGroup: "",
      donorId: "",
      type: 0
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "NAME=$name\n SURNAME=$surname\n MAIL=$mail \n USER_ID=$userId\n BIRTH_DATE=$birthDate\n PHONE_NUMBER=$phoneNumber\n PASSWORD=$password\n GENDER=$gender\n BLOOD_GROUP=$bloodGroup\n DONOR_ID=$donorId";
  }
}
