
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/models/users_models/donor_model.dart';

class DonorServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerDonor(DonorModel donor) async {
  try {
      await _firestore.collection('donors').add({
    'bloodGroup': donor.bloodGroup,
    'donorId': donor.donorId,
    'userId': donor.userId
    });
    } catch (e) {
      print("Donor bilgileri ekleme hatası");
    }
}
  Future<void> loginDonor(DonorModel donor) async {
    try {
      QuerySnapshot query = await _firestore.collection("donors").where("userId",isEqualTo: donor.userId).limit(1).get();
      print(query.toString());
      var userDoc = query.docs.first;
      var userData = userDoc.data()  as Map<String, dynamic>;
      donor.donorId = userData['donorId'] ?? "";
      donor.bloodGroup = userData['bloodGroup'] ?? "";

    } catch (e) {
      print("Donor bilgileri alma hatası");
    }

  }
  
}