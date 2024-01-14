import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetCustomerScheduleController extends GetxController {
  var isLoading = false.obs;
  TextEditingController remarkController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var schdulefor = "".obs;
  var scheduleDetailsMaster = [].obs;

  fetchData({required BuildContext context}) async {
    try {
      isLoading(true);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var EmployeeId = prefs.getInt('EmployeeId');

      print('Set Schedule Data  API called');

      final body = {
        "customercode": "N221000011",
        "schdulefor": schdulefor.value,
        "date": dateController.text,
        "starttime": startTimeController.text,
        "endtime": endTimeController.text,
        "remark": remarkController.text,
        "isvalid": 0,
        "UserID": EmployeeId,
        "ScheduleDetailsMaster": scheduleDetailsMaster.value
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(
          Uri.parse(AppConstants.setCustomerScheduleData),
          body: jsonEncode(body),
          headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Set Schedule Data  API called****");
        print(AppConstants.setCustomerScheduleData);
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
          showSnackBar("Success!!", result['Message'], Colors.greenAccent);
          remarkController.clear();
          startTimeController.clear();
          endTimeController.clear();
          dateController.clear();
          Navigator.pop(context);
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
