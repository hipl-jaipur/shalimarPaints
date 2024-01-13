import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Model/get_order_data_model.dart';
import 'package:shalimar/utils/consts.dart';

class GetOrderDataController extends GetxController {
  var isLoading = false.obs;
  GetOrderDataModel? getOrderDataModel;
  OrderData? orderData;
  var noRecord = "".obs;

  fetchOrderData({required var customerCode}) async {
    try {
      isLoading(true);
      print('Get Order Data api called');

      final body = {
        // "CustomerCode": customerCode
        "CustomerCode": "N221000011"
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getOrderData),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Get Order Data Api Call****");
        print(AppConstants.getOrderData);
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
          if (data['OrderData'] != null || data['OrderData'] == 0) {
            var result = jsonDecode(res.body);
            getOrderDataModel = GetOrderDataModel.fromJson(result);
            orderData = OrderData.fromJson(getOrderDataModel!.orderData);
            return getOrderDataModel;
          } else {
            // showSnackBar("Error!!", data['Message'], Colors.redAccent);
            noRecord.value = "No Record Found";
            // return getOrderDataModel;
          }
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
