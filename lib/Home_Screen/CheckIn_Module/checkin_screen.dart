import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/get_available_stock_data-controller.dart';
import 'package:shalimar/Controller/get_order_data_controller.dart';
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
                                          levelCode: controller.levelCode.value,
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
                                                  fontWeight: FontWeight.w500),
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
                                                    controller.levelName.value,
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
                                                  controller.levelAddress.value,
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
                              CheckInCardView(
                                title: "View Open Orders",
                                onPressed: () {
                                  orderDataController.fetchOrderData(
                                      customerCode: controller.levelCode.value);
                                  Get.to(ViewOpenOrderPage());
                                },
                              ),
                              CheckInCardView(
                                title: "Schedule A Visit",
                                onPressed: () {
                                  Get.to(ScheduleVisitPage());
                                },
                              ),
                              CheckInCardView(
                                title: "Customer Profile",
                                onPressed: () {
                                  Get.to(CustomerProfilePage());
                                },
                              ),
                              CheckInCardView(
                                title: "Take Order",
                                onPressed: () {
                                  stockController.totalQty = 0;
                                  stockController.totalAmount = 0.0;
                                  stockController.isVisible = false;
                                  stockController.myList.clear();
                                  stockController.d = false;
                                  stockController.i = false;
                                  stockController.sectionlist.clear();

                                  stockController.fetchData(
                                      customerCode: controller.levelCode.value);
                                  setOrderDataController.customerCode.value =
                                      controller.levelCode.value;

                                  Get.to(TakeOrderPage());
                                },
                              ),
                              // CheckInCardView(
                              //   title: "Collect Payment",
                              //   onPressed: () {
                              //     Get.to(CollectPaymentPage());
                              //   },
                              // ),
                              CheckInCardView(
                                title: "Make Complain",
                                onPressed: () {
                                  Get.to(ComplainPage(),
                                      arguments: controller.levelCode.value);
                                },
                              ),
                              CheckInCardView(
                                title: "Take Notes",
                                onPressed: () {
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
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
