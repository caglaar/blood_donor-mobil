import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalModel {
  late String hospitalId;
  late String mail;
  late String name;
  late String address;
  late GeoPoint geoPoint;
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
    required this.geoPoint,
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
      geoPoint: GeoPoint(0, 0),
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
  @override
  String toString() {
    // TODO: implement toString
    return "NAME=$name\n  MAIL=$mail \n HOSPİTAL_ID=$hospitalId\n A+ STOCK = $apStock\n A- STOCK = $anStock\n"
            "B+ STOCK = $bpStock\n B- STOCK = $bnStock\n AB+ STOCK = $abpStock\n AB- STOCK = $abnStock\n"
            "00+ STOCK = $zpStock\n 00- STOCK = $znStock\n GeoPoint = ${geoPoint.latitude} - ${geoPoint.longitude}";
  }
}