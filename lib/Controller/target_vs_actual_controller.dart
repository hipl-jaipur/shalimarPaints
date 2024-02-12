import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Elements/commom_snackbar_widget.dart';
import '../Model/TargetVsActualDataModel.dart';
import '../utils/consts.dart';

class TargetVsActualController extends GetxController {
  var isLoading = false.obs;
  var isLoading2 = false.obs;
  TargetVsActualDataModel? targetVsActualDataModel;
  List<Data> filteredZoneList = [];
  List<Data> filteredAllRegionList = [];
  List<Data> filteredRegionList = [];
  List<Data> filteredAllDepotList = [];
  List<Data> filteredDepotList = [];
  List<Data> filteredAllTerritorList = [];
  List<Data> filteredTerritorList = [];
  List<Data> filteredAllCustomerList = [];
  List<Data> filteredCustomerList = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    getTargetVsActualData();
  }

  getTargetVsActualData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var empId = prefs.getInt("EmployeeId");
    print('get Target Vs Actual Data Data api called');

    try {
      isLoading(true);
      update();

      print('Get get Target Vs Actual Data Data API called');

      final body = {"EmployeeId": empId};

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getTargetVsActualData),
          body: jsonEncode(body), headers: requestHeaders);
      print(res);
      if (kDebugMode) {
        print("******get Target Vs Actual Data  API called****");
        print(AppConstants.getTargetVsActualData);
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
          targetVsActualDataModel = TargetVsActualDataModel.fromJson(result);
          filteredZoneList = targetVsActualDataModel!.data!
              .where((item) => item.entitytype == "ZONE")
              .toList();
          print(filteredZoneList!.length);

          filteredAllRegionList = targetVsActualDataModel!.data!
              .where((item) => item.entitytype == "Region")
              .toList();
          print(filteredAllRegionList!.length);

          filteredAllDepotList = targetVsActualDataModel!.data!
              .where((item) => item.entitytype == "Depot")
              .toList();
          print(filteredAllDepotList!.length);

          filteredAllTerritorList = targetVsActualDataModel!.data!
              .where((item) => item.entitytype == "Territory")
              .toList();
          print(filteredAllTerritorList!.length);

          filteredAllCustomerList = targetVsActualDataModel!.data!
              .where((item) => item.entitytype == "Customer")
              .toList();
          print(filteredAllCustomerList!.length);
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

      update();
    }
  }
}
