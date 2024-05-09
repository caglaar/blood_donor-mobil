import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/models/users_models/staff_model.dart';

class StaffAuthServices{

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future <void> loginStaff(StaffModel staff) async{
    try{
      QuerySnapshot query = await _firestore.collection("staffs").where("userId",isEqualTo: staff.userId).limit(1).get();
      print(query.toString());
      var userDoc = query.docs.first;
      var userData = userDoc.data()  as Map<String, dynamic>;
      staff.staffId=userData["staffId"]?? "";
      staff.hospitalId=userData["hospitalId"]??"";
    }
    catch(e){
      print("Staff Bilgileri Alma hatası");
    }
  }


}