import 'package:e_blood_donor/models/appointment_models/appointment_model.dart';
import 'package:e_blood_donor/models/users_models/donor_model.dart';
import 'package:e_blood_donor/service/donor_services/donor_apoointment_service.dart';
import 'package:flutter/material.dart';

class DonorAppointmentProvider extends ChangeNotifier {
  List<AppointmentModel> _appointments = [];
  List<AppointmentModel> get appointments => _appointments;
  DonorAppointmentServices donorAppointmentServices = DonorAppointmentServices();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  Future<void> getAppointments(DonorModel donor) async {
    try {
      _isLoading = true;
      _appointments = await donorAppointmentServices.getAppointments(donor);
      notifyListeners();
    } catch (e) {
      print("Error getting appointments: $e");
      _isLoading = false; 
      notifyListeners();
    }
  }
}
