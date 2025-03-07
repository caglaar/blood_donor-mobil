import 'package:e_blood_donor/const/button_consts.dart';
import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/pages/adminPage/admin_home_page.dart';
import 'package:e_blood_donor/pages/donorPage/donor_home_page.dart';
import 'package:e_blood_donor/pages/donorPage/donor_register_page.dart';
import 'package:e_blood_donor/pages/generalAdminPage/generaladmin_home_page.dart';
import 'package:e_blood_donor/pages/staffPage/staff_home_page.dart';
import 'package:e_blood_donor/providers/auth_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../../const/password_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome E-Blood Donor App",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: ColorStyles.appBarBackgroundColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<AuthServiceProvider>(
            builder: (context, authServiceProvider, child) {
              return FormBuilder(
                key: authServiceProvider.formKey,
                onChanged: () {
                  authServiceProvider.formKey.currentState!.save();
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormBuilderTextField(
                        name: 'mail',
                        decoration: InputDecoration(
                          labelText: 'Mail',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: const Icon(Icons.email),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      PasswordField(
                        name: 'password',
                        hintText: 'Password',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(6),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (authServiceProvider.formKey.currentState!
                                .saveAndValidate()) {
                              authServiceProvider.formKey.currentState!.save();
                              authServiceProvider.user =
                                  authServiceProvider.user.copyWith(
                                mail: authServiceProvider
                                    .formKey.currentState!.value['mail'],
                                password: authServiceProvider
                                    .formKey.currentState!.value['password'],
                              );
                            }
                            //Genel Admin Yönlendirme
                            if (authServiceProvider.user.mail ==
                                    "admin@gmail.com" &&
                                authServiceProvider.user.password == "adminn") {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const GeneralAdminHomePage(),
                                ),
                              );
                            } else {
                              int isLoggedIn =
                                  await authServiceProvider.signIn();
                              //Donor Yönlendirme
                              if (isLoggedIn == 0) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => DonorHomePage(
                                        donor: authServiceProvider.donor),
                                  ),
                                );
                              }
                              //Staff Yönlendirme
                              else if (isLoggedIn == 1) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => StaffHomePage(
                                        staff: authServiceProvider.staff),
                                  ),
                                );
                              }
                              //Admin Yönlendirme
                              else if (isLoggedIn == 2) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => AdminHomePage(
                                        admin: authServiceProvider.admin),
                                  ),
                                );
                              }
                              // Kullanıcı doğrulama başarısız oldu, hata mesajı göster
                              else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Kimlik doğrulaması başarısız!'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            }
                          },
                          style: ButtonStyles.buttonType,
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      //Register Sayfası kısmı
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const DonorRegisterPage(),
                              ),
                            );
                          },
                          style: ButtonStyles.buttonType,
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.black),
                          ),
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
