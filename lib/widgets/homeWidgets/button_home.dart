import 'package:e_blood_donor/const/buttonConsts.dart';
import 'package:e_blood_donor/const/textConsts.dart';
import 'package:flutter/material.dart';

class ButtonHome extends StatelessWidget {
  final String message;

  const ButtonHome({Key? key, required this.message}) : super(key: key);

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
        onPressed: () {},
        child: Text(
          message,
          style: TextStyles.buttonStyle, // İsteğe bağlı olarak metin boyutunu ayarlayabilirsiniz
        ),
        style: ButtonStyles.buttonType,
      ),
    );
  }
}