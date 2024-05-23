import 'package:e_blood_donor/models/hospital_models/hospital_model.dart';
import 'package:e_blood_donor/service/hospital_services/add_hospital_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddHospitalProvider extends ChangeNotifier {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  HospitalModel _hospital = HospitalModel.getEmptyClass();
  AddHospitalService addHospitalService = AddHospitalService();

  HospitalModel get hospital => _hospital;

  set hospital(HospitalModel value) {
    _hospital = value;
    addHospital();
    notifyListeners();
  }

  Future<void> addHospital() async {
    bool _addHospitalService = await addHospitalService.addHospital(hospital);
    if(_addHospitalService){
      print("Hastane ekleme başarılı!");
    }
  }

}

class LocationProvider extends ChangeNotifier {
  LatLng? _selectedLocation;

  LatLng? get selectedLocation => _selectedLocation;

  void selectLocation(LatLng position) {
    _selectedLocation = position;
    notifyListeners();
  }
}
