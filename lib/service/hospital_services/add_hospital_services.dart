import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/models/hospital_models/hospital_model.dart';

class AddHospitalService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> addHospital(HospitalModel hospital) async {
    try {
      //hastane verilerini ekleme
      await _firestore.collection('hospitals').add({
        'name': hospital.name,
        'address': hospital.address,
        'mail': hospital.mail,
        'geoPoint': hospital.geoPoint,
        'hospitalId': hospital.hospitalId,
        'apStock' : hospital.apStock,
        'anStock' : hospital.anStock,
        'bpStock' : hospital.bpStock,
        'bnStock' : hospital.bnStock,
        'abpStock' : hospital.abpStock,
        'abnStock' : hospital.abnStock,
        'zpStock' : hospital.zpStock,
        'znStock' : hospital.znStock,
      });
      return true;
    } catch (e) {
      print('Hastane ekleme işlemi başarısız oldu: $e');
      return false;
    }
  }
}
