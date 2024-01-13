import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/customer_hire_data_controller.dart';
import 'package:shalimar/Controller/depot_data_controller.dart';
import 'package:shalimar/Controller/region_data_controller.dart';
import 'package:shalimar/Controller/terriotory_data_controller.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_depot_screen.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_detail_screen.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_regions_screen.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_terriotory_screen.dart';
import 'package:shalimar/utils/colors.dart';

Widget zoneList(
  BuildContext context,
  int index,
  // ZoneDataModel zoneDataModel,
) {
  RegionDataController regionDataController = Get.put(RegionDataController());
  CustomerHireDataController customerHireDataController =
      Get.put(CustomerHireDataController());
  return GestureDetector(
    onTap: () {
      regionDataController.fetchData(
          zoneId: customerHireDataController.zoneList[index].levelID!.toInt());
      Get.to(MyCustomerRegionsPage());
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
) {
  DepotDataController depotDataController = Get.put(DepotDataController());
  CustomerHireDataController customerHireDataController =
      Get.put(CustomerHireDataController());

  return GestureDetector(
    onTap: () {
      depotDataController.fetchData(
          regionId:
              customerHireDataController.regionsList![index].levelID!.toInt());
      Get.to(MyCustomerDepotPage());
    },
    child: Card(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                customerHireDataController.regionsList[index].levelName
                    .toString(),
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

Widget depotList(
  BuildContext context,
  int index,
) {
  TerriotoryDataController terriotoryDataController =
      Get.put(TerriotoryDataController());
  CustomerHireDataController customerHireDataController =
      Get.put(CustomerHireDataController());

  return GestureDetector(
    onTap: () {
      terriotoryDataController.fetchData(
          depotId:
              customerHireDataController.depotList[index].levelID!.toInt());
      Get.to(MyCustomerTerriotoryPage(),
          arguments:
              customerHireDataController.depotList[index].levelName.toString());
    },
    child: Card(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                customerHireDataController.depotList[index].levelName
                    .toString(),
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

Widget terriotoryList(
  BuildContext context,
  int index,
) {
  TerriotoryDataController terriotoryDataController =
      Get.put(TerriotoryDataController());
  // var terriotoryData = Get.put(CustomerHireDataController());
  CustomerHireDataController customerHireDataController =
      Get.put(CustomerHireDataController());
  return GestureDetector(
    onTap: () {
      Get.to(MyCustomerDetailsPage(), arguments: [
        customerHireDataController.terriotoryList[index].levelName.toString(),
        customerHireDataController.terriotoryList[index].levelID, 
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
            Text(customerHireDataController!.terriotoryList[index].levelName.toString(),
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
