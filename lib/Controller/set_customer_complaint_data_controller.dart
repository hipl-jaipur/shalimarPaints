import 'dart:convert';
import 'dart:io';

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
      required var imagesList,
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
        "ComplaintImage": imagesList
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
  Future<dynamic> uploadFileChunked(String filePath, ) async {
    var uri = Uri.parse("https://mayanksoftwares.in/api/File/UploadWebFile");

    var request = http.MultipartRequest('POST', uri);

    // Open the file as a stream
    var fileStream = http.ByteStream(File(filePath).openRead());
    var length = await File(filePath).length();

    // Use chunked transfer encoding
    var multipartFile = http.MultipartFile(
      'file',
      fileStream,
      length,
      filename: filePath.split('/').last,
    );

    request.files.add(multipartFile);

      var response = await request.send().then((value) async {

        var res = await value.stream.toBytes();
        var alldata = String.fromCharCodes(res);

        print(value.statusCode);
        print(request.fields);
        var data = jsonDecode(alldata);
        print(data);

      if (value.statusCode == 200) {
        if(data!=null){
        print('File uploaded successfully');
        print(data);
        return data;

        }
      } else {
        print('File upload failed with status ${value.statusCode}');
      }
      });

  return response;}
  }

/*
  uploadFileImagesSet(File? prfileImageFile) async {


    Map<String, String> requestHeaders = {
      'Content-type': 'multipart/form-data',
    };

    var request = new http.MultipartRequest(
        "POST", Uri.parse("${AppConstants.fileUpload}"));

    print("${AppConstants.fileUpload}");
    print(requestHeaders);
    print(prfileImageFile);

    print(request.fields);
    request.headers.addAll(requestHeaders);
    if (prfileImageFile != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'File', prfileImageFile.path));
    }
    var data1 = await request.send().then((value) async {
      var res = await value.stream.toBytes();
      var alldata = String.fromCharCodes(res);

      print(value.statusCode);
      print(request.fields);
      var data = jsonDecode(alldata);
      if (value.statusCode == 200) {
        print(data);
        if (data != null) {
          print("*********");
          return data;
        } else {
          return data;
        }
      } else {}
      print(data);
      return null;
    });
    return data1;
  }
*/



