import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shalimar/Controller/outstanding_controller.dart';
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Home_Screen/OutStanding_Module/outstanding_region_screen.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

import '../../Controller/set_activity_detail_data_controller.dart';
import '../../Elements/timer_widget.dart';

class OutStandingZone extends StatefulWidget {
  @override
  State<OutStandingZone> createState() => _OutStandingZoneState();
}

class _OutStandingZoneState extends State<OutStandingZone> {
  final TextEditingController searchController = TextEditingController();
  OutStandingController outStandingController =
      Get.put(OutStandingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OutStandingController>(
        init: OutStandingController(),
        builder: (outStandingController) {
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
                    child: GetBuilder<SetActivityDetailDataController>(
                  init: SetActivityDetailDataController(),
                  builder: (setActivityController) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: setActivityController.checkIn ? 40 : 20,
                              ),
                              TextField(
                                controller: searchController,
                                textInputAction: TextInputAction.search,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      20.0, 0.0, 20.0, 0.0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(
                                        color: Color(0xffECE6E6),
                                      )),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(
                                        color: Color(0xffECE6E6),
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(
                                        color: Color(0xffECE6E6),
                                      )),
                                  hintText: 'Search',
                                  prefixIcon: IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                        Icons.arrow_circle_left,
                                        color: primaryColor,
                                        size: 40,
                                      )),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        if (outStandingController
                                                .isLoading.value ==
                                            false) {
                                          outStandingController
                                              .getOutStandingData();
                                        } 
                                        else {
                                          showSnackBar("Please Wait", "Loading...",
                                              Colors.amberAccent);
                                        }
                                      },
                                      icon: Icon(
                                        Icons.refresh,
                                        color: outStandingController
                                                .isLoading.value
                                            ? primaryColor.withAlpha(4000)
                                            : primaryColor,
                                        size: 40,
                                      )),
                                ),
                                onChanged: (c) {
                                  setState(() {});
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                    "Zone - ${outStandingController.filteredZoneList!.length}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Obx(
                                () => outStandingController.isLoading.value
                                    ? Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.white),
                                      )
                                    : Expanded(
                                        child: ListView.builder(
                                          itemCount: outStandingController
                                              .filteredZoneList!.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return outStandingController
                                                    .filteredZoneList![index]!
                                                    .levelName!
                                                    .toLowerCase()
                                                    .contains(searchController
                                                        .text
                                                        .toLowerCase())
                                                ? Card(
                                                    child: Column(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            outStandingController
                                                                    .filteredRegionList =
                                                                outStandingController
                                                                    .filteredAllRegionList!
                                                                    .where((item) =>
                                                                        item.parentLevelID ==
                                                                        outStandingController
                                                                            .filteredZoneList![index]
                                                                            .levelID)
                                                                    .toList();
                                                            print(outStandingController
                                                                .filteredRegionList!
                                                                .length);
                                                            Get.to(
                                                                OutStandingRegion());
                                                          },
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12),
                                                            color: primaryLight,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  outStandingController
                                                                      .filteredZoneList![
                                                                          index]
                                                                      .levelName
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color:
                                                                          blackTextColor,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          'Nunito Sans'),
                                                                ),
                                                                Text(
                                                                  outStandingController
                                                                              .filteredZoneList![
                                                                                  index]
                                                                              .bucketTotal ==
                                                                          null
                                                                      ? "0"
                                                                      : formatNumber(outStandingController
                                                                          .filteredZoneList![
                                                                              index]
                                                                          .bucketTotal
                                                                          .truncate()),
                                                                  style: TextStyle(
                                                                      color:
                                                                          primaryColor,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          'Nunito Sans'),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          color:
                                                              Color(0xffFFD7D7),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "0-30 Days",
                                                                style: TextStyle(
                                                                    color:
                                                                        blackTextColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Nunito Sans'),
                                                              ),
                                                              Text(
                                                                outStandingController
                                                                            .filteredZoneList![
                                                                                index]
                                                                            .age030 ==
                                                                        null
                                                                    ? "0"
                                                                    : formatNumber(outStandingController
                                                                        .filteredZoneList![
                                                                            index]
                                                                        .age030
                                                                        .truncate()),
                                                                style: TextStyle(
                                                                    color:
                                                                        blackTextColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Nunito Sans'),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          color:
                                                              Color(0xffFFD7D7),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "31-60 Days",
                                                                style: TextStyle(
                                                                    color:
                                                                        blackTextColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Nunito Sans'),
                                                              ),
                                                              Text(
                                                                outStandingController
                                                                            .filteredZoneList![
                                                                                index]
                                                                            .age3160 ==
                                                                        null
                                                                    ? "0"
                                                                    : formatNumber(outStandingController
                                                                        .filteredZoneList![
                                                                            index]
                                                                        .age3160
                                                                        .truncate()),
                                                                style: TextStyle(
                                                                    color:
                                                                        blackTextColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Nunito Sans'),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          color:
                                                              Color(0xffFFD7D7),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "61-90 Days",
                                                                style: TextStyle(
                                                                    color:
                                                                        blackTextColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Nunito Sans'),
                                                              ),
                                                              Text(
                                                                outStandingController
                                                                            .filteredZoneList![
                                                                                index]
                                                                            .age6190 ==
                                                                        null
                                                                    ? "0"
                                                                    : formatNumber(outStandingController
                                                                        .filteredZoneList![
                                                                            index]
                                                                        .age6190
                                                                        .truncate()),
                                                                style: TextStyle(
                                                                    color:
                                                                        blackTextColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Nunito Sans'),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          color:
                                                              Color(0xffFFD7D7),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "91-120 Days",
                                                                style: TextStyle(
                                                                    color:
                                                                        blackTextColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Nunito Sans'),
                                                              ),
                                                              Text(
                                                                outStandingController
                                                                            .filteredZoneList![
                                                                                index]
                                                                            .age91120 ==
                                                                        null
                                                                    ? "0"
                                                                    : formatNumber(outStandingController
                                                                        .filteredZoneList![
                                                                            index]
                                                                        .age91120
                                                                        .truncate()),
                                                                style: TextStyle(
                                                                    color:
                                                                        blackTextColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Nunito Sans'),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          color:
                                                              Color(0xffFFD7D7),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "121-150 Days",
                                                                style: TextStyle(
                                                                    color:
                                                                        blackTextColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Nunito Sans'),
                                                              ),
                                                              Text(
                                                                outStandingController
                                                                            .filteredZoneList![
                                                                                index]
                                                                            .age121150 ==
                                                                        null
                                                                    ? "0"
                                                                    : formatNumber(outStandingController
                                                                        .filteredZoneList![
                                                                            index]
                                                                        .age121150
                                                                        .truncate()),
                                                                style: TextStyle(
                                                                    color:
                                                                        blackTextColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Nunito Sans'),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          color:
                                                              Color(0xffFFD7D7),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "151-180 Days",
                                                                style: TextStyle(
                                                                    color:
                                                                        blackTextColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Nunito Sans'),
                                                              ),
                                                              Text(
                                                                outStandingController
                                                                            .filteredZoneList![
                                                                                index]
                                                                            .age151180 ==
                                                                        null
                                                                    ? "0"
                                                                    : formatNumber(outStandingController
                                                                        .filteredZoneList![
                                                                            index]
                                                                        .age151180
                                                                        .truncate()),
                                                                style: TextStyle(
                                                                    color:
                                                                        blackTextColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Nunito Sans'),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          color:
                                                              Color(0xffFFD7D7),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Over 181 Days",
                                                                style: TextStyle(
                                                                    color:
                                                                        blackTextColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Nunito Sans'),
                                                              ),
                                                              Text(
                                                                outStandingController
                                                                            .filteredZoneList![
                                                                                index]
                                                                            .age181Above ==
                                                                        null
                                                                    ? "0"
                                                                    : formatNumber(outStandingController
                                                                        .filteredZoneList![
                                                                            index]
                                                                        .age181Above
                                                                        .truncate()),
                                                                style: TextStyle(
                                                                    color:
                                                                        blackTextColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Nunito Sans'),
                                                              )
                                                            ],
                                                          ),
                                                        ),

                                                        // Divider(),
                                                      ],
                                                    ),
                                                  )
                                                : SizedBox();
                                          },
                                        ),
                                      ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            child: Visibility(
                                visible: setActivityController.checkIn,
                                child: TimerWidget())),
                      ],
                    );
                  },
                ))
              ],
            ),
          ));
        });
  }

  String formatNumber(int number) {
    final formatter = NumberFormat(
      '#,##,##,##,###',
    );
    return formatter.format(number);
  }
}
