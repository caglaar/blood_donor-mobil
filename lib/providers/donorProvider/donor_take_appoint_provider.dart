import 'package:flutter/foundation.dart';

class DonoTakeAppointmentProvider extends ChangeNotifier {
  List<double> _myLocation = [0,0];
  List<double> get myLocation => _myLocation;
  
  List<double> _nearLocation =[0,0];
  List<double> get nearLocation => nearLocation;
  
  bool _pressedButton = false;
  bool get pressedButton => _pressedButton;
  
  int _isAppoitmentLoading = 0;
  int get isAppoitmentLoading => _isAppoitmentLoading;
  
  Future<void> takeAppointments() async {
    try {
      _pressedButton = true;
      _isAppoitmentLoading = 1;
      //_myLocation = await x;
      notifyListeners();
      print("1.try girdi");
      await Future.delayed(const Duration(seconds: 10),(){
      });
      notifyListeners();
      try {
        //_nearLocation = await xx;
        _isAppoitmentLoading = 2;
        print("2.try içinde");
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