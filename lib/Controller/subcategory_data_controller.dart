import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Model/subCatagory_data_model.dart';
import 'package:shalimar/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubCategoryDataController extends GetxController {
  var isLoading = false.obs;
  SubCatagoryDataModel? subCatagoryDataModel;
  var subCategoryID = 0;

  // var subCategoryList = <SubCategory>[].obs;

  // List<SubCategory> subCategoryList = [].obs;
  var subCategoryList = <dynamic>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchSubCategoryData();
  }

  fetchSubCategoryData() async {
    try {
      isLoading(true);
      print('Sub Category Data api called');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var categoryID = prefs.getString('Division');
      print('categoryID: $categoryID');

      final body = {
        // "CategoryID": categoryID,
        "CategoryID": 1,
        "SubCategoryID": 0
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getSubCategoryData),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Sub Category Data Api Call****");
        print(AppConstants.getSubCategoryData);
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
            subCatagoryDataModel = SubCatagoryDataModel.fromJson(result);
            subCategoryList.add(result['Data']);
            print("subCatData : $subCategoryList");
          } else {
            showSnackBar("Error!!", data['Message'], Colors.redAccent);
            return subCategoryList;
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
