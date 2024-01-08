import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/checkin_screen.dart';
import 'package:shalimar/utils/colors.dart';

class CustomerProfileList extends StatefulWidget {
  const CustomerProfileList({super.key});

  @override
  State<CustomerProfileList> createState() => _CustomerProfileListState();
}

class _CustomerProfileListState extends State<CustomerProfileList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(children: [
          SizedBox(
            width: 100,
            height: 100,
            child: CircleAvatar(
              child: Icon(
                Icons.person_sharp,
                size: 50,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Balaji Traders",
              style: TextStyle(
                  color: blackTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
          SizedBox(
            height: 5,
          ),
          Text("ID:N221000086",
              style: TextStyle(
                  color: blackTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Govt. School Near Village Samogarbayana, Bharatput",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showSnackBar("You are CheckedIn at", "Balaji Traders",
                          Colors.greenAccent);
                      Get.to(CheckInPage());
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "Check in On-site",
                        style: TextStyle(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Check in Off-site",
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class CustomerProfileHorizontal extends StatefulWidget {
  const CustomerProfileHorizontal({super.key});

  @override
  State<CustomerProfileHorizontal> createState() =>
      _CustomerProfileHorizontalState();
}

class _CustomerProfileHorizontalState extends State<CustomerProfileHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                
                width: 80,
                height: 80,
                child: CircleAvatar(
                  child: Icon(
                    Icons.person_sharp,
                    size: 50,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Balaji Traders",
                    style: TextStyle(
                        color: blackTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 5,
                ),
                Text("ID:N221000086",
                    style: TextStyle(
                        color: blackTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Govt. School Near Village \nSamogarbayana, Bharatput",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
