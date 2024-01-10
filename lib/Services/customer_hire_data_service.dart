import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerHireDataServices {
  static Future getCustomerHireData() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final employeeId = prefs.getInt("EmployeeId");
    
    print('CustomerHireData api called');

    final body = {
      "EmployeeId": employeeId,
    };

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    print("**********");

    final res = await http.post(Uri.parse(AppConstants.getCustomerHireData),
        body: jsonEncode(body), headers: requestHeaders);

    print(res);

    if (kDebugMode) {
      print("******CustomerHireData Api Call****");
      print(AppConstants.getCustomerHireData);
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
}
