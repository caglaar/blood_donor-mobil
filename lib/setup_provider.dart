

import 'package:e_blood_donor/providers/adminProvider/add_staff_provider.dart';
import 'package:e_blood_donor/providers/adminProvider/admin_bottom_bar_provider.dart';
import 'package:e_blood_donor/providers/adminProvider/login_provider.dart';
import 'package:e_blood_donor/providers/donorProvider/donor_appointment_provider.dart';
import 'package:e_blood_donor/providers/donorProvider/donor_bottom_bar_provider.dart';
import 'package:e_blood_donor/providers/donorProvider/donor_take_appoint_provider.dart';
import 'package:e_blood_donor/providers/donorProvider/login_provider.dart';
import 'package:e_blood_donor/providers/staffProvider/staff_login_provider.dart';
import 'package:e_blood_donor/providers/staffProvider/staff_bottom_bar_provider.dart';
import 'package:e_blood_donor/providers/staffProvider/staff_appointment_provider.dart';
import 'package:e_blood_donor/providers/donorProvider/register_provider.dart';
import 'package:e_blood_donor/providers/generalAdminProvider/generaladmin_bottom_bar_provider.dart';
import 'package:e_blood_donor/providers/generalAdminProvider/register_hospitalAdmin_provider.dart';
import 'package:e_blood_donor/providers/hospitalProvider/add_hospital_provider.dart';
import 'package:e_blood_donor/providers/hospitalProvider/update_stock_provider.dart';
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
          create: (context) => AdminLoginProvider()),
        ChangeNotifierProvider(
         create: (context) => AdminBottomBarProvider()),
        ChangeNotifierProvider(
          create: (context) => GeneralAdminBottomBarProvider()),
        ChangeNotifierProvider(
          create: (context) => HospitalAdminRegisterProvider()),
        ChangeNotifierProvider(
            create: (context) => LocationProvider()),
        ChangeNotifierProvider(
            create: (context) => AddHospitalProvider()),
        ChangeNotifierProvider(
            create: (context) => AddStaffProvider()),
          ChangeNotifierProvider(
          create: (context) => StaffLoginProvider()),
          ChangeNotifierProvider(
          create: (context) => StaffBottomBarProvider()),
          ChangeNotifierProvider(
          create: (context) => StaffAppointmentProvider()),
      ];
 
}
