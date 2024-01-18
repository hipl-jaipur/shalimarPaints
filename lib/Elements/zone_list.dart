import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  // TerriotoryDataController terriotoryDataController =
  //     Get.put(TerriotoryDataController());
  // var terriotoryData = Get.put(CustomerHireDataController());
  // CustomerHireDataController customerHireDataController =
  //     Get.put(CustomerHireDataController());
  return GestureDetector(
    onTap: () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(
          'CustomerName', terriotoryList[index].levelName.toString());
      prefs.setInt('levelID', terriotoryList[index].levelID!.toInt());

      Get.to(MyCustomerDetailsPage(), arguments: [
        terriotoryList[index].levelName.toString(),
        terriotoryList[index].levelID,
      ]);

      // Get.to(MyCustomerDetailsPage(), arguments: terriotoryDataModel.data![index].territoryName.toString());
      // terriotoryDataController.fetchData(
      //     depotId: depotDataModel.data![index].depotId!.toInt());
      // Get.to(MyCustomerTerriotoryPage());
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
