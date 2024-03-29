import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shalimar/Controller/outstanding_controller.dart';
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Home_Screen/Target_Vs_Actual_Screen/target_vas_actual_region_screen.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

import '../../Controller/set_activity_detail_data_controller.dart';
import '../../Controller/target_vs_actual_controller.dart';
import '../../Elements/timer_widget.dart';

class TargetVsActualZone extends StatefulWidget {
  @override
  State<TargetVsActualZone> createState() => _TargetVsActualZoneState();
}

class _TargetVsActualZoneState extends State<TargetVsActualZone> {
  final TextEditingController searchController = TextEditingController();
  OutStandingController outStandingController =
      Get.put(OutStandingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TargetVsActualController>(
        init: TargetVsActualController(),
        builder: (targetVsActualController) {
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
                                        if (targetVsActualController.isLoading.value ==
                                            false) {
                                          targetVsActualController
                                              .getTargetVsActualData();
                                        }else{
                                          showSnackBar("Loading", "please Wait...", Colors.amberAccent);
                                        }

                                        // outStandingController
                                        //     .getOutStandingData();
                                      },
                                      icon: Icon(
                                        Icons.refresh,
                                        color: targetVsActualController.isLoading.value
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
                                    "Zone - ${targetVsActualController.filteredZoneList!.length}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Obx(
                                () => targetVsActualController.isLoading.value
                                    ? Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.white),
                                      )
                                    : Expanded(
                                        child: ListView.builder(
                                          itemCount: targetVsActualController
                                              .filteredZoneList!.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return targetVsActualController
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
                                                            targetVsActualController
                                                                    .filteredRegionList =
                                                                targetVsActualController
                                                                    .filteredAllRegionList!
                                                                    .where((item) =>
                                                                        item.parentLevelID ==
                                                                        targetVsActualController
                                                                            .filteredZoneList![index]
                                                                            .levelID)
                                                                    .toList();
                                                            print(targetVsActualController
                                                                .filteredRegionList!
                                                                .length);
                                                            Get.to(
                                                                TargetVsActyalRegion());
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
                                                                  targetVsActualController
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
                                                                "Target",
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
                                                                targetVsActualController
                                                                            .filteredZoneList![
                                                                                index]
                                                                            .target ==
                                                                        null
                                                                    ? "0"
                                                                    : formatNumber(targetVsActualController
                                                                        .filteredZoneList![
                                                                            index]!
                                                                        .target!
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
                                                                "Sales",
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
                                                                targetVsActualController
                                                                            .filteredZoneList![
                                                                                index]
                                                                            .sales ==
                                                                        null
                                                                    ? "0"
                                                                    : formatNumber(targetVsActualController
                                                                        .filteredZoneList![
                                                                            index]
                                                                        .sales!
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
                                                                "Achivement",
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
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    targetVsActualController.filteredZoneList![index].achivementPer ==
                                                                            null
                                                                        ? "0"
                                                                        : formatNumber(targetVsActualController
                                                                            .filteredZoneList![index]
                                                                            .achivementPer!
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
                                                                  ),
                                                                  Text(
                                                                    "%",
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
                                                                ],
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
