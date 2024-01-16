import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Home_Screen/home_screen.dart';
import 'package:shalimar/Login_Screen/login_screen.dart';
import 'package:shalimar/utils/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setValue();
    // Timer(Duration(seconds: 3), () => Get.off(LoginPage()) );
  }

  void setValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('Status');
    var eName = prefs.getString('EmployeeName');
    var email = prefs.getString('Email');
    var designationName = prefs.getString('DesignationName');
    Timer(Duration(seconds: 3), () {
      if (status == true) {
        Get.off(MyHomePage(
            EmployeeName: eName.toString(),
            Email: email.toString(),
            DesignationName: designationName.toString()));
      } else {
        Get.off(LoginPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              child: Image.asset(
                Images.splashbg,
                fit: BoxFit.fill,
              )),
        ],
      )),
    );
  }
}
