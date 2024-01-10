import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/outstanding_controller.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/Model/OutStandingModel.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class OutStandingCustomer extends StatefulWidget {
  final String territoryName;
  final String days;
  final String price;

  const OutStandingCustomer(
      {super.key,
      required this.territoryName,
      required this.days,
      required this.price});

  @override
  State<OutStandingCustomer> createState() => _OutStandingCustomerState();
}

class _OutStandingCustomerState extends State<OutStandingCustomer> {
  final TextEditingController _searchController = TextEditingController();
  OutStandingController outStandingController =
      Get.put(OutStandingController());
  List<OutStandingList> uniquenum = [];

  // Remove duplicates based on the "id" key

  @override
  void initState() {
    super.initState();

    uniquenum = removeDuplicatesByKey();

    print(uniquenum.length);
  }

  removeDuplicatesByKey() {
    Set<dynamic> seen = Set<dynamic>();
    List<OutStandingList> uniqueList = [];

    for (var map in outStandingController.customerOsDataList) {
      if (seen.add(map.areaName)) {
        uniqueList.add(map);
      }
    }

    return uniqueList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              child: Image.asset(
                Images.bg_3,
                fit: BoxFit.fill,
              )),
          Positioned(
              child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                searchBar(_searchController),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "Customer - ${outStandingController.customerOsDataList.length}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text(widget.days,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: outStandingController.customerOsDataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              CircleAvatar(child: Icon(Icons.person_rounded),),
                              SizedBox(width: 10,),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                              outStandingController
                                                  .customerOsDataList[index]
                                                  .customername
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Text(
                                            widget.days == "0-30 Days"
                                                ? "\u{20B9}${outStandingController.customerOsDataList[index].age030.toString()}"
                                                : widget.days == "30-60 Days"
                                                    ? "\u{20B9}${outStandingController.customerOsDataList[index].age3160.toString()}"
                                                    : widget.days == "60-90 Days"
                                                        ? "\u{20B9}${outStandingController.customerOsDataList[index].age6190.toString()}"
                                                        : widget.days == "90-120 Days"
                                                            ? "\u{20B9}${outStandingController.customerOsDataList[index].age91120.toString()}:"
                                                            : widget.days ==
                                                                    "120-180 Days"
                                                                ? "\u{20B9}${outStandingController.customerOsDataList[index].age151180.toString()}"
                                                                : "\u{20B9}${outStandingController.customerOsDataList[index].age181Above.toString()}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Text(
                                        outStandingController
                                            .customerOsDataList[index].customercode
                                            .toString(),
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
