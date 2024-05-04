

import 'package:e_blood_donor/providers/donorProvider/donor_appointment_provider.dart';
import 'package:e_blood_donor/providers/donorProvider/donor_bottom_bar_provider.dart';
import 'package:e_blood_donor/providers/donorProvider/donor_take_appoint_provider.dart';
import 'package:e_blood_donor/providers/donorProvider/login_provider.dart';
import 'package:e_blood_donor/providers/staffProvider/staff_login_provider.dart';
import 'package:e_blood_donor/providers/donorProvider/register_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';



class SetupProviders {
  static List<SingleChildWidget> get providers => [
        ChangeNotifierProvider(
          create: (context) => DonorRegisterProvider()),
        ChangeNotifierProvider(
          create: (context) => DonorLoginProvider()),
        ChangeNotifierProvider(
          create: (context) => DonorBottomBarProvider()),
        ChangeNotifierProvider(
          create: (context) => DonorAppointmentProvider()),
        ChangeNotifierProvider(
          create: (context) => DonoTakeAppointmentProvider()),
          ChangeNotifierProvider(
          create: (context) => StaffLoginProvider()),
      ];
  
}
