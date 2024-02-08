import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shalimar/Controller/customer_hire_data_controller.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_depot_screen.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_detail_screen.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_regions_screen.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_terriotory_screen.dart';
import 'package:shalimar/Model/customer_data_model.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget zoneList(
  BuildContext context,
  int index,
  // ZoneDataModel zoneDataModel,
) {
  // RegionDataController regionDataController = Get.put(RegionDataController());
  CustomerHireDataController customerHireDataController =
      Get.put(CustomerHireDataController());
  return GestureDetector(
    onTap: () {
      // regionDataController.fetchData(
      //     zoneId: customerHireDataController.zoneList[index].levelID!.toInt());
      // Get.to(MyCustomerRegionsPage());

      Get.to(MyCustomerRegionsPage(), arguments: [
        customerHireDataController.zoneList[index].levelName.toString(),
        customerHireDataController.zoneList[index].levelID,
      ]);
    },
    child: Card(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    customerHireDataController.zoneList[index].levelName
                        .toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 10,
                ),
                Text(
                    "${customerHireDataController.zoneList[index].levelMgrName.toString()} (${customerHireDataController.zoneList[index].levelMgrDesignation.toString()})",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            Icon(
              Icons.arrow_right,
              size: 30,
              color: primaryColor,
            )
          ],
        ),
      )),
    ),
  );
}

Widget regionList(
  BuildContext context,
  int index,
  List<Data> regionListNew,
) {
  // DepotDataController depotDataController = Get.put(DepotDataController());
  // CustomerHireDataController customerHireDataController =
  //     Get.put(CustomerHireDataController());

  return GestureDetector(
    onTap: () {
      // depotDataController.fetchData(
      //     regionId: regionListNew[index].levelID!.toInt());
      Get.to(MyCustomerDepotPage(), arguments: [
        regionListNew[index].levelName.toString(),
        regionListNew[index].levelID,
      ]);
    },
    child: Card(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(regionListNew[index].levelName.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_right,
              size: 30,
              color: primaryColor,
            )
          ],
        ),
      )),
    ),
  );
}

Widget depotListData(
  BuildContext context,
  int index,
  List<Data> depotList,
) {
  // TerriotoryDataController terriotoryDataController =
  //     Get.put(TerriotoryDataController());
  // CustomerHireDataController customerHireDataController =
  //     Get.put(CustomerHireDataController());

  return GestureDetector(
    onTap: () {
      // terriotoryDataController.fetchData(
      //     depotId:
      //         customerHireDataController.depotList[index].levelID!.toInt());
      Get.to(MyCustomerTerriotoryPage(), arguments: [
        depotList[index].levelName.toString(),
        depotList[index].levelID,
      ]);
    },
    child: Card(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(depotList[index].levelName.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_right,
              size: 30,
              color: primaryColor,
            )
          ],
        ),
      )),
    ),
  );
}

Widget terriotoryListData(
  BuildContext context,
  int index,
  List<Data> terriotoryList,
) {
  return GestureDetector(
    onTap: () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final hasPermission = await _handleLocationPermission(context);

      if (!hasPermission) {
        Get.dialog(
            barrierDismissible: false,
            Dialog(
              backgroundColor: Colors.white,
              child: WillPopScope(
                onWillPop: () async => false,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Alert!!",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Your App Location services are not Allow. Please Allow Your App Location services From App Permission.",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context)
                          //     .pop();
                          openAppSettings();
                          Get.back();
                          // _modalBottomSheetMenu();
                        },
                        child: Center(
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Text(
                              "Go To Settings",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ));

        // return;
      } else {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(
            'CustomerName', terriotoryList[index].levelName.toString());
        prefs.setInt('levelID', terriotoryList[index].levelID!.toInt());

        Get.to(MyCustomerDetailsPage(), arguments: [
          terriotoryList[index].levelName.toString(),
          terriotoryList[index].levelID,
        ]);
      }
    },
    child: Card(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(terriotoryList[index].levelName.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_right,
              size: 30,
              color: primaryColor,
            )
          ],
        ),
      )),
    ),
  );
}

Future<bool> _handleLocationPermission(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location services are disabled. Please enable the services')));
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')));
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location permissions are permanently denied, we cannot request permissions.')));
    return false;
  }
  return true;
}
