import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/utils/consts.dart';

class ImageUploadController extends GetxController {
  var isLoading = false.obs;

  fetchData(String img64, String fileExt) async {
    try {
      isLoading(true);

      print('Image Upload API called');

      final body = {"FileUploadData": img64.toString(), "FileExt": "jpg"};

      // Map<String, String> requestHeaders = {
      //   'Content-Type': 'application/json',
      // };
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json; charset=utf-8',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.uploadImage),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Image Upload API called****");
        print(AppConstants.uploadImage);
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
          // prefs.setInt('ActivityDetailID', result['ActivityDetailID']);
          // print("ActivityDetailID: ${result['ActivityDetailID']}");
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
