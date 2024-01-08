import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shalimar/Controller/login_controller.dart';
import 'package:shalimar/Elements/common_button_widget.dart';
import 'package:shalimar/Elements/custom_text_field.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                                  child: Image.asset(Images.shalimarLogoHorizontal),
                                ),
                                CustomTextField(
                                  controller:
                                      loginController.usernameController,
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
                                CustomTextField(
                                  controller:
                                      loginController.passwordController,
                                  AutovalidateModes:
                                      AutovalidateMode.onUserInteraction,
                                  hintText: 'Enter Password',
                                  labelText: 'Password*',
                                  obscureText: showPassword,
                                  onIconTap: () {},
                                  icon: Container(
                                    height: 14,
                                    margin: const EdgeInsets.all(15),
                                    width: 14,
                                    child: const Icon(Icons.lock_outline),
                                  ),
                                  isTrue: true,
                                  isPassword: true,
                                  iconPerfix: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    },
                                    child: Container(
                                      height: 14,
                                      margin: EdgeInsets.all(15),
                                      width: 14,
                                      child: showPassword
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "The Password is required.";
                                    }
                                    if (value.length < 6) {
                                      return "The password field must be at least 6 characters";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 40),
                                  child: CustomButton(
                                    btnName: 'Login Now',
                                    onPressed: () {
                                      // Get.to(MyHomePage());
                                      // Get.to(TakeOrderPage());
                                      if (_formKey.currentState!.validate()) {
                                        loginController.loginCall();
                                      }
                                    },
                                  ),
                                ),
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
