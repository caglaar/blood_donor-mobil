class HospitalModel {
  late String hospitalId;
  late String mail;
  late String name;
  late String address;
  late double longitude;
  late double latitude;
  late int apStock;
  late int anStock;
  late int abpStock;
  late int abnStock;
  late int bpStock;
  late int bnStock;
  late int zpStock;
  late int znStock;

  HospitalModel({
    required this.hospitalId,
    required this.mail,
    required this.name,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.apStock,
    required this.anStock,
    required this.abnStock,
    required this.abpStock,
    required this.bnStock,
    required this.bpStock,
    required this.znStock,
    required this.zpStock,
  }
  );

  static HospitalModel getEmptyClass()
  {
    return HospitalModel(
      hospitalId: "", 
      mail: "",
      name: "", 
      address: "", 
      longitude: 0, 
      latitude: 0, 
      apStock: 0, 
      anStock: 0, 
      abnStock: 0, 
      abpStock: 0, 
      bnStock: 0, 
      bpStock: 0, 
      znStock: 0, 
      zpStock: 0
      );
  }
}