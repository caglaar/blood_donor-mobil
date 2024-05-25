import 'package:e_blood_donor/widgets/generalAdminWidgets/add_hospital_body.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../providers/hospitalProvider/add_hospital_provider.dart';


class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    final LatLng? selectedLocation = locationProvider.selectedLocation;

    return Stack(
      children: [
        GoogleMap(
          onTap: (position) {
            locationProvider.selectLocation(position);
            print('Tıklanan Yer: ${position.latitude}, ${position.longitude}');
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(40.823052, 29.929726), // Başlangıç konumu Kocaeli Üniversitesi
            zoom: 12,
          ),
          markers: selectedLocation == null
              ? {}
              : {
            Marker(
              markerId: MarkerId('Selected Location'),
              position: selectedLocation,
            ),
          },
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: ElevatedButton(
            onPressed: selectedLocation == null
                ? null
                : () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AddHospitalPage(
                    latitude: selectedLocation.latitude,
                    longitude: selectedLocation.longitude,
                  ),
                ),
              );
            },
            child: Text('Add Hospital Here'),
          ),
        ),
      ],
    );
  }
}