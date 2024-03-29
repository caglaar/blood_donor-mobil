import 'package:e_blood_donor/models/user_models/donor_model.dart';
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
}
