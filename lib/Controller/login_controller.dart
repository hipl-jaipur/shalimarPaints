import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Home_Screen/home_screen.dart';
import 'package:shalimar/Login_Screen/login_screen.dart';
import 'package:shalimar/Services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController newPassController = TextEditingController();
  TextEditingController conformNewPassController = TextEditingController();

  TextEditingController emailIDController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var userName = "".obs;
  var division = "".obs;
  var status = false.obs;

  var isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    sessionCheckCall();
  }

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
          prefs.setInt('EmployeeId', value['Data'][0]["EmployeeId"]);
          prefs.setString('Division', value['Data'][0]["Division"]);
          prefs.setBool('Status', value['Data'][0]["Status"]);
          prefs.setString('EmployeeName', value['Data'][0]["EmployeeName"]);
          prefs.setString('Email', value['Data'][0]["Email"]);
          prefs.setString(
              'DesignationName', value['Data'][0]["DesignationName"]);
          // prefs.setInt('ProfileSkip', value['Data'][0]["ProfileSkip"]);
          // prefs.setInt('DealerCreation', value['Data'][0]["DealerCreation"]);

          userName.value = value['Data'][0]["EmployeeName"];

          showSnackBar(
              value['Message'], "Sucessfully Login", Colors.greenAccent);
          Get.off(MyHomePage(
              EmployeeName: value['Data'][0]["EmployeeName"],
              Email: value['Data'][0]["Email"],
              DesignationName: value['Data'][0]["DesignationName"]));

          LoginServices.updateLoginData(
                  prefs.getString('Email'), prefs.getInt('EmployeeId'))
              .then((value) {
            if (value != null) {
              showSnackBar(
                  value['Message'], "Login Details Saved", Colors.greenAccent);
            }
          });
        }
      });
    } catch (e) {
      isLoading(false);
    }
  }

  sessionCheckCall() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var employeeID = prefs.getInt('EmployeeId');
    var token = prefs.getString('logintoken');
    isLoading(true);
    try {
      await LoginServices.sessionCheck(employeeID, token).then((value) {
        isLoading(false);
        if (value != null) {
          status.value = value[0]["Status"];
        }
      });
    } catch (e) {
      isLoading(false);
    }
  }

  forgotPasswordCall(BuildContext context) async {
    isLoading(true);
    try {
      await LoginServices.forgotPassword(
        emailIDController.text,
      ).then((value) {
        isLoading(false);
        if (value != null) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Success'),
                  content: Text(value['Message']),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Navigator.pop(context);
                        Get.offAll(LoginPage());
                      },
                    ),
                  ],
                );
              });
          emailIDController.clear();
          // showSnackBar(
          //     value['Message'], "Sucessfully Login", Colors.greenAccent);
        }
      });
    } catch (e) {
      isLoading(false);
    }
  }

  setEmpNewPasswordCall(BuildContext context) async {
    isLoading(true);
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var employee_email = prefs.getString('Email');
      await LoginServices.setEmployeeNewPassword(
              conformNewPassController.text, employee_email)
          .then((value) {
        isLoading(false);
        if (value != null) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Success'),
                  content: Text(value['Message']),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text('Ok'),
                      onPressed: () {
                        prefs.clear();
                        Get.offAll(LoginPage());
                      },
                    ),
                  ],
                );
              });
          emailIDController.clear();
          // showSnackBar(
          //     value['Message'], "Sucessfully Login", Colors.greenAccent);
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
