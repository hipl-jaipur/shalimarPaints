import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Model/getGlobalParameterDataModel.dart';
import 'package:shalimar/utils/consts.dart';

class GetGlobalParameterDataController extends GetxController {
  var isLoading = false.obs;
  var profileSkip;
  GetGlobalParameterData? getGlobalParameterData;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      print('Get Global Parameter Data  api called');

      final body = {"ParametersId": 0};

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(
          Uri.parse(AppConstants.getGlobalParameterData),
          body: jsonEncode(body),
          headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Get Global Parameter Data  Api Called****");
        print(AppConstants.getGlobalParameterData);
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
            getGlobalParameterData = GetGlobalParameterData.fromJson(result);
            profileSkip = getGlobalParameterData!.data![0].parameterValue;
            return getGlobalParameterData;
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
