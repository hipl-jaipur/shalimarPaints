import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/OutStandingModel.dart';

class CustomerHireDataServices {


  static Future<OutStandingModel?> getOutStaning(var zoneId,regionId,depotId,territoryId) async {
    print('Zone Data api called');

    final body = {
      "ZoneId":zoneId ,
      "RegionId": regionId,
      "DepotId": depotId,
      "TerritoryId": territoryId,
      "CustomerCode": ""
    };

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    print("**********");

    final res = await http.post(Uri.parse(AppConstants.getustomerOsData),
        body: jsonEncode(body), headers: requestHeaders);

    print(res);

    if (kDebugMode) {
      print("******Outstanding Data Api Call****");
      print(AppConstants.getustomerOsData);
      print(requestHeaders);
      print(body);
      print(res.statusCode);
    }

    var data = json.decode(res.body);
    if (data != null) {
      print(res.body);
      OutStandingModel state = OutStandingModel.fromJson(data);
      // print(courseModel.toJson());
      return state;
    } else {
      // Get.snackbar(
      //   "",
      //   data['message'],
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      //  Helper.toast(data['message']);
      return null;
    }
  }
}



 /* static Future getCustomerHireData() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final employeeId = prefs.getInt("EmployeeId");
    
    print('CustomerHireData api called');

    final body = {
      // "EmployeeId": employeeId,
      "EmployeeId": 358,
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
  }*/

