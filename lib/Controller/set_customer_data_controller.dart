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
  // var state, city,district, locality ;

  fetchData(
      {required BuildContext context, var territoryId, customerID, tag}) async {
    try {
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var EmployeeId = prefs.getInt('EmployeeId');

      print('Set Customer Data API called');

      final body = {
        "customerid": tag == "Edit Customer" ? customerID : null,
        "customername": tag == "Edit Customer" ? null : customerNameCont.text,
        "address1": tag == "Edit Customer" ? null : addrsssOneCont.text,
        "address2": tag == "Edit Customer" ? null : addrsssTwoCont.text,
        "address3": tag == "Edit Customer" ? null : addrsssThreeCont.text,
        "city": tag == "Edit Customer" ? null : cityCont.text,
        "postalcode": tag == "Edit Customer" ? null : postalCodeCont.text,
        "district": tag == "Edit Customer" ? null : distCont.text,
        "territoryid": tag == "Edit Customer" ? null : territoryId,
        "telephone": tag == "Edit Customer" ? null : telephoneCont.text,
        "potential": tag == "Edit Customer" ? null : localityCont.text,
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
