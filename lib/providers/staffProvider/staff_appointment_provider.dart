import 'package:e_blood_donor/models/appointment_models/appointment_model.dart';
import 'package:e_blood_donor/models/users_models/staff_model.dart';
import 'package:e_blood_donor/service/staff_services/staff_appointment_service.dart';
import 'package:flutter/material.dart';

class StaffAppointmentProvider extends ChangeNotifier {
  List<AppointmentModel> _appointments = [];
  List<AppointmentModel> get appointments => _appointments;
  StaffAppointmentServices staffAppointmentServices = StaffAppointmentServices();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  Future<void> getAppointments(StaffModel staff) async {
    try {
      _isLoading = true;
      _appointments = await staffAppointmentServices.getAppointments(staff);
      notifyListeners();
    } catch (e) {
      print("Error getting appointments: $e");
      _isLoading = false; 
      notifyListeners();
    }
  }
  // Future<void>approveAppointment(AppointmentModel appointment)async{
  //   try{
  //     await staffAppointmentServices.approveAppointment(appointment);
  //     notifyListeners();
  //   }
  //   catch(e){
  //     print("Error Updating Appointments: $e");
  //     notifyListeners();
  //   }
  // }

}
