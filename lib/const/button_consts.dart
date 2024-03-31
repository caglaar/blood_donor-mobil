import 'package:flutter/material.dart';

class ButtonStyles {
  static final ButtonStyle buttonType = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),),);


}