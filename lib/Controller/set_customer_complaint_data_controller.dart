import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetCustomerComplaintDataController extends GetxController {
  var isLoading = false.obs;
  TextEditingController batchNumberController = TextEditingController();
  TextEditingController damagedQtyController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  fetchData(
      {required int SubCategoryID,
      required String ProductCode,
      required int PlantID,
      required CustomerCode,
      required BuildContext context}) async {
    try {
      isLoading(true);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var activityDetailID = prefs.getInt('ActivityDetailID');
      var EmployeeId = prefs.getInt('EmployeeId');

      var LAT = prefs.getDouble('LAT');
      var LNG = prefs.getDouble('LNG');

      print('Set Customer Complaint Data  API called');

      print("LNG : $LNG");
      print("LAT : $LAT");

      final body = {
        "ComplainID": 0,
        "ActivityDetailID": activityDetailID,
        "CustomerCode": CustomerCode.toString(),
        "SubcategoryID": SubCategoryID,
        "ProductCode": ProductCode,
        "BatchNumber": batchNumberController.text,
        "ManufacturingDate": dateController.text,
        "DamagedQty": damagedQtyController.text,
        "Description": descriptionController.text,
        "FreshDeskTicketNo": null,
        "TicketDate": null,
        "TicketStatus": null,
        "RemarkFromFreshDesk": null,
        "IsValid": 0,
        "ActivityID": 7,
        "UserID": EmployeeId,
        // "UserID": 358,
        "Latitude": LAT,
        "Longitude": LNG,
        "PlantId": PlantID,
        "ComplaintImage": []
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(
          Uri.parse(AppConstants.setCustomerComplaintData),
          body: jsonEncode(body),
          headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Set Customer Complaint Data  API called****");
        print(AppConstants.setCustomerComplaintData);
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
          showSnackBar("Success!!", result['Message'], Colors.greenAccent);
          batchNumberController.clear();
          damagedQtyController.clear();
          descriptionController.clear();
          dateController.clear();
          Navigator.pop(context);
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
