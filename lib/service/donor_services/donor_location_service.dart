
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  static Future<GeoPoint> getCurrentLocation() async
  {
    bool serviceEnabled =  await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled)
    {
      return (Future.error('Location services are disabled'));
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied)
    {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return (Future.error('Location services are disabled'));
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return (Future.error('Location permissions are permanently denied, we cannot request'));
    }
    Position position = await Geolocator.getCurrentPosition();
    GeoPoint location = GeoPoint(position.latitude, position.longitude);
    return (location);
  }
}