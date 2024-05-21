
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/models/users_models/admin_model.dart';
import 'package:e_blood_donor/models/hospital_models/hospital_model.dart';

class AdminAuthServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> loginAdmin(AdminModel admin, HospitalModel hospital) async {
    try {
      QuerySnapshot queryAdmin = await _firestore.collection("admins").where("userId",isEqualTo: admin.userId).limit(1).get();
      print(queryAdmin.toString());
      var userDoc = queryAdmin.docs.first;
      var userData = userDoc.data()  as Map<String, dynamic>;
      admin.adminId = userData['adminId'] ?? "";
      admin.hospitalId = userData['hospitalId'] ?? "";
      QuerySnapshot queryHospital = await _firestore.collection("hospitals").where("hospitalId",isEqualTo: admin.hospitalId).limit(1).get();
      var hospitalDoc = queryHospital.docs.first;
      var hospitalData = hospitalDoc.data() as Map<String, dynamic>;
      hospital.name = hospitalData['name'] ?? "";

      print("başarılı");
    } catch (e) {
      print("admin bilgileri alma hatası");
    }
  }
}