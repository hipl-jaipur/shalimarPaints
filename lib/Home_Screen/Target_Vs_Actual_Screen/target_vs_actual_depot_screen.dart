import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Home_Screen/Target_Vs_Actual_Screen/target_vs_actual_territory_svreen.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

import '../../Controller/set_activity_detail_data_controller.dart';
import '../../Controller/target_vs_actual_controller.dart';
import '../../Elements/timer_widget.dart';

class TargetVsActualDepot extends StatefulWidget {
  @override
  State<TargetVsActualDepot> createState() => _TargetVsActualDepotState();
}

class _TargetVsActualDepotState extends State<TargetVsActualDepot> {
  final TextEditingController searchController = TextEditingController();
  TargetVsActualController targetVsActualController =
      Get.put(TargetVsActualController());

  @override
  void initState() {
    // TODO: implement initState
    if (targetVsActualController.filteredDepotList.isEmpty &&
        targetVsActualController.filteredAllDepotList.isNotEmpty) {
      targetVsActualController.filteredDepotList
          .addAll(targetVsActualController.filteredAllDepotList);
    }

    print('List: ${targetVsActualController.filteredDepotList}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TargetVsActualController>(
      init: TargetVsActualController(),
      builder: (controller) => Scaffold(
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
                      padding: const EdgeInsets.all(18.0),
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
                                    if (controller
                                            .isLoading.value ==
                                        false) {
                                      controller
                                          .getTargetVsActualData();
                                    } else {
                                      showSnackBar("Loading", "please Wait...",
                                          Colors.amberAccent);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.refresh,
                                    color:
                                        controller.isLoading.value
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
                          Text("Depot",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text("",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 15,
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
                                          .filteredDepotList!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return targetVsActualController
                                                .filteredDepotList![index]!
                                                .levelName!
                                                .toLowerCase()
                                                .contains(searchController.text
                                                    .toLowerCase())
                                            ? Card(
                                                child: Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        targetVsActualController
                                                                .filteredTerritorList =
                                                            targetVsActualController
                                                                .filteredAllTerritorList!
                                                                .where((item) =>
                                                                    item.parentLevelID ==
                                                                    targetVsActualController
                                                                        .filteredDepotList![
                                                                            index]
                                                                        .levelID)
                                                                .toList();
                                                        print(targetVsActualController
                                                            .filteredAllTerritorList!
                                                            .length);
                                                        Get.to(
                                                            TargetVsActualTerritory());
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(12),
                                                        color: primaryLight,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              targetVsActualController
                                                                  .filteredDepotList![
                                                                      index]
                                                                  .levelName
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color:
                                                                      blackTextColor,
                                                                  fontSize: 16,
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
                                                      color: Color(0xffFFD7D7),
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
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Nunito Sans'),
                                                          ),
                                                          Text(
                                                            targetVsActualController
                                                                        .filteredDepotList![
                                                                            index]
                                                                        .target ==
                                                                    null
                                                                ? "0"
                                                                : formatNumber(
                                                                    targetVsActualController
                                                                        .filteredDepotList![
                                                                            index]
                                                                        .target!
                                                                        .truncate()),
                                                            style: TextStyle(
                                                                color:
                                                                    blackTextColor,
                                                                fontSize: 16,
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
                                                      color: Color(0xffFFD7D7),
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
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Nunito Sans'),
                                                          ),
                                                          Text(
                                                            targetVsActualController
                                                                        .filteredDepotList![
                                                                            index]
                                                                        .sales ==
                                                                    null
                                                                ? "0"
                                                                : formatNumber(
                                                                    targetVsActualController
                                                                        .filteredDepotList![
                                                                            index]
                                                                        .sales!
                                                                        .truncate()),
                                                            style: TextStyle(
                                                                color:
                                                                    blackTextColor,
                                                                fontSize: 16,
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
                                                      color: Color(0xffFFD7D7),
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
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Nunito Sans'),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                targetVsActualController
                                                                            .filteredDepotList![
                                                                                index]
                                                                            .achivementPer ==
                                                                        null
                                                                    ? "0"
                                                                    : formatNumber(targetVsActualController
                                                                        .filteredDepotList![
                                                                            index]
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
      )),
    );
  }

  String formatNumber(int number) {
    final formatter = NumberFormat(
      '#,##,##,##,###',
    );
    return formatter.format(number);
  }
}
