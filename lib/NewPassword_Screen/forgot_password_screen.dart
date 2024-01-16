import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shalimar/Controller/login_controller.dart';
import 'package:shalimar/Elements/common_button_widget.dart';
import 'package:shalimar/Elements/custom_text_field.dart';
import 'package:shalimar/utils/images.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool showPassword = true;
  String versionName = "";
  final _formKey = GlobalKey<FormState>();
  var loginController = Get.put(LoginController());

  Future<void> getVersionName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    versionName = packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<LoginController>(
            init: LoginController(),
            builder: (LoginController controller) {
              return ModalProgressHUD(
                inAsyncCall: controller.isLoading.value,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Stack(
                    children: [
                      Image.asset(Images.bg_2),
                      Positioned(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              top: 12, left: 15, right: 15, bottom: 25),
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: Image.asset(
                                      Images.shalimarLogoHorizontal),
                                ),
                                Text(
                                  "Reset Password",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                CustomTextField(
                                  controller:
                                      loginController.emailIDController,
                                  AutovalidateModes:
                                      AutovalidateMode.onUserInteraction,
                                  hintText: 'Enter Email',
                                  labelText: 'Email*',
                                  onIconTap: () {},
                                  icon: Container(
                                    height: 14,
                                    margin: const EdgeInsets.all(15),
                                    width: 14,
                                    child: const Icon(Icons.mail_outline),
                                  ),
                                  isTrue: true,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "The Email is required.";
                                    }
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: CustomButton(
                                    btnName: 'Reset Password',
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        controller.forgotPasswordCall(context);
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // CustomTextField(
                                //   controller:
                                //       loginController.usernameController,
                                //   AutovalidateModes:
                                //       AutovalidateMode.onUserInteraction,
                                //   hintText: 'Enter OTP',
                                //   labelText: 'OTP*',
                                //   onIconTap: () {},
                                //   icon: Container(
                                //     height: 14,
                                //     margin: const EdgeInsets.all(15),
                                //     width: 14,
                                //     child: const Icon(Icons.mail_outline),
                                //   ),
                                //   isTrue: true,
                                //   obscureText: false,
                                //   validator: (value) {
                                //     if (value == null || value.isEmpty) {
                                //       return "The Email is required.";
                                //     }
                                //     return null;
                                //   },
                                // ),
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.symmetric(vertical: 10),
                                //   child: CustomButton(
                                //     btnName: 'Reset Password',
                                //     onPressed: () {
                                //       if (_formKey.currentState!.validate()) {

                                //       }
                                //     },
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
