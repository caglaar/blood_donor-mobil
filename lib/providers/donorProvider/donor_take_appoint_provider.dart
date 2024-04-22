import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/models/users_models/donor_model.dart';
import 'package:e_blood_donor/service/donor_services/donor_apoointment_service.dart';
import 'package:e_blood_donor/service/donor_services/donor_location_service.dart';
import 'package:flutter/foundation.dart';

class DonoTakeAppointmentProvider extends ChangeNotifier {
  GeoPoint _myLocation = GeoPoint(0, 0);
  GeoPoint get myLocation => _myLocation;
  
  GeoPoint _nearHospitalLocation = GeoPoint(0, 0);
  GeoPoint get nearLocation => _nearHospitalLocation;
  
  bool _pressedButton = false;
  bool get pressedButton => _pressedButton;
  
  int _isAppoitmentLoading = 0;
  int get isAppoitmentLoading => _isAppoitmentLoading;
  DonorAppointmentServices donorAppointmentServices =  DonorAppointmentServices();

  void  finishAppointment()
  {
    _isAppoitmentLoading = 3;
    notifyListeners();
  }
  Future<void> takeAppointments(DonorModel donor) async {
    try {
      _pressedButton = true;
      _isAppoitmentLoading = 1;
      _myLocation = await Location.getCurrentLocation();
      print("My Location = ${_myLocation}");
      notifyListeners();
      await Future.delayed(const Duration(seconds: 5),(){
      });
      notifyListeners();
      try {
        _nearHospitalLocation = await donorAppointmentServices.takeAppointment(_myLocation,donor);
        print("My Location = ${_nearHospitalLocation}");
        _isAppoitmentLoading = 2;
        notifyListeners();
      } catch (e) {
        print("Error taking appointments: $e");
        _isAppoitmentLoading = 1; 
        notifyListeners();
      }
    } catch (e) {
      _pressedButton = true;
      print("Error taking appointments: $e");
      _isAppoitmentLoading = 0; 
      notifyListeners();
    }
  }
}