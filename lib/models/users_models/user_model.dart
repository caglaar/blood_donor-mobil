class UserModel {
  late String userId;
  late String mail;
  late String name;
  late String surname;
  late String birthDate;
  late String phoneNumber;
  late String password;
  late String gender;
  late int type;

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
    required this.type
  }
  );


  UserModel copyWith({
    String? userId,
    String? mail,
    String? name,
    String? surname,
    String? birthDate,
    String? phoneNumber,
    String? password,
    String? gender,
    int? type,
  })
  {
    return UserModel(
      userId: userId ?? this.userId,
      mail: mail ?? this.mail,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      birthDate: birthDate ?? this.birthDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      type: type ?? this.type,
      
    );
  }



  static UserModel getEmptyClass() {
    return UserModel(
      userId: "",
      mail: "",
      name: "",
      surname: "",
      birthDate: "",
      phoneNumber: "",
      password: "",
      gender: "",
      type: 0,
    );
}
}