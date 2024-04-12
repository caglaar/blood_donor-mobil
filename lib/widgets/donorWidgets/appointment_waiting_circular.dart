import 'package:e_blood_donor/const/color_const.dart';
import 'package:flutter/material.dart';

class AppointmentWaitingCircular extends StatelessWidget {
  const AppointmentWaitingCircular({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "A suitable appointment is being created for you",
                style: TextStyle(fontSize: 15, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 20), 
          SizedBox(
            width: 60, 
            height: 60, 
            child: CircularProgressIndicator(
              strokeWidth: 6, 
              color: ColorStyles.appBarBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
