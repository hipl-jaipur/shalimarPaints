import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Model/available_stock_data_model.dart';
import 'package:shalimar/utils/consts.dart';

class GetAvailableStockDataController extends GetxController {
  var isLoading = false;
  var isVisible = false;
  int totalQty = 0;
  var totalAmount = 0.0;
  AvailableStockDataModel? availableStockDataModel;
  List<Map<dynamic, dynamic>> myList = [];
  int counter = 0;


  // double totalPriceSum(int todoListId) {
  //   return ItemsPrice.where((item) => item.todoListId == todoListId)
  //       .fold(0.0, (sum, item) => sum + item['price']);
  // }

  // List<Map<String, Object>> get totalItemsQty {
  //   return List.generate(1, (index) {
  //     var totalQtySum = 0.0;
  //     for (var i = 0; i < toDo.length; i++) {
  //       totalQtySum = toDo[index].amount + totalQtySum;
  //     }
  //     return {
  //       'qty': totalSum,
  //     };
  //   }).toList();
  // }

  fetchData({required customerCode}) async {
    try {
      isLoading=true;
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
          for(var map in availableStockDataModel!.data! ){
            myList.add(

                {
                  /*"id":map.productcode,
                  "name":map.productdesc,
                  "price":map.dpl,
                  "totalPrice":totalAmount,*/
                  "Qty":counter

                }


            );
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
      isLoading=false;
      update();
    }
  }
}
