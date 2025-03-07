import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/providers/hospitalProvider/hospital_location_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../functions/generating_functions.dart';

class HospitalMapScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  HospitalMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search location',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final query = _searchController.text;
                    if (query.isNotEmpty) {
                      context
                          .read<HospitalLocationProvider>()
                          .searchLocation(query, _apiKey);
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<HospitalLocationProvider>(
              builder: (context, locationProvider, child) {
                return GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    locationProvider.mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: locationProvider.center,
                    zoom: 15.0,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId('searchedLocation'),
                      position: locationProvider.center,
                    ),
                  },
                );
              },
            ),
          ),
          Consumer<HospitalLocationProvider>(
            builder: (context, locationProvider, child) {
              return ElevatedButton(
                onPressed: () {
                  locationProvider.hospital.hospitalId =
                      GeneratingFunctions.generateRandomId();
                  locationProvider.hospital.name = locationProvider.name;
                  locationProvider.hospital.address = locationProvider.address;
                  locationProvider.hospital.geoPoint = GeoPoint(
                      locationProvider.center.latitude,
                      locationProvider.center.longitude);
                  locationProvider.addHospital();
                },
                child: const Text(
                  'Add Hospital',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
