import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Model/getActivityDetailDataModel.dart';
import 'package:shalimar/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetActivityDetailDataController extends GetxController {
  // int startTime = 0;

  // Timer? timer;
  bool checkIn = false;
  bool timerstop = false;
  var checkinCustomer = "";
  var isLoading = false.obs;
  var isTimerVisible = false.obs;
  var levelName = "".obs;
  var levelCode = "".obs;
  var levelAddress = "".obs;
  var isCheckinOnSite = false.obs;

  var attendanceId=0;
  GetActivityDetailDataModel? getActivityDetailDataModel;

  // void startTimer() {
  //   timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       startTime++;
  //     });
  //   });
  // }

  fetchData({
    required String levelCode,
    required int activityID,
  }) async {
    try {
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var EmployeeId = prefs.getInt('EmployeeId');
      // var checkinOnsite = 8;
      // var checkinOffsite = 9;
      // var checkOutActivity = 10;
      var LAT = prefs.getDouble('LAT');
      var LNG = prefs.getDouble('LNG');

      print('Set Activity Detail Data API called');
      // print(isOnSite);
      print("LNG : $LNG");
      print("LAT : $LAT");

      // isTimerVisible.value = isOnSite;

      final body = {
        "ActivityDetailID": 0,
        // "ActivityID": isOnSite ? checkinOnsite : checkinOffsite,
        "ActivityID": activityID,
        "CustomerCode": levelCode,
        "UserID": EmployeeId,
        "Latitude": LAT,
        "Longitude": LNG,
        "IsValid": 1
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.setActivityDetailData),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Set Activity Detail Data API called****");
        print(AppConstants.setActivityDetailData);
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
          prefs.setInt('ActivityDetailID', result['ActivityDetailID']);
          print("ActivityDetailID: ${result['ActivityDetailID']}");
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

  getActivityDetailData(bool tag ,var id) async {
    try {
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var employeeId = prefs.getInt('EmployeeId');
      var activityID = 0;

      print('get Activity Detail Data API called');

      final body = {"ActivityId": activityID, "UserId":tag ?employeeId:id};

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getActivityDetailData),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Get Activity Detail Data API called****");
        print(AppConstants.getActivityDetailData);
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
          getActivityDetailDataModel =
              GetActivityDetailDataModel.fromJson(result);
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
