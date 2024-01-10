import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Model/region_data_model.dart';
import 'package:shalimar/utils/consts.dart';

class RegionDataController extends GetxController {
  var isLoading = false.obs;
  RegionDataModel? regionDataModel;
  var zoneId = 0.obs;
  var regionId = 0.obs;

  // @override
  // Future<void> onInit() async {
  //   super.onInit();
  //   fetchData(zoneId: zoneId.toInt());
  // }

  fetchData({required int zoneId}) async {
    try {
      isLoading(true);
      print('Region Data api called');

      final body = {
        "RegionId": 0,
        "ZoneId": zoneId,
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getRegionData),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Regiom Data Api Call****");
        print(AppConstants.getRegionData);
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
            regionDataModel = RegionDataModel.fromJson(result);
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
