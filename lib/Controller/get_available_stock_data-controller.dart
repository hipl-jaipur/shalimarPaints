import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Model/available_stock_data_model.dart';
import 'package:shalimar/utils/consts.dart';

import '../Model/MarketSectorModel.dart';

class GetAvailableStockDataController extends GetxController {
  var isLoading = false;
  var isVisible = false;
  var isVisibleMarketSector = false;
  var d = true;
  var i = false;
  int totalQty = 0;
  var totalAmount = 0.0;
  var productCategory = "";
  AvailableStockDataModel? availableStockDataModel;
  // AvailableStockDataModel? filterAvailableStockDataModel;
  MarketSectorModel? marketSectorModelData;
  List<dynamic> sectionlist = [];
  List<Map<dynamic, dynamic>> myList = [];
  List<Map<dynamic, dynamic>> myNewList = [];
  int counter = 0;
  double amount = 0.0;
  bool catCheck = false;
  // List<TextEditingController> qtyTextEditController=[];
  TextEditingController qtyTextEditController = TextEditingController();

  List<Data> filterAvailableStockDataModel = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    matketSectorData();
  }

  fetchData({required customerCode}) async {
    try {
      isLoading = true;
      update();

      print('Get Available Stock Data API called');

      final body = {"CustomerCode": customerCode.toString()};

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getAvailableStockData),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Get Available Stock Data API called****");
        print(AppConstants.getAvailableStockData);
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
          availableStockDataModel = AvailableStockDataModel.fromJson(result);
          // filterAvailableStockDataModel =
          //     AvailableStockDataModel.fromJson(result);

          filterAvailableStockDataModel = availableStockDataModel!.data!
              .where((element) => element.division!.contains("D"))
              .toList();

          // filterAvailableStockDataModel = result;

          for (var map in availableStockDataModel!.data!) {
            myList.add({
              /*"id":map.productcode,
                  "name":map.productdesc,
                  "price":map.dpl,
                  "totalPrice":totalAmount,*/
              "Qty": counter,
              "mrp": amount,
              // "controller": TextEditingController(text: counter.toString())
              // "category": productCategory.trim()
            });
          }

          print(myList.length);
          print(myList);
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

  matketSectorData() async {
    try {
      isLoading = true;
      update();

      print('Get Market Sector Data API called');

      final body = {"MarketSectorId": "0"};

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.marketSectorData),
          body: jsonEncode(body), headers: requestHeaders);
      print(res);
      if (kDebugMode) {
        print("******Get Market Sector API called****");
        print(AppConstants.marketSectorData);
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
          marketSectorModelData = MarketSectorModel.fromJson(result);
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
