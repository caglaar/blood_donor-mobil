import 'package:e_blood_donor/models/donor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterProvider extends ChangeNotifier {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  DonorModel _donor = DonorModel.getEmptyClass();

  DonorModel get donor => _donor;

  set donor(DonorModel value) {
    _donor = value;
    notifyListeners();
  }

  void updateValues() {
    // DonorModel'in ilgili alanları zaten MyTextFormWidget'lar üzerinden güncellendiği için burada ayrıca güncelleme yapmanıza gerek yok
    notifyListeners();
    print(donor.toString());
  }
}
