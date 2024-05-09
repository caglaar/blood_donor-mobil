import 'package:flutter/material.dart';

class StaffBottomBarProvider extends ChangeNotifier {
  int _selectecIndex = 0;
  int get selectedIndex => _selectecIndex;
  
  PageController pageController = PageController();

  void setSelectedIndex (int index)
  {
    _selectecIndex = index;
    notifyListeners();
  }
}