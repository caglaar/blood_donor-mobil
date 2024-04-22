import 'package:e_blood_donor/const/color_const.dart';
import 'package:flutter/material.dart';

class DonorBottomBar extends StatelessWidget {
  const DonorBottomBar({super.key, required this.currentIndex, required this.onItemTapped });
  final int currentIndex;
  final ValueChanged<int> onItemTapped;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.local_hospital_outlined,size: 36,),
          label: 'Appointments',
          
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined,size: 36,),
          label: 'Information',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined,size: 36,),
          label: 'Take Appointment',
        ),
      ],
      currentIndex: currentIndex,
      onTap: onItemTapped,
      selectedItemColor: ColorStyles.appBarBackgroundColor,
      unselectedItemColor: Colors.black,
    );
  }
}