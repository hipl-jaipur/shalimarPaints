import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Elements/commom_snackbar_widget.dart';
import '../Model/ActivityDataModel.dart';
import '../Model/StockShowModel.dart';
import '../utils/consts.dart';

class ActivityController extends GetxController {
  var isLoading =false;

  ActivityDataModel? activityDataModel;
  StockShowModel? filterStockDataModel;

  List<dynamic> sectionlist = [];

@override
Future<void> onInit() async {
  super.onInit();
  getActivityData();
}

  getActivityData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var empId = prefs.getInt("EmployeeId");
    print('Activity Data api called');

    try {
      isLoading =true;
      update();

      print('Get Activity Data API called');

      final body = {

      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getActivityData),
          body: jsonEncode(body), headers: requestHeaders);
      print(res);
      if (kDebugMode) {
        print("******Get Stock  API called****");
        print(AppConstants.getActivityData);
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
          var result = jsonDecode(res.body);
          activityDataModel = ActivityDataModel.fromJson(result);
          // filterStockDataModel = StockShowModel.fromJson(result);

        } else {
          showSnackBar("Error!!", data['Message'], Colors.redAccent);
          return null;
        }
      } else {
        showSnackBar("Error!!", data['Message'], Colors.redAccent);
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error while getting data is $e');
      }
    } finally {
      isLoading= false;

      update();
    }
  }





}
