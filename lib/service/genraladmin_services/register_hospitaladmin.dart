
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/models/users_models/admin_model.dart';

class RegisterHospitalAdmin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> registerHospitalAdmin(AdminModel admin) async {
    try {
      await _firestore.collection('admins').add({
        'adminId': admin.adminId,
        'hospitalId': admin.hospitalId,
        'userId': admin.userId
      });
      return (true);
    } catch (e) {
      print("Donor bilgileri ekleme hatası");
      return (false);
    }
  }
}

