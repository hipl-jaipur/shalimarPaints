import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'get_customer_note_data_controller.dart';

class SetCustomerNoteDataController extends GetxController {
  var isLoading = false.obs;
  // var levelCode = "".obs;
  TextEditingController noteController = TextEditingController();
  GetNoteDataController noteDataController = Get.put(GetNoteDataController());

  fetchData({required levelCode, required BuildContext context }) async {
    try {
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var activityDetailID = prefs.getInt('ActivityDetailID');
      var EmployeeId = prefs.getInt('EmployeeId');

      var LAT = prefs.getDouble('LAT');
      var LNG = prefs.getDouble('LNG');

      print('Customer Note Data API called');

      print("LNG : $LNG");
      print("LAT : $LAT");

      final body = {
        "CustomerCode": levelCode,
        "Note": noteController.text,
        // "ActivityID": activityDetailID,
        "ActivityID": 3,
        "UserID": EmployeeId,
        // "UserID": 358,
        "Latitude": LAT,
        "Longitude": LNG
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.setCustomerNoteData),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Customer Note Data API called******");
        print(AppConstants.setCustomerNoteData);
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
          noteController.clear();
          noteDataController.fetchData(levelCode);
          noteDataController.update();
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
