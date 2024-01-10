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
import 'package:shalimar/Model/depot_data_model.dart';
import 'package:shalimar/Model/region_data_model.dart';
import 'package:shalimar/Model/terriotory_data_model.dart';
import 'package:shalimar/Model/zone_data_model.dart';
import 'package:shalimar/utils/colors.dart';

Widget zoneList(
  BuildContext context,
  int index,
  ZoneDataModel zoneDataModel,
) {
  RegionDataController regionDataController = Get.put(RegionDataController());
  return GestureDetector(
    onTap: () {
      regionDataController.fetchData(
          zoneId: zoneDataModel.data![index].zoneId!.toInt());
      Get.to(MyCustomerRegionsPage());
      // if (tagZone == "Zone") {
      //   regionDataController.fetchData(
      //       zoneId: zoneDataModel.data![index].zoneId!.toInt());
      //   Get.to(MyCustomerRegionsPage());
      // }
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
                Text(zoneDataModel.data![index].zoneName.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 10,
                ),
                Text(
                    "${zoneDataModel.data![index].zonemgrName.toString()} (General Manager)",
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
  RegionDataModel regionDataModel,
) {
  DepotDataController depotDataController = Get.put(DepotDataController());
  return GestureDetector(
    onTap: () {
      depotDataController.fetchData(
          regionId: regionDataModel.data![index].regionId!.toInt());
      Get.to(MyCustomerDepotPage());
    },
    child: Card(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(regionDataModel.data![index].regionName.toString(),
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
  DepotDataModel depotDataModel,
) {
  TerriotoryDataController terriotoryDataController =
      Get.put(TerriotoryDataController());

  return GestureDetector(
    onTap: () {
      terriotoryDataController.fetchData(
          depotId: depotDataModel.data![index].depotId!.toInt());
      Get.to(MyCustomerTerriotoryPage(),
          arguments: depotDataModel.data![index].depotName.toString());
    },
    child: Card(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(depotDataModel.data![index].depotName.toString(),
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
  TerriotoryDataModel terriotoryDataModel,
) {
  TerriotoryDataController terriotoryDataController =
      Get.put(TerriotoryDataController());
  var terriotoryData = Get.put(CustomerHireDataController());
  return GestureDetector(
    onTap: () {
      // terriotoryData
      //     .getCustomerHireData(terriotoryDataModel.data![index].territoryid)
      //     .then((value) {
      //   if (value != null) {
      //     Get.to(MyCustomerDetailsPage(), arguments:[ terriotoryDataModel.data![index].territoryName.toString(), terriotoryDataModel.data![index].territoryid]);
      //   }
      // });
       Get.to(MyCustomerDetailsPage(), arguments:[ terriotoryDataModel.data![index].territoryName.toString(), terriotoryDataModel.data![index].territoryid]);

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
            Text(terriotoryDataModel.data![index].territoryName.toString(),
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
