import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Elements/commom_snackbar_widget.dart';
import '../Model/LedgerStatementModel.dart';
import '../utils/consts.dart';

class LedgerStatementController extends GetxController {
  var isLoading = false;

  var isVisibleTerritory = false;
  var isVisibleCustomer = false;
  var onTapCustomer = false;
  var territoryName = "Select Territory";
  var customerName = "Select Customer";
  int idTerritory = 0;
  var idCustomer = "";
  var totalAmount = 0.0;
  var totalBalance = 0.0;
  var totalDbAmount = 0.0;
  var totalCrAmount = 0.0;
  LedgerStatementModel? ledgerStatementModel;

  getLedgerStatementData(var territoryId, customerId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var empId = prefs.getInt("EmployeeId");
    print('Ledger Data api called');

    try {
      isLoading = true;
      update();

      print('Get OutStanding Data API called');

      final body = {"TerritoryId": territoryId, "CustomerCode": customerId};

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(
          Uri.parse(AppConstants.GetLedgerStatementData),
          body: jsonEncode(body),
          headers: requestHeaders);
      print(res);
      if (kDebugMode) {
        print("******Get Ledger  API called****");
        print(AppConstants.GetLedgerStatementData);
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
          ledgerStatementModel = LedgerStatementModel.fromJson(result);
          for (var i in ledgerStatementModel!
              .ledgerStatementMaster![0].ledgerStatementDetailMaster!) {
            totalAmount = totalAmount + i.creditAmt + i.debitAmt;
            totalDbAmount = totalDbAmount + i.debitAmt;
            totalCrAmount = totalCrAmount + i.creditAmt;
            // totalBalance = totalBalance + i.balance;
            var lastOpeningBalance = ledgerStatementModel!
                                                  .ledgerStatementMaster![0]
                                                  .openBalance!;
            totalBalance = lastOpeningBalance + totalDbAmount - totalCrAmount;
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
      isLoading = false;

      update();
    }
  }
}
