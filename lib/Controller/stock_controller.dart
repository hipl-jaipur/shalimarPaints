import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Elements/commom_snackbar_widget.dart';
import '../Model/DepotMasterDataModel.dart';
import '../Model/StockShowModel.dart';
import '../utils/consts.dart';

class StockController extends GetxController {
  var showList = false;
  var isSelectDepot = false;
  var isSelectSku = false;
  var isLoading = false;
  int selectedValue = -1;
  int idMarke = 0;
  int idDepot = 0;
  var depotName = "Select Depot";
  var marketSectorName = "Select Market Sector";

  var isVisibleMarketSector = false;
  var isVisibleMarketDepot = false;
  StockShowModel? stockDataModel;
  StockShowModel? filterStockDataModel;
  DepotMasterDataModel? depotMasterDataModel;

  List<dynamic> sectionlist = [];

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  getStockData(var marketId, idDepot) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var empId = prefs.getInt("EmployeeId");
    print('Stock Data api called');

    try {
      isLoading = true;
      update();

      print('Get OutStanding Data API called');

      final body = {
        "EmployeeId": empId,
        "MarketSectorId": marketId,
        "DepotId": idDepot
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getStockData),
          body: jsonEncode(body), headers: requestHeaders);
      print(res);
      if (kDebugMode) {
        print("******Get Stock  API called****");
        print(AppConstants.getStockData);
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
          stockDataModel = StockShowModel.fromJson(result);
          filterStockDataModel = StockShowModel.fromJson(result);
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

 Future getDepotMasterData(var tag) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var empId = prefs.getInt("EmployeeId");
    print('Depot Master Data api called');

    try {
      isLoading =true;
      update();

      print('Get OutStanding Data API called');

      final body = {"EmployeeId": empId, "EntityType": tag};

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getDepotMasterData),
          body: jsonEncode(body), headers: requestHeaders);
      print(res);
      if (kDebugMode) {
        print("******Get Depot  API called****");
        print(AppConstants.getDepotMasterData);
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
          depotMasterDataModel = DepotMasterDataModel.fromJson(result);
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
