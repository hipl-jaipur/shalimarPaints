import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Elements/commom_snackbar_widget.dart';
import '../Model/OnStandingModel.dart';
import '../utils/consts.dart';

class OutStandingController extends GetxController {
  TextEditingController zoneIdController = TextEditingController();
  var isLoading = false.obs;
  var isLoading2 = false.obs;
  OnStandingModel? outStandingModelData;
  List<outStanding> filteredZoneList = [];
  List<outStanding> filteredAllRegionList = [];
  List<outStanding> filteredRegionList = [];
  List<outStanding> filteredAllDepotList = [];
  List<outStanding> filteredDepotList = [];
  List<outStanding> filteredAllTerritorList = [];
  List<outStanding> filteredTerritorList = [];
  List<outStanding> filteredAllCustomerList = [];
  List<outStanding> filteredCustomerList = [];

  var day30 = 0.0.obs;
  var day60 = 0.0.obs;
  var day90 = 0.0.obs;
  var day120 = 0.0.obs;
  var day180 = 0.0.obs;
  var over180days = 0.0.obs;
  var totalPrice = 0.0.obs;
  // List<Map<String, dynamic>> filteredZoneList=[];
  @override
  Future<void> onInit() async {
    super.onInit();
    getOutStandingData();
  }

  getOutStandingData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var empId = prefs.getInt("EmployeeId");
    print('OutStanding Data api called');

    try {
      isLoading(true);
      update();

      print('Get OutStanding Data API called');

      final body = {"EmployeeId": empId};

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getCustomerOsData),
          body: jsonEncode(body), headers: requestHeaders);
      print(res);
      if (kDebugMode) {
        print("******Get OutStanding  API called****");
        print(AppConstants.getCustomerOsData);
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
          outStandingModelData = OnStandingModel.fromJson(result);
          filteredZoneList = outStandingModelData!.data!
              .where((item) => item.entitytype == "ZONE")
              .toList();
          print(filteredZoneList!.length);

          filteredAllRegionList = outStandingModelData!.data!
              .where((item) => item.entitytype == "Region")
              .toList();
          print(filteredAllRegionList!.length);

          filteredAllDepotList = outStandingModelData!.data!
              .where((item) => item.entitytype == "Depot")
              .toList();
          print(filteredAllDepotList!.length);

          filteredAllTerritorList = outStandingModelData!.data!
              .where((item) => item.entitytype == "Territory")
              .toList();
          print(filteredAllTerritorList!.length);

          filteredAllCustomerList = outStandingModelData!.data!
              .where((item) => item.entitytype == "Customer")
              .toList();
          print(filteredAllCustomerList!.length);
        }
        else {
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
