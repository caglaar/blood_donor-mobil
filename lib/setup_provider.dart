
import 'package:e_blood_donor/providers/donorProvider/login_provider.dart';
import 'package:e_blood_donor/providers/donorProvider/register_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';



class SetupProviders {
  static List<SingleChildWidget> get providers => [
        ChangeNotifierProvider(
          create: (context) => DonorRegisterProvider()),
        ChangeNotifierProvider(
          create: (context) => DonorLoginProvider()),

      ];
  
}