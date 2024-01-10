import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Model/zone_data_model.dart';
import 'package:shalimar/utils/consts.dart';

class ZoneDataController extends GetxController {
  var isLoading = false.obs;
  ZoneDataModel? zoneDataModel;
  var zoneId = 0.obs;

  // @override
  // Future<void> onInit() async {
  //   super.onInit();
  //   fetchZoneData(zoneId: zoneId.toInt());
  // }

  fetchZoneData({required int zoneId}) async {
    try {
      isLoading(true);
      print('Zone Data api called');

      final body = {
        "ZoneId": zoneId,
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getZoneData),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Zone Data Api Call****");
        print(AppConstants.getZoneData);
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
            zoneDataModel = ZoneDataModel.fromJson(result);
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
