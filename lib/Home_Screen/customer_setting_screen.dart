import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Login_Screen/login_screen.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerSettingScreen extends StatefulWidget {
  const CustomerSettingScreen({super.key});

  @override
  State<CustomerSettingScreen> createState() => _CustomerSettingScreenState();
}

class _CustomerSettingScreenState extends State<CustomerSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                child: Image.asset(
                  Images.bg_3,
                  fit: BoxFit.fill,
                )),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onDoubleTap: () {
                        
                      },
                      child: Card(
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.lock,
                                      size: 25,
                                      color: primaryColor,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Change Password",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  size: 30,
                                  color: primaryColor,
                                )
                              ],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          showSnackBar("Success", "Sucessfully Logout",
                              Colors.greenAccent);

                          Get.offAll(LoginPage());

                          prefs.clear();
                        },
                      child: Card(
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      size: 25,
                                      color: primaryColor,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Logout",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  size: 30,
                                  color: primaryColor,
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
