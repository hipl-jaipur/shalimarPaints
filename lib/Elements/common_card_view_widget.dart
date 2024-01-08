import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_depot_screen.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_detail_screen.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_regions_screen.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_terriotory_screen.dart';
import 'package:shalimar/utils/colors.dart';

Widget cardList(
  String tagZone,
  String zoneName,
  String GMName,
  bool isVisible,
) {
  return GestureDetector(
    onTap: () {
      if (tagZone == "Zone") {
        Get.to(MyCustomerRegionsPage());
      } else if (tagZone == "Region") {
        Get.to(MyCustomerDepotPage());
      } else if (tagZone == "Depot") {
        Get.to(MyCustomerTerriotoryPage());
      } else if (tagZone == "Terriotory") {
        Get.to(MyCustomerDetailsPage());
      }
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
                Text(zoneName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 10,
                ),
                Visibility(
                  visible: isVisible,
                  child: Text(GMName,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
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

class CheckInCardView extends StatelessWidget {
  String title;
  VoidCallback onPressed;
  CheckInCardView({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                children: [
                  Icon(
                    Icons.menu_book_outlined,
                    size: 25,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              )),
        ),
      ),
    );
  }
}
