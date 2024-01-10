import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shalimar/Services/outstanding_customer_service.dart';

import '../Model/OutStandingModel.dart';

class OutStandingController extends GetxController {
  TextEditingController zoneIdController = TextEditingController();
  var isLoading = false.obs;
  var isLoading2 = false.obs;
  var customerOsDataList = <OutStandingList>[].obs;
var day30 =0.0.obs;
var day60 =0.0.obs;
var day90 =0.0.obs;
var day120 =0.0.obs;
var day180 =0.0.obs;
var over180days =0.0.obs;
var totalPrice =0.0.obs;
  getOutStandingData(var zoneId,resgionId,territoryId,depotId) async {
    isLoading(true);
    var fetchedState = await CustomerHireDataServices.getOutStaning( zoneId,resgionId,depotId,territoryId);
    isLoading(false);

    if (fetchedState != null) {
      customerOsDataList.value = fetchedState.data??[];
      print('Data OutStanding Length : ${customerOsDataList.length}');
      for(var array in customerOsDataList){
        day30.value  = day30.value  + array.age030!.toDouble();
        day60.value   =day60.value +array.age3160!.toDouble();
        day90.value   = day90.value+ array.age6190!.toDouble();
        day120.value   =  day120.value + array.age91120!.toDouble();
        day180.value     =  day180.value+ array.age181Above!.toDouble();
        over180days.value = over180days.value +array.age91120!.toDouble();
      }
      totalPrice.value= day30.value+ day90.value+day60.value+day120.value+day180.value + over180days.value;

      print(totalPrice);
    }
    }
  }
/*
  fetchZoneData({required int zoneId}) async {
    try {
      isLoading(true);
      print('Zone Data api called');

      final body = {
        "ZoneId": zoneId,
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      print("**********");

      final res = await http.post(Uri.parse(AppConstants.getustomerOsData),
          body: jsonEncode(body), headers: requestHeaders);

      print(res);

      if (kDebugMode) {
        print("******Zone Data Api Call****");
        print(AppConstants.getZoneData);
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
            zoneDataModel = ZoneDataModel.fromJson(result);
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
*/



