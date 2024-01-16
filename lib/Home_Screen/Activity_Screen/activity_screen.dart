import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import '../../Controller/activity_controller.dart';
import '../../Controller/stock_controller.dart';
import '../../Elements/common_searchbar_widget.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

class CustomerActivityScreen extends StatefulWidget {
  const CustomerActivityScreen({super.key});

  @override
  State<CustomerActivityScreen> createState() => _CustomerActivityScreenState();
}

class _CustomerActivityScreenState extends State<CustomerActivityScreen> {
  final TextEditingController searchController = TextEditingController();
  ActivityController controller = Get.put(ActivityController());
  @override
  void initState() {
    // TODO: implement initState
    controller.getActivityData("");
    controller.getActivityMasterData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActivityController>(
        init: ActivityController(),
        builder: (controller) {
          return Scaffold(
              body: controller.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SafeArea(
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
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide(
                                          color: Color(0xffECE6E6),
                                        )),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide(
                                          color: Color(0xffECE6E6),
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
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
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.sort_rounded,
                                          color: primaryColor,
                                          size: 40,
                                        )),
                                  ),
                                  onChanged: (v) {
                                    setState(() {});
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.isActivity =
                                        !controller.isActivity;
                                    controller.update();
                                  },
                                  child: Container(
                                    height: 35,
                                    color: primaryColor,
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Select Activity',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Icon(Icons.arrow_drop_down_sharp)
                                      ],
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: controller.isActivity,
                                  child: Column(
                                    children: [
                                      controller.activityMasterDataModel != null
                                          ? Container(
                                              height: 300,
                                              color: primaryLight,
                                              child: ListView.builder(
                                                itemCount: controller
                                                    .activityMasterDataModel!
                                                    .data!
                                                    .length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        dynamic index) {
                                                  return Row(
                                                    children: [
                                                      Checkbox(
                                                          value: controller
                                                              .sectionlist
                                                              .contains(controller
                                                                  .activityMasterDataModel!
                                                                  .data![index]
                                                                  .activityID),
                                                          onChanged: (v) {
                                                            if (controller
                                                                .sectionlist
                                                                .contains(controller
                                                                    .activityMasterDataModel!
                                                                    .data![
                                                                        index]
                                                                    .activityID)) {
                                                              controller
                                                                  .sectionlist
                                                                  .remove(controller
                                                                      .activityMasterDataModel!
                                                                      .data![
                                                                          index]
                                                                      .activityID);
                                                            } else {
                                                              controller
                                                                  .sectionlist
                                                                  .add(controller
                                                                      .activityMasterDataModel!
                                                                      .data![
                                                                          index]
                                                                      .activityID);
                                                            }

                                                            controller.update();
                                                            print(controller
                                                                .sectionlist);
                                                          }),
                                                      Container(
                                                        child: Text(
                                                          controller
                                                              .activityMasterDataModel!
                                                              .data![index]
                                                              .activityName
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Raleway',
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            )
                                          : SizedBox(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (controller
                                                  .sectionlist.isNotEmpty) {
                                                controller
                                                    .filterActivityDataModel!
                                                    .data!
                                                    .clear();
                                                for (var add in controller
                                                    .activityDataModel!.data!) {
                                                  controller
                                                      .filterActivityDataModel!
                                                      .data!
                                                      .add(add);
                                                }
                                                controller.isActivity = false;
                                                controller
                                                    .filterActivityDataModel!
                                                    .data!
                                                    .removeWhere((item) =>
                                                        !controller.sectionlist
                                                            .contains(item
                                                                .activityID));

                                                controller.update();
                                              }
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 30,
                                              color: primaryColor,
                                              child: Center(
                                                child: Text(
                                                  'Apply',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Raleway',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child:
                                        controller.filterActivityDataModel !=
                                                null
                                            ? controller
                                                    .filterActivityDataModel!
                                                    .data!
                                                    .isNotEmpty
                                                ? ListView.builder(
                                                    itemCount: controller
                                                        .filterActivityDataModel!
                                                        .data!
                                                        .length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            dynamic index) {
                                                          DateTime dateTime = DateTime.parse(controller.filterActivityDataModel!.data![index].createdOn.toString());
                                                          String formattedDate = formatDateWithoutTime(dateTime);
                                                      var date = DateFormat(
                                                              'dd/mm/yyyy')
                                                          .format(DateTime
                                                              .parse(controller
                                                                  .filterActivityDataModel!
                                                                  .data![index]
                                                                  .createdOn
                                                                  .toString()));
                                                      return controller
                                                              .filterActivityDataModel!
                                                              .data![index]!
                                                              .customername!
                                                              .toLowerCase()
                                                              .contains(
                                                                  searchController
                                                                      .text
                                                                      .toLowerCase())
                                                          ? Card(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          FittedBox(
                                                                        fit: BoxFit
                                                                            .fill,
                                                                        child:
                                                                            Row(
                                                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(controller.filterActivityDataModel!.data![index].customername.toString(),
                                                                                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                                                                            Text("(${controller.filterActivityDataModel!.data![index].customerCode.toString()}) ",
                                                                                style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w600)),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                        "Activity : ${controller.filterActivityDataModel!.data![index].activityName.toString()}",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.bold)),
                                                                    SizedBox(
                                                                      height:
                                                                          12,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(formattedDate,
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w700)),
                                                                      ],
                                                                    ),

                                                                    // Divider(),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          : SizedBox();
                                                    },
                                                  )
                                                : Center(
                                                    child: Text("No Data Found",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  )
                                            : SizedBox())
                              ],
                            ),
                          ))
                        ],
                      ),
                    ));
        });
  }
  String formatDateWithoutTime(DateTime dateTime) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }
}
