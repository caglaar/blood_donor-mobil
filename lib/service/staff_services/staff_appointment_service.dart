import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/models/appointment_models/appointment_model.dart';
import 'package:e_blood_donor/models/users_models/staff_model.dart';

class StaffAppointmentServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<AppointmentModel>> getAppointments(StaffModel staff) async {
    try {
      print("Staff Appointment get service worked");
      QuerySnapshot query = await _firestore
          .collection("appointments")
          .where("staffId", isEqualTo: staff.staffId)
          .where("isActive", isEqualTo: true)
          .get();
      List<AppointmentModel> appointments = [];
      
      for(var doc in query.docs) {
        var appointmentData = doc.data() as Map<String, dynamic>;
        AppointmentModel appointment = AppointmentModel.getEmptyClass();
        appointment.staffId = staff.staffId;
        appointment.date = appointmentData["date"] ?? "";
        appointment.hospitalId = appointmentData["hospitalId"] ?? "";
        appointment.donorId = appointmentData["donorId"] ?? "";
        appointment.isActive = appointmentData["isActive"] ?? false;
        appointment.hospitalName = appointmentData["hospitalName"] ?? "";
        appointment.staffName = appointmentData["staffNameSur"] ?? "";

        // Randevuyu listeye ekle
        appointments.add(appointment);
      };
      print("Appointment get service finished");
      
      return (appointments);
    } catch (e) {
      print("staff bilgileri alma hatası: $e");
      return ([]);
    }
  }
  
  

  Future<void> getUserInfo(StaffModel staff) async
  {
    try {
      QuerySnapshot query = await _firestore.collection("users").where("userId",isEqualTo: staff.userId).limit(1).get();
      var doc = query.docs.first;
      var data = doc.data() as Map<String, dynamic>;
      
      staff.name = data["name"] ?? "";
      staff.surname = data["surname"] ?? "";

    } catch (e) {
      print("The Error: A staff model didn't taked ${e.toString()}");
    }
  }

}
