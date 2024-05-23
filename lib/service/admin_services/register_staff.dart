
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/models/users_models/staff_model.dart';

class RegisterStaff {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> registerStaff(StaffModel staff) async {
    try {
      await _firestore.collection('staffs').add({
        'staffId': staff.staffId,
        'hospitalId': staff.hospitalId,
        'userId': staff.userId
      });
      return (true);
    } catch (e) {
      print("Staff bilgileri ekleme hatası");
      return (false);
    }
  }
}

