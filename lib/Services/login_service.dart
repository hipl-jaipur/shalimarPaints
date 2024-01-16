import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginServices {
  static Future login(var userName, password) async {
    if (kDebugMode) {
      print('Login api called');
    }

    final body = {
      "EmployeeCode": userName,
      "Password": password,
    };

    final userMaster = {"USERMASTER": body};
    print(jsonEncode(userMaster));

    if (kDebugMode) {
      print("******Login Api Call****");
    }

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    print(requestHeaders);

    if (kDebugMode) {
      print("**********");
    }

    final res = await http.post(Uri.parse(AppConstants.login),
        body: jsonEncode(userMaster), headers: requestHeaders);

    print(res);

    if (kDebugMode) {
      print("******Login Api Call****");
      print("******Login Api Call****");
      print(AppConstants.login);
      print(requestHeaders);
      print(userMaster);
      print(res.statusCode);
    }

    var data = json.decode(res.body);

    if (kDebugMode) {
      print(data);
    }

    if (res.statusCode == 200) {
      if (data != null) {
        if (data['Data'] != null) {
          // updateLoginData(data['Data'][0]['EmployeeId']);
          return data;
        } else {
          showSnackBar("Error!!", data['Message'], Colors.redAccent);
          return null;
        }
      } else {
        showSnackBar("Error!!", data['Message'], Colors.redAccent);
        return null;
      }
    } else {
      showSnackBar("Error!!", data['Message'], Colors.redAccent);
      return null;
    }
  }

  static Future updateLoginData(employeeID) async {
    if (kDebugMode) {
      print('update Login Data api called');
    }

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("logintoken");

    final body = {
      "LoginHistoryMaster": {
        "EmployeeId": employeeID.toString(),
        "Source": "",
        "OS": Platform.operatingSystem,
        "MobileModelName": androidInfo.brand,
        //  Platform.isAndroid ? androidInfo.model : iosInfo.utsname.machine,
        "MobileModelNumber": androidInfo.model,
        "PIN": "",
        "GCMRegId": "",
        "Version": androidInfo.version,
        "IMEI": Platform.operatingSystem == "ios" ? "iOS Device" : "Andorid",
        "IP": "string",
        "LoginDateTime": DateTime.now().toString(),
        "UserId": employeeID,
        "IsActive": 0,
        "FireBaseToken": token
      }
    };

    if (kDebugMode) {
      print("******Update Login Data Api Call****");
    }

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    print(requestHeaders);

    if (kDebugMode) {
      print("**********");
    }

    final res = await http.post(Uri.parse(AppConstants.updateLoginData),
        body: jsonEncode(body), headers: requestHeaders);

    print(res);

    if (kDebugMode) {
      print(AppConstants.updateLoginData);
      print(requestHeaders);
      print(body);
      print(res.statusCode);
    }

    var data = json.decode(res.body);

    if (kDebugMode) {
      print(data);
    }

    if (res.statusCode == 200) {
      if (data != null) {
        if (data['Data'] != null) {
          return data;
        } else {
          showSnackBar("Error!!", data['Message'], Colors.redAccent);
          return null;
        }
      } else {
        showSnackBar("Error!!", data['Message'], Colors.redAccent);
        return null;
      }
    } else {
      showSnackBar("Error!!", data['Message'], Colors.redAccent);
      return null;
    }
  }

  static Future forgotPassword(var emailID) async {
    if (kDebugMode) {
      print('Forgot Password api called');
    }

    final body = {
      "employee_emailorcode": emailID,
    };

    if (kDebugMode) {
      print("******Forgot Password api called****");
    }

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    print(requestHeaders);

    if (kDebugMode) {
      print("**********");
    }

    final res = await http.post(Uri.parse(AppConstants.forgetPassword),
        body: jsonEncode(body), headers: requestHeaders);

    print(res);

    if (kDebugMode) {
      print("******Forgot Password api called****");

      print(AppConstants.forgetPassword);
      print(requestHeaders);
      print(body);
      print(res.statusCode);
    }

    var data = json.decode(res.body);

    if (kDebugMode) {
      print(data);
    }

    if (res.statusCode == 200) {
      if (data != null) {
        return data;
      } else {
        showSnackBar("Error!!", data['Message'], Colors.redAccent);
        return null;
      }
    } else {
      showSnackBar("Error!!", data['Message'], Colors.redAccent);
      return null;
    }
  }

  static Future setEmployeeNewPassword(var newPass, var empID) async {
    if (kDebugMode) {
      print('Employee New Password api called');
    }

    final body = {
      "employee_code": "",
      "employee_email": empID,
      "password": newPass
    };

    if (kDebugMode) {
      print("******Employee New Password api called****");
    }

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    print(requestHeaders);

    if (kDebugMode) {
      print("**********");
    }

    final res = await http.post(Uri.parse(AppConstants.setEmployeeNewPassword),
        body: jsonEncode(body), headers: requestHeaders);

    print(res);

    if (kDebugMode) {
      print("******Employee New Password api called****");

      print(AppConstants.setEmployeeNewPassword);
      print(requestHeaders);
      print(body);
      print(res.statusCode);
    }

    var data = json.decode(res.body);

    if (kDebugMode) {
      print(data);
    }

    if (res.statusCode == 200) {
      if (data != null) {
        return data;
      } else {
        showSnackBar("Error!!", data['Message'], Colors.redAccent);
        return null;
      }
    } else {
      showSnackBar("Error!!", data['Message'], Colors.redAccent);
      return null;
    }
  }

  // static Future logout() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   var authToken = pref.getString("logintoken");

  //   Map<String, String> requestHeaders = {
  //     'Accept': 'application/json',
  //     'Authorization': "Bearer $authToken",
  //   };

  //   final res = await http.post(Uri.parse(AppConstants.logout),
  //       headers: requestHeaders);
  //   if (kDebugMode) {
  //     print("******Logout Api Call****");
  //     print(AppConstants.logout);
  //     print(requestHeaders);
  //     print(res.statusCode);
  //     print(res.body);
  //   }

  //   var data = jsonDecode(res.body);

  //   if (kDebugMode) {
  //     print(data);
  //   }
  //   if (res.statusCode == 200) {
  //     if (data != null) {
  //       showSnackBar(
  //           data['message'], "Successfully Logout.", Colors.greenAccent);

  //       return data;
  //     } else {
  //       showSnackBar("Error!!", data['error'], Colors.redAccent);
  //       return null;
  //     }
  //   } else {
  //     showSnackBar("Error!!", data['error'], Colors.redAccent);
  //     return null;
  //   }
  // }
}
