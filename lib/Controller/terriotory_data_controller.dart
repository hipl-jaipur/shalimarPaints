import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Model/terriotory_data_model.dart';
import 'package:shalimar/utils/consts.dart';

class TerriotoryDataController extends GetxController {
  var isLoading = false.obs;
  TerriotoryDataModel? terriotoryDataModel;
  var depotId = 0.obs;
  var territoryId = 0.obs;
  var noRecord = "".obs;
    var selectTerritory = false.obs;

  // @override
  // Future<void> onInit() async {
  //   super.onInit();
  //   fetchData(depotId: depotId.toInt());
  // }

 Future fetchData({required int depotId}) async {
    try {
      isLoading(true);
      print('Terriotory Data api called');

      final body = {"TerritoryId": 0, "DepotId": depotId};

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getTerritoryData),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Terriotory Data Api Call****");
        print(AppConstants.getTerritoryData);
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
          if (data['Data'] != null && data['Data'].isNotEmpty) {
            var result = jsonDecode(res.body);
            terriotoryDataModel = TerriotoryDataModel.fromJson(result);
            return terriotoryDataModel;
          } else {
            noRecord.value = "No Record Found";
            // showSnackBar("Error!!", data['Message'], Colors.redAccent);
            // return null;
            return terriotoryDataModel;

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
