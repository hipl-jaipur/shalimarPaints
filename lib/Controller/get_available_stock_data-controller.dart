import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Model/available_stock_data_model.dart';
import 'package:shalimar/utils/consts.dart';

class GetAvailableStockDataController extends GetxController {
  var isLoading = false.obs;
  var isVisible = false.obs;
  var totalQty = "".obs;
  var totalAmount = "".obs;
  AvailableStockDataModel? availableStockDataModel;

  fetchData({required customerCode}) async {
    try {
      isLoading(true);

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
