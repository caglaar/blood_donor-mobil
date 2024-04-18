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
          icon: Icon(Icons.home,size: 36,),
          label: 'Appointments',
          
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map,size: 36,),
          label: 'Information',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.align_vertical_bottom_rounded,size: 36,),
          label: 'Take Appointment',
        ),
      ],
      currentIndex: currentIndex,
      onTap: onItemTapped,
    );
  }
}