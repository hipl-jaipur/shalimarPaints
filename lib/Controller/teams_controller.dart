import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Elements/commom_snackbar_widget.dart';
import '../Model/EmployeeDetailsModel.dart';
import '../Model/TeamsDataModel.dart';
import '../utils/consts.dart';

class TeamsController extends GetxController {
  var isLoading =false;
  TeamsDataModel? temasDataList;
  EmployeeDetailsModel? employeeDetailsModel;
  List<Data> filteredLevelFirstList = [];


  getTeamsData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var empId = prefs.getInt("EmployeeId");
    print('Stock Data api called');

    try {
      isLoading =true;
      update();

      print('Get Teams Data API called');

      final body = {
        "EmployeeId": empId,
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getTeamsData),
          body: jsonEncode(body), headers: requestHeaders);
      print(res);
      if (kDebugMode) {
        print("******Get Teams  API called****");
        print(AppConstants.getTeamsData);
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
          temasDataList = TeamsDataModel.fromJson(result);
          // filterStockDataModel = StockShowModel.fromJson(result);

          for(var i in temasDataList!.data!){
            filteredLevelFirstList.add(i);
          }

         /* filteredLevelFirstList = temasDataList!.data!
              .where((item) => item.hirelevel == 1)
              .toList();*/
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
  getEmployData(var employeId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var empId = prefs.getInt("EmployeeId");
    print('Employe Data api called');

    try {
      isLoading =true;
      update();

      print('Get Employe Data API called');

      final body = {
        "EmployeeId": employeId,
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getEmployeeData),
          body: jsonEncode(body), headers: requestHeaders);
      print(res);
      if (kDebugMode) {
        print("******Get Employe  API called****");
        print(AppConstants.getEmployeeData);
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
          employeeDetailsModel = EmployeeDetailsModel.fromJson(result);
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
