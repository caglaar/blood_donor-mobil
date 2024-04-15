import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class HaversineAlgorithm {
  static double radians (double degrees)
  {
    return (degrees * pi / 100);
  }
  
  static double  getDistance (GeoPoint location1, GeoPoint location2)
  {
    double R = 6371; //Radius of the Earth(km)
    double phi1 = radians(location1.latitude);
    double phi2 = radians(location2.latitude);
    double deltaPhi = radians(location2.latitude - location1.latitude);
    double deltaLambda = radians(location2.longitude - location1.longitude);

    double a = pow(sin(deltaPhi / 2), 2) + cos(phi1) * cos(phi2) * pow(sin(deltaLambda / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return (R * c);
  }
}