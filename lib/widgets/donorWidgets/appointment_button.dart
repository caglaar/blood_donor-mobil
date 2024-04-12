import 'package:e_blood_donor/const/button_consts.dart';
import 'package:e_blood_donor/const/text_consts.dart';
import 'package:flutter/material.dart';

class TakeAppointmentButton extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;
  const TakeAppointmentButton({Key? key, required this.message, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonWidth = screenWidth * 0.8; // Ekran genişliğinin %80'i kadar bir genişlik
    final buttonHeight = screenHeight * 0.1;
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          message,
          style: TextStyles.buttonStyle,
        ),
        style: ButtonStyles.buttonType,
      ),
    );
  }
}