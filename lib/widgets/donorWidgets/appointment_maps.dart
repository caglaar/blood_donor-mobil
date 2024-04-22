import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/providers/donorProvider/donor_take_appoint_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

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
  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _loadMarkers();
    _drawRoute();
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

  void _zoomOut() {
    mapController?.animateCamera(CameraUpdate.zoomOut());
  }

  void _drawRoute() async {
    final apiKey = "AIzaSyAiLnhXktavb1xDQOEoxyiTGE5Uc2TFhrU";
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/directions/json?origin=${widget.startPoint.latitude},${widget.startPoint.longitude}&destination=${widget.endPoint.latitude},${widget.endPoint.longitude}&mode=driving&key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      final List<LatLng> routePoints = _decodePolyline(
          decodedResponse['routes'][0]['overview_polyline']['points']);

      _polylines.add(Polyline(
        polylineId: PolylineId('route'),
        points: routePoints,
        color: Colors.red,
        width: 3,
      ));

      setState(() {});
    } else {
      throw Exception('Failed to load directions');
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int b;
      int shift = 0;
      int result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;
      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return points;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DonoTakeAppointmentProvider>(
        builder: (context, takeAppointmentProvider, child) {
          return Stack(
            children: [
              GoogleMap(
                onMapCreated: _onMapCreated,
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                  Factory<OneSequenceGestureRecognizer>(()=> EagerGestureRecognizer(),)
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(widget.startPoint.latitude, widget.startPoint.longitude),
                  zoom: 11.0,
                ),
                markers: _markers,
                polylines: _polylines,
              ),
              Positioned(
                left: 16,
                bottom: 16,
                child: FloatingActionButton(
                  onPressed: _zoomOut,
                  child: Icon(Icons.zoom_out),
                ),
              ),
              Positioned(
                bottom: 16.0, // Bottom'dan uzaklık
                right: MediaQuery.of(context).size.width / 2 - 28, // Sağdan uzaklık
                child: FloatingActionButton(
                  onPressed: () => takeAppointmentProvider.finishAppointment(),
                  child: Text("Finish"),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
