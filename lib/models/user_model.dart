class UserModel {
  late int userId;
  late String mail;
  late String name;
  late String surname;
  late String birthDate;
  late String phoneNumber;
  late String password;
  late String gender;

  UserModel(
    {
    required this.userId,
    required this.mail,
    required this.name,
    required this.surname,
    required this.birthDate,
    required this.phoneNumber,
    required this.password,
    required this.gender,
  }
  );
}