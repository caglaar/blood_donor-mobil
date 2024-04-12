import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/models/appointment_models/appointment_model.dart';
import 'package:e_blood_donor/models/users_models/donor_model.dart';

class DonorAppointmentServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<AppointmentModel>> getAppointments(DonorModel donor) async {
    try {
      print("Appointment get service worked");
      QuerySnapshot query = await _firestore
          .collection("appointments")
          .where("donorId", isEqualTo: donor.donorId)
          .get();
      List<AppointmentModel> appointments = [];
      
      for(var doc in query.docs) {
        var appointmentData = doc.data() as Map<String, dynamic>;
        AppointmentModel appointment = AppointmentModel.getEmptyClass();
        appointment.donorId = donor.donorId;
        appointment.date = appointmentData["date"] ?? "";
        appointment.hospitalId = appointmentData["hospitalId"] ?? "";
        appointment.staffId = appointmentData["staffId"] ?? "";
        appointment.isActive = appointmentData["isActive"] ?? false;
        appointment.hospitalName = appointmentData["hospitalName"] ?? "";
        appointment.staffName = appointmentData["staffNameSur"] ?? "";

        // Randevuyu listeye ekle
        appointments.add(appointment);
      };
      print("Appointment get service finished");
      
      return (appointments);
    } catch (e) {
      print("Donor bilgileri alma hatası: $e");
      return ([]);
    }
  }
}
