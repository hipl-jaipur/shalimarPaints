import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Model/product_data_model.dart';
import 'package:shalimar/utils/consts.dart';

class ProductDataController extends GetxController {
  var isLoading = false.obs;
  ProductDataModel? productDataModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchProductData();
  }

  fetchProductData() async {
    try {
      isLoading(true);
      print('Product Data api called');

      final body = {"ProductId": 0, "ProductCode": null};

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getProductData),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Product Data Api Call****");
        print(AppConstants.getProductData);
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
          if (data['Data'] != null) {
            var result = jsonDecode(res.body);
            productDataModel = ProductDataModel.fromJson(result);
          } else {
            showSnackBar("Error!!", data['Message'], Colors.redAccent);
            return null;
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
