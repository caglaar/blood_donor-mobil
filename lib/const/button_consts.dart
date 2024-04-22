import 'package:e_blood_donor/const/color_const.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  static final ButtonStyle buttonType = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(ColorStyles.appBarBackgroundColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),),);


}