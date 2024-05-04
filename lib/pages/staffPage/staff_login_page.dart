import 'package:e_blood_donor/const/button_consts.dart';
import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/pages/staffPage/staff_home_page.dart';
import 'package:e_blood_donor/providers/staffProvider/staff_login_provider.dart';
import 'package:e_blood_donor/widgets/homeWidgets/form_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class StaffLoginPage extends StatefulWidget {
  const StaffLoginPage({Key? key}) : super(key: key);

  @override
  State<StaffLoginPage> createState() => _StaffLoginPageState();
}

class _StaffLoginPageState extends State<StaffLoginPage> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text(
    //       "Staff Login Page",
    //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //     ),
    //     centerTitle: true,
    //     toolbarHeight: 100,
    //     backgroundColor: ColorStyles.appBarBackgroundColor,
    //   ),
    //   body: Center(
    //     child: Padding(
    //       padding: const EdgeInsets.all(20.0),
    //       child: Form(
    //         key: _formKey,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             TextFormField(
    //               controller: _emailController,
    //               decoration: const InputDecoration(
    //                 hintText: 'Enter your email',
    //               ),
    //               validator: (String? value) {
    //                 if (value == null || value.isEmpty) {
    //                   return 'Please enter some text';
    //                 }
    //                 return null;
    //               },
    //             ),
    //             TextFormField(
    //               controller: _passwordController,
    //               decoration: const InputDecoration(
    //                 hintText: 'Enter your password',
    //               ),
    //               validator: (String? value) {
    //                 if (value == null || value.isEmpty) {
    //                   return 'Please enter some text';
    //                 }
    //                 return null;
    //               },
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(vertical: 16.0),
    //               child: ElevatedButton(
    //                 onPressed: () {
                      
    //                 },
    //                 child: const Text('Submit'),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Staff Login Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: ColorStyles.appBarBackgroundColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<StaffLoginProvider>(
            builder: (context, staffLoginProvider, child) {
              return FormBuilder(
                key: staffLoginProvider.formKey,
                onChanged: () {
                  staffLoginProvider.formKey.currentState!.save();
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormRegister(
                        initialValue: staffLoginProvider.staff.mail,
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
                        initialValue: staffLoginProvider.staff.password,
                        keyValue: 'password',
                        hintText: 'Password',
                        obsText: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () async{
                            if (staffLoginProvider.formKey.currentState!
                                .saveAndValidate()) {
                              staffLoginProvider.formKey.currentState!.save();
                              staffLoginProvider.staff =
                                  staffLoginProvider.staff.copyWith(
                                mail: staffLoginProvider
                                    .formKey.currentState!.value['mail'],
                                password: staffLoginProvider
                                    .formKey.currentState!.value['password'],
                              );
                            }
                            bool isLoggedIn = await staffLoginProvider.signInStaff();
                            if (isLoggedIn) {
                              // Kullanıcı doğru kimlik doğrulaması yaptı, yeni sayfaya yönlendir
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => StaffHomePage(staff: staffLoginProvider.staff),
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
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 16.0),
                      //   child: ElevatedButton(onPressed: (){
                      //     Navigator.of(context).pushReplacement(
                      //           MaterialPageRoute(
                      //             builder: (context) => DonorRegisterPage(),
                      //           ),
                      //     );
                      //   }, 
                      //   child: Text("Register",style: TextStyle(color: Colors.black),),
                      //   style: ButtonStyles.buttonType,
                      //   ),
                      // )
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

  //@override
  // void dispose() {
  //   _emailController.dispose();
  //   super.dispose();
  // }
}
