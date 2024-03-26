import 'package:e_blood_donor/models/donor_model.dart';
import 'package:flutter/material.dart';


class RegisterProvider extends ChangeNotifier {
  DonorModel donor = DonorModel.getEmptyClass();
  
  void updateValues() {
    // DonorModel'in ilgili alanları zaten MyTextFormWidget'lar üzerinden güncellendiği için burada ayrıca güncelleme yapmanıza gerek yok
    notifyListeners();
    print(donor.toString());
  }
}