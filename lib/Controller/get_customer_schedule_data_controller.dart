import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Model/get_schedule_data_model.dart';
import 'package:shalimar/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetScheduleDataController extends GetxController {
  var isLoading = false.obs;
  GetScheduleDataModel? getScheduleDataModel;
  // var levelCode = "".obs;

  // @override
  // Future<void> onInit() async {
  //   super.onInit();
  //   fetchData();
  // }

  

  fetchData(String levelCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var EmployeeId = prefs.getInt('EmployeeId');
    try {
      isLoading(true);
      print('Get Schedule api called');

      final body = {"CustomerCode": levelCode, "UserId": EmployeeId};

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(
          Uri.parse(AppConstants.getCustomerScheduleData),
          body: jsonEncode(body),
          headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Schedule Data Api Call****");
        print(AppConstants.getCustomerScheduleData);
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
            var result = jsonDecode(res.body);
            getScheduleDataModel = GetScheduleDataModel.fromJson(result);
            print("ListSchedule:  ${getScheduleDataModel!.data}");
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
    } catch (e) {
      if (kDebugMode) {
        print('Error while getting data is $e');
      }
    } finally {
      isLoading(false);
    }
  }
}
