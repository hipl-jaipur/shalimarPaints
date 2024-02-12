import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shalimar/Controller/outstanding_controller.dart';
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

import '../../Controller/set_activity_detail_data_controller.dart';
import '../../Elements/timer_widget.dart';
import 'outstanding_depot_Screen.dart';

class OutStandingRegion extends StatefulWidget {
  @override
  State<OutStandingRegion> createState() => _OutStandingRegionState();
}

class _OutStandingRegionState extends State<OutStandingRegion> {
  final TextEditingController searchController = TextEditingController();
  OutStandingController outStandingController =
      Get.put(OutStandingController());
  @override
  void initState() {
    // TODO: implement initState
    if (outStandingController.filteredRegionList.isEmpty &&
        outStandingController.filteredAllRegionList.isNotEmpty) {
      outStandingController.filteredRegionList
          .addAll(outStandingController.filteredAllRegionList);
    }

    print('List: ${outStandingController.filteredRegionList}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OutStandingController>(
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
                                    if (controller.isLoading.value == false) {
                                      controller.getOutStandingData();
                                    } else {
                                      showSnackBar("Please Wait", "Loading...",
                                          Colors.amberAccent);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.refresh,
                                    color: controller.isLoading.value
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
                          Text("Region",
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
                            () => outStandingController.isLoading.value
                                ? Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.white),
                                  )
                                : Expanded(
                                    child: ListView.builder(
                                      itemCount: outStandingController
                                          .filteredRegionList!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return outStandingController
                                                .filteredRegionList![index]!
                                                .levelName!
                                                .toLowerCase()
                                                .contains(searchController.text
                                                    .toLowerCase())
                                            ? Card(
                                                child: Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        outStandingController
                                                                .filteredDepotList =
                                                            outStandingController
                                                                .filteredAllDepotList!
                                                                .where((item) =>
                                                                    item.parentLevelID ==
                                                                    outStandingController
                                                                        .filteredRegionList![
                                                                            index]
                                                                        .levelID)
                                                                .toList();
                                                        print(outStandingController
                                                            .filteredDepotList!
                                                            .length);
                                                        Get.to(
                                                            OutStandingDepot());
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
                                                              outStandingController
                                                                  .filteredRegionList![
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
                                                            Text(
                                                              outStandingController
                                                                          .filteredRegionList![
                                                                              index]
                                                                          .bucketTotal ==
                                                                      null
                                                                  ? "0"
                                                                  : formatNumber(outStandingController
                                                                      .filteredRegionList![
                                                                          index]
                                                                      .bucketTotal
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
                                                            "0-30 Days",
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
                                                            outStandingController
                                                                        .filteredRegionList![
                                                                            index]
                                                                        .age030 ==
                                                                    null
                                                                ? "0"
                                                                : formatNumber(
                                                                    outStandingController
                                                                        .filteredRegionList![
                                                                            index]
                                                                        .age030
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
                                                            "31-60 Days",
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
                                                            outStandingController
                                                                        .filteredRegionList![
                                                                            index]
                                                                        .age3160 ==
                                                                    null
                                                                ? "0"
                                                                : formatNumber(
                                                                    outStandingController
                                                                        .filteredRegionList![
                                                                            index]
                                                                        .age3160
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
                                                            "61-90 Days",
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
                                                            outStandingController
                                                                        .filteredRegionList![
                                                                            index]
                                                                        .age6190 ==
                                                                    null
                                                                ? "0"
                                                                : formatNumber(
                                                                    outStandingController
                                                                        .filteredRegionList![
                                                                            index]
                                                                        .age6190
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
                                                            "91-120 Days",
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
                                                            outStandingController
                                                                        .filteredRegionList![
                                                                            index]
                                                                        .age91120 ==
                                                                    null
                                                                ? "0"
                                                                : formatNumber(
                                                                    outStandingController
                                                                        .filteredRegionList![
                                                                            index]
                                                                        .age6190
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
                                                            "121-150 Days",
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
                                                            outStandingController
                                                                        .filteredRegionList![
                                                                            index]
                                                                        .age121150 ==
                                                                    null
                                                                ? "0"
                                                                : formatNumber(outStandingController
                                                                    .filteredRegionList![
                                                                        index]
                                                                    .age121150
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
                                                            "151-180 Days",
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
                                                            outStandingController
                                                                        .filteredRegionList![
                                                                            index]
                                                                        .age151180 ==
                                                                    null
                                                                ? "0"
                                                                : formatNumber(outStandingController
                                                                    .filteredRegionList![
                                                                        index]
                                                                    .age151180
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
                                                            "Over 181 Days",
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
                                                            outStandingController
                                                                        .filteredRegionList![
                                                                            index]
                                                                        .age181Above ==
                                                                    null
                                                                ? "0"
                                                                : formatNumber(outStandingController
                                                                    .filteredRegionList![
                                                                        index]
                                                                    .age181Above
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
