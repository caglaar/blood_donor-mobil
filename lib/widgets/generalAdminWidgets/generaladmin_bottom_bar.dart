import 'package:e_blood_donor/const/color_const.dart';
import 'package:flutter/material.dart';

class GeneralAdminBottomBar extends StatelessWidget {
  const GeneralAdminBottomBar({super.key, required this.currentIndex, required this.onItemTapped });
  final int currentIndex;
  final ValueChanged<int> onItemTapped;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.local_hospital_outlined,size: 36,),
          label: 'Add Hospital',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined,size: 36,),
          label: 'Add Hospital Admin',
        ),
      ],
      currentIndex: currentIndex,
      onTap: onItemTapped,
      selectedItemColor: ColorStyles.appBarBackgroundColor,
      unselectedItemColor: Colors.black,
    );
  }
}