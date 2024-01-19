import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Home_Screen/Teams_Module/teams_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Elements/commom_snackbar_widget.dart';
import '../Model/EmployeeDetailsModel.dart';
import '../Model/TeamsDataModel.dart';
import '../utils/consts.dart';

class TeamsController extends GetxController {
  var isLoading = false;
  TeamsDataModel? temasDataList;
  EmployeeDetailsModel? employeeDetailsModel;
  List<Data> filteredLevelFirstList = [];
  List<Data> hireLevelOnelist = [];
  List<Data> hireLevelTwolist = [];
  List<Data> hireLevelThreelist = [];
  List<Data> hireLevelFourlist = [];
  List<Data> hireLevelFivelist = [];
  List<Data> hireLevelSixlist = [];
  List<Data> hireLevelSevenlist = [];

  var employeeId;

  static List<MyNode> roots = <MyNode>[];
  static List<MyNode> rootsTwo = <MyNode>[];
  static List<MyNode> rootsThree = <MyNode>[];
  static List<MyNode> rootsFour = <MyNode>[];
  static List<MyNode> rootsFive = <MyNode>[];
  static List<MyNode> rootsSix = <MyNode>[];
  static List<MyNode> rootsSeven = <MyNode>[];

  getTeamsData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var empId = prefs.getInt("EmployeeId");
    print('Stock Data api called');

    try {
      isLoading = true;
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

          for (var i in temasDataList!.data!) {
            filteredLevelFirstList.add(i);
          }

          

          hireLevelOnelist = filteredLevelFirstList!
              .where((element) => element.hirelevel == 1)
              .toList();

          print("List1: ${hireLevelOnelist.length}");

          for (var i in hireLevelOnelist) {
            roots.add(
              MyNode(
                title: i.employeename.toString(),
                designationName: i.designationName.toString(),
                employeeid: i.employeeid,
                reportingmgr_id: i.reportingmgrId!.toInt(),
                children: rootsTwo,
              ),
            );
          }

          hireLevelTwolist = filteredLevelFirstList!
              .where((element) => element.hirelevel == 2)
              .toList();

          print("List2: ${hireLevelTwolist.length}");

          employeeId = empId;
          
          for (var j = 0; j < hireLevelTwolist.length; j++) {
            if (employeeId == hireLevelTwolist[j].reportingmgrId) {
              rootsTwo.add(MyNode(
                  title: hireLevelTwolist[j].employeename.toString(),
                  designationName:
                      hireLevelTwolist[j].designationName.toString(),
                  employeeid: hireLevelTwolist[j].employeeid,
                  reportingmgr_id: hireLevelTwolist[j].reportingmgrId!.toInt(),
                  children: rootsThree));
            }
          }

          hireLevelThreelist = filteredLevelFirstList!
              .where((element) => element.hirelevel == 3)
              .toList();

          print("List3: ${hireLevelThreelist.length}");

          for (var j = 0; j < hireLevelThreelist.length; j++) {
            if (employeeId == hireLevelThreelist[j].reportingmgrId) {
              rootsThree.add(MyNode(
                  title: hireLevelThreelist[j].employeename.toString(),
                  designationName:
                      hireLevelThreelist[j].designationName.toString(),
                  employeeid: hireLevelThreelist[j].employeeid,
                  reportingmgr_id:
                      hireLevelThreelist[j].reportingmgrId!.toInt(),
                  children: rootsFour));
            }
          }

          hireLevelFourlist = filteredLevelFirstList!
              .where((element) => element.hirelevel == 4)
              .toList();

          print("List4: ${hireLevelFourlist.length}");

          hireLevelFivelist = filteredLevelFirstList!
              .where((element) => element.hirelevel == 5)
              .toList();

          print("List5: ${hireLevelFivelist.length}");

          hireLevelSixlist = filteredLevelFirstList!
              .where((element) => element.hirelevel == 6)
              .toList();

          print("List6: ${hireLevelSixlist.length}");

          hireLevelSevenlist = filteredLevelFirstList!
              .where((element) => element.hirelevel == 7)
              .toList();

          print("List7: ${hireLevelSevenlist.length}");

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
      isLoading = false;

      update();
    }
  }
  

  getEmployData(var employeId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var empId = prefs.getInt("EmployeeId");
    print('Employe Data api called');

    try {
      isLoading = true;
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
      isLoading = false;

      update();
    }
  }
}
