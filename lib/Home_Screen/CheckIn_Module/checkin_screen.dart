import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/get_available_stock_data-controller.dart';
import 'package:shalimar/Controller/get_customer_note_data_controller.dart';
import 'package:shalimar/Controller/get_customer_schedule_data_controller.dart';
import 'package:shalimar/Controller/get_order_data_controller.dart';
import 'package:shalimar/Controller/get_user_activity_master_data_controller.dart';
import 'package:shalimar/Controller/plant_data_controller.dart';
import 'package:shalimar/Controller/product_data_controller.dart';
import 'package:shalimar/Controller/set_activity_detail_data_controller.dart';
import 'package:shalimar/Controller/set_order_data_controller.dart';
import 'package:shalimar/Controller/subcategory_data_controller.dart';
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Elements/common_card_view_widget.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/customer_profile_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/make_complain_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/schedule_visit_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/take_note_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/take_order_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/view_open_order_screen.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class CheckInPage extends StatefulWidget {
  // String? levelName;
  // String? levelCode;
  // String? levelAddress;
  // bool? isCheckinOnSite;

  CheckInPage({
    super.key,
    // this.levelName,
    // this.levelCode,
    // this.levelAddress,
    // this.isCheckinOnSite,
  });

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  SetActivityDetailDataController controller =
      Get.put(SetActivityDetailDataController());

  GetAvailableStockDataController stockController =
      Get.put(GetAvailableStockDataController());

  PlantDataController plantDataController = Get.put(PlantDataController());

  SubCategoryDataController subCategoryDataController =
      Get.put(SubCategoryDataController());

  ProductDataController productDataController =
      Get.put(ProductDataController());

  SetOrderDataController setOrderDataController =
      Get.put(SetOrderDataController());

  GetOrderDataController orderDataController =
      Get.put(GetOrderDataController());

  // var customerProfileData = Tag != "orderSuccess" ? Get.arguments : null;

  // var customerProfileData = Get.arguments;

  Timer? _timer;
  int _start = 0;
  GetNoteDataController noteDataController = Get.put(GetNoteDataController());
  GetScheduleDataController scheduleDataController =
      Get.put(GetScheduleDataController());
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _start++;
      });
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    // noteDataController.levelCode.value = controller.levelCode.value;
    noteDataController.fetchData(controller.levelCode.value);
    scheduleDataController.fetchData(controller.levelCode.value);
  }

  double _appBarHeight = 60.0;

  void _openBottomAppBar() {
    setState(() {
      if (_appBarHeight > 60) {
        _appBarHeight = 60.0;
      } else {
        _appBarHeight = 300.0;
      }
    });
  }

  GetUserActivityController getUserActivityController =
      Get.put(GetUserActivityController());

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
                child: Obx(
                  () => controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Visibility(
                                      visible: controller.isCheckinOnSite.value,
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.timer,
                                              size: 30,
                                              color: primaryColor,
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text(
                                              "Checkin Timer: ${_start}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.fetchData(
                                            levelCode:
                                                controller.levelCode.value,
                                            activityID: 10);
                                        showSnackBar(
                                            "You are Checked out at",
                                            controller.levelName.value,
                                            Colors.greenAccent);
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: SingleChildScrollView(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.logout_outlined,
                                                size: 30,
                                                color: primaryColor,
                                              ),
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                "CheckOut",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Card(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
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
                                        Flexible(
                                          child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 250,
                                                  child: Text(
                                                      controller
                                                          .levelName.value,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          color: blackTextColor,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "ID: ${controller.levelCode.value}",
                                                    style: TextStyle(
                                                        color: blackTextColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  width: 250,
                                                  child: Text(
                                                    controller
                                                        .levelAddress.value,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Schedules",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        getUserActivityController.fetchData();
                                        Get.to(ScheduleVisitPage());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Add",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Icon(
                                              Icons.add_box_rounded,
                                              size: 30,
                                              color: primaryColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                                SizedBox(
                                    height: 250.0,
                                    child: Card(
                                      child: scheduleDataController
                                                      .getScheduleDataModel ==
                                                  null ||
                                              scheduleDataController
                                                      .getScheduleDataModel!
                                                      .data!
                                                      .length ==
                                                  0
                                          ? Center(
                                              child: Text(
                                                "No Data Available",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            )
                                          : ListView.builder(
                                              itemCount: scheduleDataController
                                                  .getScheduleDataModel!
                                                  .data!
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                primaryColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    "Schedule For: ${scheduleDataController.getScheduleDataModel!.data![index].schdulefor}"),
                                                                Text(
                                                                    "Date: ${scheduleDataController.getScheduleDataModel!.data![index].date}")
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    "Start Time: ${scheduleDataController.getScheduleDataModel!.data![index].starttime}"),
                                                                Text(
                                                                    "End Time: ${scheduleDataController.getScheduleDataModel!.data![index].endtime}"),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                          ]),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Customer History",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 250.0,
                                  child: Card(
                                    child: noteDataController
                                                    .getcustomerNoteDataModel ==
                                                null ||
                                            noteDataController
                                                    .getcustomerNoteDataModel!
                                                    .data!
                                                    .length ==
                                                0
                                        ? Center(
                                            child: Text(
                                            "No Data Available",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ))
                                        : ListView.builder(
                                            itemCount: noteDataController
                                                .getcustomerNoteDataModel!
                                                .data!
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: primaryColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  "${noteDataController.getcustomerNoteDataModel!.data![index].activityName}"),
                                                              Text(
                                                                  "${noteDataController.getcustomerNoteDataModel!.data![index].createdOn}")
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              "Code: ${noteDataController.getcustomerNoteDataModel!.data![index].customerCode}"),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              "Descriptiion: ${noteDataController.getcustomerNoteDataModel!.data![index].activityDescription}"),
                                                        ]),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Customer Notes",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(TakeNotePage(), arguments: [
                                          controller.levelName.value,
                                          controller.levelCode.value,
                                          controller.levelAddress.value
                                        ]
                                            // customerProfileData
                                            );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Add",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Icon(
                                              Icons.add_box_rounded,
                                              size: 30,
                                              color: primaryColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 250.0,
                                  child: Card(
                                    child: noteDataController
                                                    .getcustomerNoteDataModel ==
                                                null ||
                                            noteDataController
                                                    .getcustomerNoteDataModel!
                                                    .data!
                                                    .length ==
                                                0
                                        ? Center(
                                            child: Text(
                                            "No Data Available",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ))
                                        : ListView.builder(
                                            itemCount: noteDataController
                                                .getcustomerNoteDataModel!
                                                .data!
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: primaryColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  "${noteDataController.getcustomerNoteDataModel!.data![index].activityName}"),
                                                              Text(
                                                                  "${noteDataController.getcustomerNoteDataModel!.data![index].createdOn}")
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              "Code: ${noteDataController.getcustomerNoteDataModel!.data![index].customerCode}"),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              "Descriptiion: ${noteDataController.getcustomerNoteDataModel!.data![index].activityDescription}"),
                                                        ]),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                  ),
                                ),
                                // CheckInCardView(
                                //   title: "View Open Orders",
                                //   onPressed: () {
                                //     orderDataController.fetchOrderData(
                                //         customerCode:
                                //             controller.levelCode.value);
                                //     Get.to(ViewOpenOrderPage());
                                //   },
                                // ),
                                // CheckInCardView(
                                //   title: "Schedule A Visit",
                                //   onPressed: () {
                                //     getUserActivityController.fetchData();
                                //     Get.to(ScheduleVisitPage());
                                //   },
                                // ),
                                // CheckInCardView(
                                //   title: "Customer Profile",
                                //   onPressed: () {
                                //     Get.to(CustomerProfilePage());
                                //   },
                                // ),
                                // CheckInCardView(
                                //   title: "Take Order",
                                //   onPressed: () {
                                //     stockController.totalQty = 0;
                                //     stockController.totalAmount = 0.0;
                                //     stockController.isVisible = false;
                                //     stockController.myList.clear();
                                //     stockController.d = false;
                                //     stockController.i = false;
                                //     stockController.sectionlist.clear();

                                //     stockController.fetchData(
                                //         customerCode:
                                //             controller.levelCode.value);
                                //     setOrderDataController.customerCode.value =
                                //         controller.levelCode.value;

                                //     Get.to(TakeOrderPage());
                                //   },
                                // ),
                                // CheckInCardView(
                                //   title: "Collect Payment",
                                //   onPressed: () {
                                //     Get.to(CollectPaymentPage());
                                //   },
                                // ),
                                // CheckInCardView(
                                //   title: "Make Complain",
                                //   onPressed: () {
                                //     Get.to(ComplainPage(),
                                //         arguments: controller.levelCode.value);
                                //   },
                                // ),
                                // CheckInCardView(
                                //   title: "Take Notes",
                                //   onPressed: () {
                                //     Get.to(TakeNotePage(), arguments: [
                                //       controller.levelName.value,
                                //       controller.levelCode.value,
                                //       controller.levelAddress.value
                                //     ]
                                //         // customerProfileData
                                //         );
                                //   },
                                // ),
                              ],
                            ),
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: showMenu,
          child: Icon(Icons.home_filled),
          elevation: 10.0,
        ),
        bottomNavigationBar: SizedBox(
          height: 40,
          child: BottomAppBar(
              color: Colors.red[100],
              shape: const CircularNotchedRectangle(),
              child: Container()),
        ));
  }

  showMenu() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 36,
                ),
                SizedBox(
                    height: (56 * 6).toDouble(),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: Colors.white,
                        ),
                        child: Stack(
                          alignment: Alignment(0, 0),
                          children: <Widget>[
                            Positioned(
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      "View Open Orders",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: Icon(
                                      Icons.menu_book_outlined,
                                      color: primaryColor,
                                    ),
                                    onTap: () {
                                      orderDataController.fetchOrderData(
                                          customerCode:
                                              controller.levelCode.value);
                                      Get.to(ViewOpenOrderPage());
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Schedule A Visit",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: Icon(
                                      Icons.menu_book_outlined,
                                      color: primaryColor,
                                    ),
                                    onTap: () {
                                      getUserActivityController.fetchData();
                                      Get.to(ScheduleVisitPage());
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Take Order",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: Icon(
                                      Icons.menu_book_outlined,
                                      color: primaryColor,
                                    ),
                                    onTap: () {
                                      stockController.totalQty = 0;
                                      stockController.totalAmount = 0.0;
                                      stockController.isVisible = false;
                                      stockController.myList.clear();
                                      stockController.d = false;
                                      stockController.i = false;
                                      stockController.sectionlist.clear();

                                      stockController.fetchData(
                                          customerCode:
                                              controller.levelCode.value);
                                      setOrderDataController.customerCode
                                          .value = controller.levelCode.value;

                                      Get.to(TakeOrderPage());
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Make Complain",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: Icon(
                                      Icons.menu_book_outlined,
                                      color: primaryColor,
                                    ),
                                    onTap: () {
                                      Get.to(ComplainPage(),
                                          arguments:
                                              controller.levelCode.value);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Take Notes",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: Icon(
                                      Icons.menu_book_outlined,
                                      color: primaryColor,
                                    ),
                                    onTap: () {
                                      Get.to(TakeNotePage(), arguments: [
                                        controller.levelName.value,
                                        controller.levelCode.value,
                                        controller.levelAddress.value
                                      ]
                                          // customerProfileData
                                          );
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))),
              ],
            ),
          );
        });
  }
}
