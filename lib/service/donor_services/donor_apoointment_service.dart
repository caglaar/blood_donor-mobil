import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/functions/haversine.dart';
import 'package:e_blood_donor/functions/generating_functions.dart';
import 'package:e_blood_donor/models/appointment_models/appointment_model.dart';
import 'package:e_blood_donor/models/hospital_models/hospital_model.dart';
import 'package:e_blood_donor/models/users_models/donor_model.dart';
import 'package:e_blood_donor/models/users_models/staff_model.dart';

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
  
  bool checkBloodStock(DonorModel donor, QueryDocumentSnapshot<Object?> doc, HospitalModel temp)
  {
    var data = doc.data() as Map<String, dynamic>;
    switch (donor.bloodGroup) {
          case ("ARh(+)"):
            int stock= data["apStock"] ?? 0;
            temp.apStock = stock ;
            return ((temp.apStock > 50) ? false : true);
          case ("ARh(-)"):
            int stock= data["anStock"] ?? 0;
            temp.anStock = stock;
            return ((temp.anStock > 50) ? false : true);
          case ("BRh(+)"):
            int stock= data["bpStock"] ?? 0;
            temp.bpStock = stock;
            return ((temp.bpStock > 50) ? false : true);
          case ("BRh(-)"):
            int stock= data["bnStock"] ?? 0;
            temp.bnStock = stock;
            return ((temp.bnStock > 50) ? false : true);
          case ("ABRh(+)"):
            int stock= data["abpStock"] ?? 0;
            temp.abpStock = stock;
            return ((temp.abpStock > 50) ? false : true);
          case ("ABRh(-)"):
            int stock= data["abnStock"] ?? 0;
            temp.abnStock = stock;
            return ((temp.abnStock > 50) ? false : true);
          case ("00Rh(+)"):
            int stock= data["zpStock"] ?? 0;
            temp.zpStock = stock;
            return ((temp.zpStock > 50) ? false : true);
          case ("00Rh(-)"):
            int stock= data["znStock"] ?? 0;
            temp.znStock = stock;
            return ((temp.znStock > 50) ? false : true);
          default:
            return (false);
        }
  }

  double calculateDistance (GeoPoint myLocation, GeoPoint hosLocation)
  {
    return (HaversineAlgorithm.getDistance(myLocation, hosLocation));
  }

  Future<HospitalModel> findNearHospital(GeoPoint myLocation, DonorModel donor) async
  {
    try {
      HospitalModel nearestHospital = HospitalModel.getEmptyClass();
      QuerySnapshot query = await _firestore.collection("hospitals").get();
      double minDistance = double.maxFinite;
      
      for (var doc in query.docs) {
        HospitalModel temp =HospitalModel.getEmptyClass();
        if (await checkBloodStock(donor, doc, temp))
        {
          var data = doc.data() as Map<String, dynamic>;
          temp.geoPoint = data["geoPoint"] ?? const GeoPoint(0, 0);
          double tempDistance = calculateDistance(myLocation, temp.geoPoint);
          if (minDistance > tempDistance)
          {
            minDistance = tempDistance;
            temp.hospitalId =data["hospitalId"] ?? "";
            temp.name = data["name"] ?? "";
            nearestHospital = temp;
          }
        }
      }
      return (nearestHospital);
    } catch (e) {
      print("The Error: A nearest hospital didn't found ${e.toString()}");
      return (HospitalModel.getEmptyClass());
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

  Future<StaffModel> findStaff(HospitalModel hospital) async
  {
    try {
      QuerySnapshot query = await _firestore.collection("staffs").where("hospitalId",isEqualTo: hospital.hospitalId).limit(1).get();
      StaffModel staff = StaffModel.getEmptyClass();
      var doc = query.docs.first;
      var data = doc.data() as Map<String, dynamic>;
      
      staff.hospitalId = hospital.hospitalId;
      staff.userId = data["userId"] ?? "";
      staff.staffId = data["staffId"] ?? "";

      // Staff user's info get
      await getUserInfo(staff);
      print(staff.toString());
      return (staff);
    } catch (e) {
      print("The Error: A staff model didn't taked ${e.toString()}");
      return (StaffModel.getEmptyClass());
    }
  }
  Future<GeoPoint> takeAppointment(GeoPoint myLocation, DonorModel donor) async
  {
    try {
      HospitalModel hospital = await findNearHospital(myLocation, donor);
      StaffModel staff = await findStaff(hospital);
      print(hospital.toString());
      print(staff.toString());
      await _firestore.collection("appointments").add({
        'appointmentId': GeneratingFunctions.generateRandomId(length: 20),
        'bloodGroup': donor.bloodGroup,
        'date': GeneratingFunctions.takeCurrentDate(),
        'donorId': donor.donorId,
        'hospitalId': hospital.hospitalId,
        'isActive': true,
        'staffId': staff.staffId,
        'staffNameSur': "${staff.name } ${staff.surname}",
        'hospitalName': hospital.name ,
        'donorNameSur': "${donor.name } ${donor.surname}"
      });
      return (hospital.geoPoint);
    } catch (e) {
      print("The Error: Appointment didn't taked ${e.toString()}");
      return (GeoPoint(0, 0));
    }
  }
}
