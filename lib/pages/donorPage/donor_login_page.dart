import 'package:e_blood_donor/const/button_consts.dart';
import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/pages/donorPage/donor_home_page.dart';
import 'package:e_blood_donor/pages/donorPage/donor_register_page.dart';
import 'package:e_blood_donor/providers/donorProvider/login_provider.dart';
import 'package:e_blood_donor/widgets/homeWidgets/form_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';


class DonorLoginPage extends StatelessWidget {
  const DonorLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Donor Register Login Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: ColorStyles.appBarBackgroundColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<DonorLoginProvider>(
            builder: (context, donorLoginProvider, child) {
              return FormBuilder(
                key: donorLoginProvider.formKey,
                onChanged: () {
                  donorLoginProvider.formKey.currentState!.save();
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormRegister(
                        initialValue: donorLoginProvider.donor.mail,
                        keyValue: 'mail',
                        hintText: 'Mail',
                         validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]), 
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormRegister(
                        initialValue: donorLoginProvider.donor.password,
                        keyValue: 'password',
                        hintText: 'Password',
                        obsText: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () async{
                            if (donorLoginProvider.formKey.currentState!
                                .saveAndValidate()) {
                              donorLoginProvider.formKey.currentState!.save();
                              donorLoginProvider.donor =
                                  donorLoginProvider.donor.copyWith(
                                mail: donorLoginProvider
                                    .formKey.currentState!.value['mail'],
                                password: donorLoginProvider
                                    .formKey.currentState!.value['password'],
                              );
                            }
                            bool isLoggedIn = await donorLoginProvider.signInDonor();
                            if (isLoggedIn) {
                              // Kullanıcı doğru kimlik doğrulaması yaptı, yeni sayfaya yönlendir
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => DonorHomePage(donor: donorLoginProvider.donor),
                                ),
                              );
                            } else {
                              // Kullanıcı doğrulama başarısız oldu, hata mesajı göster
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Kimlik doğrulaması başarısız!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }

                          },
                          child: Text("Login",style: TextStyle(color: Colors.black),),
                          style: ButtonStyles.buttonType,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(onPressed: (){
                          Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => DonorRegisterPage(),
                                ),
                          );
                        }, 
                        child: Text("Register",style: TextStyle(color: Colors.black),),
                        style: ButtonStyles.buttonType,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
