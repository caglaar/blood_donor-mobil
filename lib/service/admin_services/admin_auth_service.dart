
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/models/users_models/admin_model.dart';

class AdminAuthServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> loginAdmin(AdminModel admin) async {
    try {
      QuerySnapshot query = await _firestore.collection("admins").where("userId",isEqualTo: admin.userId).limit(1).get();
      print(query.toString());
      var userDoc = query.docs.first;
      var userData = userDoc.data()  as Map<String, dynamic>;
      admin.adminId = userData['adminId'] ?? "";
      print("başarılı");
    } catch (e) {
      print("admin bilgileri alma hatası");
    }

  }

}