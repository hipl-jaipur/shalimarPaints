import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/login_controller.dart';
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
  LoginController loginController = Get.put(LoginController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginController.sessionCheckCall();

    setValue();
    // Timer(Duration(seconds: 3), () => Get.off(LoginPage()) );
  }

  void setValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // var status = prefs.getBool('Status');
    var eName = prefs.getString('EmployeeName');
    var email = prefs.getString('Email');
    var designationName = prefs.getString('DesignationName');
    var employeeID = prefs.getInt('EmployeeId');
    var token = prefs.getString('logintoken');
    var status =prefs.getBool("userlogindone")??false;

    // LoginServices.sessionCheck(employeeID, token).then((value) => {
    //       if (value != null) {status = value['Status']}
    //     });

    Timer(Duration(seconds: 3), () {
      if (status) {
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
