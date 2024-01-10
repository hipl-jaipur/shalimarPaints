import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Elements/commom_snackbar_widget.dart';
import '../Model/customer_data_model.dart';
import '../utils/consts.dart';

class CustomerHireDataController extends GetxController {
  var isLoading = false.obs;
  var zoneList = [].obs;
  var CustomerList = [].obs;
  var customerId;
  CustomerDataModel? customerDataModel;
  List<CustomerDataModel> similarDataList = [];
  List<Data> filteredList = [];

  Future getCustomerHireData(var id) async {
    try {
      isLoading(true);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final employeeId = prefs.getInt("EmployeeId");

      print('CustomerHireData api called');

      final body = {
        "EmployeeId": employeeId,
        // "EmployeeId": 358,
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getCustomerHireData),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******CustomerHireData Api Call****");
        print(AppConstants.getCustomerHireData);
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

            customerDataModel = CustomerDataModel.fromJson(result);

            print(id);
            print(customerDataModel!.data![0].entitytype);
            filteredList = customerDataModel!.data!
                .where((element) => element.parentLevelID == id)
                .toList();
            print(filteredList.length);

            print(">>>>>>>>>>>>>>>>>");
            print(similarDataList.length);
            return data;
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
    }
    finally {
      isLoading(false);
    }
  }
}
