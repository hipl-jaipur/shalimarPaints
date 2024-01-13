import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/outstanding_controller.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/Home_Screen/OutStanding_Module/outstanding_region_screen.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class OutStandingZone extends StatefulWidget {


  @override
  State<OutStandingZone> createState() => _OutStandingZoneState();
}

class _OutStandingZoneState extends State<OutStandingZone> {
  final TextEditingController _searchController = TextEditingController();
  OutStandingController outStandingController =
      Get.put(OutStandingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OutStandingController>(
        init: OutStandingController(),
    builder: (outStandingController) {
    return Scaffold(

        // ashutosh
        //karishma
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
                        Text("Zone",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text("",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        // SizedBox(
                        //   height: 15,
                        // ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: outStandingController.filteredZoneList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        outStandingController.filteredRegionList = outStandingController
                                            .filteredAllRegionList!.where((item) => item.parentLevelID == outStandingController.filteredZoneList![index].levelID ).toList();
                                        print(outStandingController.filteredRegionList!.length);
                                        Get.to(OutStandingRegion());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        color: primaryLight,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              outStandingController.filteredZoneList![index].levelName.toString(),
                                              style: TextStyle(
                                                  color: blackTextColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Nunito Sans'),
                                            ),
                                            Text(
                                              outStandingController.filteredZoneList![index].bucketTotal==null?"0":outStandingController.filteredZoneList![index].bucketTotal.truncate().toString(),
                                              style: TextStyle(
                                                  color: blackTextColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Nunito Sans'),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      color: Color(0xffFFD7D7),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "0-30 Days",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily:
                                                'Nunito Sans'),
                                          ),
                                          Text(outStandingController.filteredZoneList![index].age030.toString() ?? 0.0.toString(),
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily:
                                                'Nunito Sans'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      color: Color(0xffFFD7D7),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "31-60 Days",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily:
                                                'Nunito Sans'),
                                          ),
                                          Text(outStandingController.filteredZoneList![index].age3160.toString() ?? 0.0.toString(),
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily:
                                                'Nunito Sans'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      color: Color(0xffFFD7D7),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "61-90 Days",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily:
                                                'Nunito Sans'),
                                          ),
                                          Text(outStandingController.filteredZoneList![index].age6190.toString() ?? 0.0.toString(),
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily:
                                                'Nunito Sans'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      color: Color(0xffFFD7D7),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "91-120 Days",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily:
                                                'Nunito Sans'),
                                          ),
                                          Text(outStandingController.filteredZoneList![index].age91120.toString() ?? 0.0.toString(),
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily:
                                                'Nunito Sans'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      color: Color(0xffFFD7D7),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "121-150 Days",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily:
                                                'Nunito Sans'),
                                          ),
                                          Text(outStandingController.filteredZoneList![index].age121150.toString() ?? 0.0.toString(),
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily:
                                                'Nunito Sans'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      color: Color(0xffFFD7D7),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "151-180 Days",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily:
                                                'Nunito Sans'),
                                          ),
                                          Text(outStandingController.filteredZoneList![index].age151180.toString() ?? 0.0.toString(),
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily:
                                                'Nunito Sans'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      color: Color(0xffFFD7D7),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "Over 181 Days",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily:
                                                'Nunito Sans'),
                                          ),
                                          Text(outStandingController.filteredZoneList![index].age181Above.toString(),
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily:
                                                'Nunito Sans'),
                                          )
                                        ],
                                      ),
                                    ),

                                    // Divider(),

                                  ],
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
        )); });
  }
}
