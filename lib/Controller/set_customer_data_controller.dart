import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetCustomerDataController extends GetxController {
  var isLoading = false.obs;
  TextEditingController customerNameCont = TextEditingController();
  TextEditingController addrsssOneCont = TextEditingController();
  TextEditingController addrsssTwoCont = TextEditingController();
  TextEditingController addrsssThreeCont = TextEditingController();
  TextEditingController cityCont = TextEditingController();
  TextEditingController postalCodeCont = TextEditingController();
  TextEditingController distCont = TextEditingController();
  TextEditingController telephoneCont = TextEditingController();
  TextEditingController localityCont = TextEditingController();
  var image = "";
  var lat = 0.0;
  var long = 0.0;

  fetchData({required BuildContext context, var territoryId}) async {
    try {
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var EmployeeId = prefs.getInt('EmployeeId');

      print('Set Customer Data API called');

      final body = {
        "customerid": territoryId,
        "customername": customerNameCont.text,
        "address1": addrsssOneCont.text,
        "address2": addrsssTwoCont.text,
        "address3": addrsssThreeCont.text,
        "city": cityCont.text,
        "postalcode": postalCodeCont.text,
        "district": distCont.text,
        "territoryid": territoryId,
        "telephone": telephoneCont.text,
        "potential": 0,
        "Latitude": lat,
        "Longitude": long,
        "Image": image,
        "employeeid": EmployeeId
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.setCustomerData),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Customer Data API called******");
        print(AppConstants.setCustomerData);
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
