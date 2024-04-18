import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final GeoPoint startPoint;
  final GeoPoint endPoint;

  MapScreen({Key? key, required this.startPoint, required this.endPoint}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  void _loadMarkers() {
    _addMarker(widget.startPoint.latitude, widget.startPoint.longitude, 'Start Point');
    _addMarker(widget.endPoint.latitude, widget.endPoint.longitude, 'End Point');
  }

  void _addMarker(double lat, double lng, String markerId) {
    final marker = Marker(
      markerId: MarkerId(markerId),
      position: LatLng(lat, lng),
      infoWindow: InfoWindow(title: markerId),
    );
    setState(() {
      _markers.add(marker);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _updateCameraBounds();
  }

  void _updateCameraBounds() {
    if (mapController == null) return;
    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(
        widget.startPoint.latitude < widget.endPoint.latitude ? widget.startPoint.latitude : widget.endPoint.latitude,
        widget.startPoint.longitude < widget.endPoint.longitude ? widget.startPoint.longitude : widget.endPoint.longitude,
      ),
      northeast: LatLng(
        widget.startPoint.latitude > widget.endPoint.latitude ? widget.startPoint.latitude : widget.endPoint.latitude,
        widget.startPoint.longitude > widget.endPoint.longitude ? widget.startPoint.longitude : widget.endPoint.longitude,
      ),
    );
    CameraUpdate update = CameraUpdate.newLatLngBounds(bounds, 50);
    mapController!.animateCamera(update);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.startPoint.latitude, widget.startPoint.longitude),
          zoom: 11.0,
        ),
        markers: _markers,
      ),
    );
  }
}
