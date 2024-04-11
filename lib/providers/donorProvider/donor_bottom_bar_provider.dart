import 'package:flutter/material.dart';

class DonorBottomBarProvider extends ChangeNotifier {
  int _selectecIndex = 0;
  int get selectedIndex => _selectecIndex;
  void setSelectedIndex (int index)
  {
    _selectecIndex = index;
    notifyListeners();
  }
}