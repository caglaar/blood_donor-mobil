import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../models/hospital_models/hospital_model.dart';
import '../../service/hospital_services/add_hospital_services.dart';

class HospitalLocationProvider with ChangeNotifier {
  HospitalModel _hospital = HospitalModel.getEmptyClass();
  AddHospitalService addHospitalService = AddHospitalService();
  LatLng _center = const LatLng(39.9255, 32.8369); // Başlangıçta Anıtkabir'in konumu
  String _address = '';
  String _name = '';
  GoogleMapController? _mapController;

  LatLng get center => _center;
  String get address => _address;
  String get name => _name;


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

  set mapController(GoogleMapController controller) {
    _mapController = controller;
  }

  Future<void> searchLocation(String query, String apiKey) async {
    final url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        final result = data['results'][0];
        _name = result['name'];
        final location = result['geometry']['location'];
        final latitude = location['lat'];
        final longitude = location['lng'];
        _center = LatLng(latitude, longitude);
        _address = result['formatted_address'];
        notifyListeners();
        _updateMapLocation();
      } else {
        print('Error: ${data['status']}');
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }


  void _updateMapLocation() {
    if (_mapController != null) {
      _mapController!.animateCamera(CameraUpdate.newLatLng(_center));
    }
  }

}
