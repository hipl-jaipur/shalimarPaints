import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Elements/commom_snackbar_widget.dart';
import '../Model/PaymentTypeModel.dart';
import '../utils/consts.dart';

class PaymentController extends GetxController {
  TextEditingController referenceNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
var paymentIdController;
var imagsPayment="";
  var isLoading = false.obs;
  PaymentTypeModel? paymentTypeModel;


  @override
  Future<void> onInit() async {
    super.onInit();
    fetchPaymentTypeData();

  }
  fetchPaymentTypeData() async {
    try {
      isLoading(true);
      print('Payment Type Data api called');

      final body = {
        "PaymentTypeID": 0,
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getPaymentTypeData),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Payment Type Data Api Call****");
        print(AppConstants.getPaymentTypeData);
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
            paymentTypeModel = PaymentTypeModel.fromJson(result);
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
      isLoading(false);
    }
  }

  setPayment(
      {required customerCode,
        required BuildContext context}) async {
    try {
      isLoading(true);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var EmployeeId = prefs.getInt('EmployeeId');
      var ActivityDetailID = prefs.getInt('ActivityDetailID');

      var LAT = prefs.getDouble('LAT');
      var LNG = prefs.getDouble('LNG');

      print('Set Customer Payment  API called');

      print("LNG : $LNG");
      print("LAT : $LAT");

      final body = {
        "CustomerCode":customerCode ,
        "PaymentTypeID":paymentIdController,
        "RefrenceNo": referenceNumberController.text,
        "Amount": int.parse(amountController.text),
        "Attachment": imagsPayment,
        "Remark": remarkController.text,
        "ActivityID": ActivityDetailID,
        "UserID": EmployeeId,
        "Latitude": LAT,
        "Longitude": LNG
      };

      Map<String, String> requestHeaders = {
       "Content-Type":"application/json",
        // "Accept":"application/json"
      };

      print("**********");

      final res = await http.post(
          Uri.parse(AppConstants.getPaymentTypeData),
          body: jsonEncode(body),
          headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Set Customer Payment  API called****");
        print(AppConstants.getPaymentTypeData);
        print(requestHeaders);
        print(body);
        print(res.statusCode);
        print(jsonEncode(body));
      }

      var data = json.decode(res.body);

      if (kDebugMode) {
        print(data);
      }

      if (res.statusCode == 200) {
        if (data != null) {
          var result = jsonDecode(res.body);
          showSnackBar("Success!!", result['Message'], Colors.greenAccent);

          Navigator.pop(context);
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
