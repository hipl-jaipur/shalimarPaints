import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Model/plant_data_model.dart';
import 'package:shalimar/utils/consts.dart';


class PlantService {
  static Future<PlantDataModel?> getPlant() async {
    try {
      // isLoading(true);
      print('Plant Data api called');

      final body = {
        "PlantId": 0,
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getPlantData),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Plant Data Api Call****");
        print(AppConstants.getPlantData);
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
            PlantDataModel plant = PlantDataModel.fromJson(result);
            return plant;
            // plantDataModel = PlantDataModel.fromJson(result);
            // plantList.add(data['Data']);
            // print("plantData : $plantList");
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
      // isLoading(false);
    }

  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   var authToken = pref.getString("logintoken");
  //   Map<String, String> requestHeaders = {
  //     'Authorization': "Bearer $authToken",
  //   };
  //   final res = await http.get(Uri.parse(AppConstants.productList),
  //       headers: requestHeaders);

  //   if (kDebugMode) {
  //     print(res.statusCode);
  //     print(res.body);
  //   }

  //   if (res.statusCode == 200) {
  //     var data = jsonDecode(res.body);
  //     if (data != null) {
  //       if (kDebugMode) {
  //         print(res.body);
  //       }
  //       ProductListModel product = ProductListModel.fromJson(data);
  //       return product;
  //     } else {
  //       return null;
  //     }
  //   } else {
  //     return null;
  //   }
  // }
  }
}
