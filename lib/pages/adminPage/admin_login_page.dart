import 'package:e_blood_donor/const/button_consts.dart';
import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/pages/adminPage/admin_home_page.dart';
import 'package:e_blood_donor/pages/generalAdminPage/generaladmin_home_page.dart';
import 'package:e_blood_donor/providers/adminProvider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_blood_donor/widgets/homeWidgets/form_register.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';


class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin Login Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: ColorStyles.appBarBackgroundColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<AdminLoginProvider>(
            builder: (context, adminLoginProvider, child) {
              return FormBuilder(
                key: adminLoginProvider.formKey,
                onChanged: () {
                  adminLoginProvider.formKey.currentState!.save();
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormRegister(
                        initialValue: adminLoginProvider.admin.mail,
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
                        initialValue: adminLoginProvider.admin.password,
                        keyValue: 'password',
                        hintText: 'Password',
                        obsText: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () async{
                            if (adminLoginProvider.formKey.currentState!
                                .saveAndValidate()) {
                              adminLoginProvider.formKey.currentState!.save();
                              adminLoginProvider.admin =
                                  adminLoginProvider.admin.copyWith(
                                    mail: adminLoginProvider
                                        .formKey.currentState!.value['mail'],
                                    password: adminLoginProvider
                                        .formKey.currentState!.value['password'],
                                  );
                            }
                            if(adminLoginProvider.admin.mail == "admin@gmail.com" && adminLoginProvider.admin.password == "adminn")
                              {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => GeneralAdminHomePage(),
                                  ),
                                );
                              }
                            else {
                              print("DEVAMKEEE");
                              bool isLoggedIn = await adminLoginProvider
                                  .signInAdmin();

                              if (isLoggedIn) {
                                // Kullanıcı doğru kimlik doğrulaması yaptı, yeni sayfaya yönlendir
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AdminHomePage(
                                          admin: adminLoginProvider.admin,
                                          hospital: adminLoginProvider
                                              .hospital,),
                                  ),
                                );
                              }

                              else {
                                // Kullanıcı doğrulama başarısız oldu, hata mesajı göster
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Kimlik doğrulaması başarısız!'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            }
                          },

                          child: Text("Login",style: TextStyle(color: Colors.black),),
                          style: ButtonStyles.buttonType,
                        ),
                      ),
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
