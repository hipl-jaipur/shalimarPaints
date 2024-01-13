import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Home_Screen/Customer_Module/customer_depot_screen.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_detail_screen.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_regions_screen.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_terriotory_screen.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_zone_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Elements/commom_snackbar_widget.dart';
import '../Model/customer_data_model.dart';
import '../utils/consts.dart';

class CustomerHireDataController extends GetxController {
  var isLoading = false.obs;
  // var zoneList = [].obs;
  var CustomerList = [].obs;
  var customerId;
  CustomerDataModel? customerDataModel;
  Data? levelData;
  List<CustomerDataModel> similarDataList = [];
  List<Data> filteredList = [];
  List<Data> zoneList = [];
  List<Data> regionsList = [];
  List<Data> depotList = [];
  List<Data> terriotoryList = [];
  List<Data> customerList = [];
  // final dataLevel = <Map<String, dynamic>>[];
  List<Map<dynamic, dynamic>> dataLevel = [];
  // Data? dataLevel;

  // @override
  // Future<void> onInit() async {
  //   super.onInit();
  //   getCustomerHireData();
  // }

  Future getCustomerHireData() async {
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

            // for (var i in customerDataModel!.data!) {
            //   dataLevel.add(i.toJson());
            // }
            // print("dataLevel: $dataLevel");

            zoneList = customerDataModel!.data!
                .where((element) => element.parentLevelID == 0)
                .toList();

            print("List0: ${zoneList.length}");

            regionsList = customerDataModel!.data!
                .where((element) => element.entitytype == 'Region')
                .toList();
            print("List1: ${regionsList.length}");

            depotList = customerDataModel!.data!
                .where((element) => element.entitytype == 'Depot')
                .toList();
            print("List2: ${depotList.length}");

            terriotoryList = customerDataModel!.data!
                .where((element) => element.entitytype == 'Territory')
                .toList();
            print("List3: ${terriotoryList.length}");

            customerList = customerDataModel!.data!
                .where((element) => element.entitytype == 'Customer')
                .toList();
            print("List4: ${customerList.length}");

            if (zoneList.length > 0) {
              Get.to(MyCustomerZonePage());
            } else if (regionsList.length > 0) {
              Get.to(MyCustomerRegionsPage());
            } else if (depotList.length > 0) {
              Get.to(MyCustomerDepotPage());
            } else if (terriotoryList.length > 0) {
              Get.to(MyCustomerTerriotoryPage());
            } else if (customerList.length > 0) {
              Get.to(MyCustomerDetailsPage());
            }

            //  List<SubCategory>
            //           _userOptions = [];
            //       for (var str
            //           in subCategoryList!) {
            //         if (str.subcategoryName!
            //             .toLowerCase()
            //             .contains(textEditingValue
            //                 .text
            //                 .toLowerCase())) {
            //           _userOptions.add(SubCategory(
            //               subCategoryID:
            //                   str.subCategoryID,
            //               subcategoryName: str
            //                   .subcategoryName));
            //         }
            //       }

            // dataLevel.forEach((record) => {
            //       if (record['entitative']  == 'ZONE')
            //         {
            //           print("ZoneList0: $zoneList"),
            //           zoneList.add(dataLevel[i].containsValue('ZONE')),
            //           // dataLevel[record['entitytype']] = [],
            //           // dataLevel[record['entitytype']].push(record)
            //         }
            //       else
            //         {dataLevel[record['entitytype']].push(record)}
            //     });

            // print(id);
            // print(customerDataModel!.data![0].entitytype);
            // filteredList = customerDataModel!.data!
            //     .where((element) => element.parentLevelID == id)
            //     .toList();

            // print(filteredList.length);

            // print(">>>>>>>>>>>>>>>>>");
            // print(similarDataList.length);

            // return data;
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
