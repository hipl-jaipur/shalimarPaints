import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shalimar/Controller/login_controller.dart';
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Elements/common_button_widget.dart';
import 'package:shalimar/Elements/custom_text_field.dart';
import 'package:shalimar/utils/images.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  bool showPassword = true;
  bool showConfirmPassword = true;
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
                      Image.asset(Images.bg_3),
                      Positioned(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              top: 12, left: 15, right: 15, bottom: 25),
                          // margin: const EdgeInsets.only(left: 16, right: 16),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: Icon(
                                          Icons.arrow_circle_left,
                                          color: Colors.white,
                                          size: 40,
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Change Password",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SingleChildScrollView(
                                        child: Column(
                                      children: [
                                        CustomTextField(
                                          controller:
                                              loginController.newPassController,
                                          AutovalidateModes: AutovalidateMode
                                              .onUserInteraction,
                                          hintText: 'New Password',
                                          labelText: 'New Password*',
                                          obscureText: showPassword,
                                          onIconTap: () {},
                                          icon: Container(
                                            height: 14,
                                            margin: const EdgeInsets.all(15),
                                            width: 14,
                                            child:
                                                const Icon(Icons.lock_outline),
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
                                                  ? const Icon(
                                                      Icons.visibility_off)
                                                  : const Icon(
                                                      Icons.visibility),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "The Password is required.";
                                            }
                                            if (value.length < 6) {
                                              return "The password field must be at least 6 characters";
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          controller: loginController
                                              .conformNewPassController,
                                          AutovalidateModes: AutovalidateMode
                                              .onUserInteraction,
                                          hintText: 'Confirm New Password',
                                          labelText: 'Confirm New Password*',
                                          obscureText: showConfirmPassword,
                                          onIconTap: () {},
                                          icon: Container(
                                            height: 14,
                                            margin: const EdgeInsets.all(15),
                                            width: 14,
                                            child:
                                                const Icon(Icons.lock_outline),
                                          ),
                                          isTrue: true,
                                          isPassword: true,
                                          iconPerfix: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                showConfirmPassword =
                                                    !showConfirmPassword;
                                              });
                                            },
                                            child: Container(
                                              height: 14,
                                              margin: EdgeInsets.all(15),
                                              width: 14,
                                              child: showConfirmPassword
                                                  ? const Icon(
                                                      Icons.visibility_off)
                                                  : const Icon(
                                                      Icons.visibility),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "The Password is required.";
                                            }
                                            if (value.length < 6) {
                                              return "The password field must be at least 6 characters";
                                            }
                                            return null;
                                          },
                                        ),SizedBox(height: 50,),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: CustomButton(
                                            btnName: 'Change Password',
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                if (controller
                                                        .conformNewPassController
                                                        .text ==
                                                    controller.newPassController
                                                        .text) {
                                                  controller
                                                      .setEmpNewPasswordCall(
                                                          context);
                                                } else {
                                                  showSnackBar(
                                                      "Sorry!!",
                                                      "Confirm New Password is not Match New Password.",
                                                      Colors.redAccent);
                                                }

                                                // controller.forgotPasswordCall(context);
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
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
