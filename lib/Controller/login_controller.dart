import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Home_Screen/home_screen.dart';
import 'package:shalimar/Services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var userName = "".obs;

  // var devicesIdGet = "";
  var isLoading = false.obs;

  loginCall() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading(true);
    try {
      await LoginServices.login(
              usernameController.text, passwordController.text)
          .then((value) {
        isLoading(false);
        if (value != null) {
          prefs.setBool('userlogindone', true);
          prefs.setString('logintoken', value['Data'][0]["Token"]);
          userName.value = value['Data'][0]["EmployeeName"];
          showSnackBar(
              value['Message'], "Sucessfully Login", Colors.greenAccent);
          Get.to(const MyHomePage());
        }
      });
    } catch (e) {
      isLoading(false);
    }
  }

  // logoutCall() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   isLoading(true);
  //   try {
  //     await LoginServices.logout().then((value) {
  //       isLoading(false);
  //       if (value != null) {
  //         prefs.clear();

  //         Get.offAll(const OnBoardingScreen());
  //       }
  //     });
  //   } catch (e) {
  //     isLoading(false);
  //   }
  // }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
