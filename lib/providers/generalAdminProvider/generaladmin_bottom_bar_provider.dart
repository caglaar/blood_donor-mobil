import 'package:flutter/material.dart';

class GeneralAdminBottomBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  PageController pageController = PageController();

  void setSelectedIndex (int index)
  {
    _selectedIndex = index;
    notifyListeners();
  }
}