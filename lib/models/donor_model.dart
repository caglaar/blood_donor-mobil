import 'package:e_blood_donor/models/user_model.dart';

class DonorModel extends UserModel {
  late int donorId;
  late String bloodGroup;

  DonorModel({
    required int userId,
    required String mail,
    required String name,
    required String surname,
    required String birthDate,
    required String phoneNumber,
    required String password,
    required String gender,
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
        );

  static DonorModel getEmptyClass() {
    return DonorModel(
      userId: 0,
      mail: "",
      name: "",
      surname: "",
      birthDate: "",
      phoneNumber: "",
      password: "",
      gender: "",
      bloodGroup: "", 
      donorId: 0, 
    );
  }
  @override
  String toString() {
    // TODO: implement toString
    return "NAME=$name\n SURNAME=$surname\n MAIL=$mail \n USER_ID=$userId\n BIRTH_DATE=$birthDate\n PHONE_NUMBER=$phoneNumber\n PASSWORD=$password\n GENDER=$gender\n BLOOD_GROUP=$bloodGroup\n DONOR_ID=$donorId";
  }
}
