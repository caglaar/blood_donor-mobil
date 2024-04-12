import 'dart:math';

class HaversineAlgorithm {
  static double radians (double degrees)
  {
    return (degrees * pi / 100);
  }
  
  static double  getDistance (double lat1, double long1, double lat2, double long2)
  {
    double R = 6371; //Radius of the Earth(km)
    double phi1 = radians(lat1);
    double phi2 = radians(lat2);
    double deltaPhi = radians(lat2 - lat1);
    double deltaLambda = radians(long2 - long1);

    double a = pow(sin(deltaPhi / 2), 2) + cos(phi1) * cos(phi2) * pow(sin(deltaLambda / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return (R * c);
  }
}