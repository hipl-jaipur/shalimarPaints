import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shalimar/Controller/customer_hire_data_controller.dart';
import 'package:shalimar/Controller/get_global_parameter_data_controller.dart';
import 'package:shalimar/Controller/set_activity_detail_data_controller.dart';
import 'package:shalimar/Controller/teams_controller.dart';
import 'package:shalimar/Elements/common_customer_profile_list.dart';
import 'package:shalimar/Elements/timer_widget.dart';
import 'package:shalimar/Home_Screen/Customer_Module/CheckIn_Module/add_customer_screen.dart';
import 'package:shalimar/Model/customer_data_model.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCustomerDetailsPage extends StatefulWidget {
  const MyCustomerDetailsPage({super.key});

  @override
  State<MyCustomerDetailsPage> createState() => _MyCustomerDetailsPageState();
}

class _MyCustomerDetailsPageState extends State<MyCustomerDetailsPage> {
  TeamsController teamsController = Get.put(TeamsController());

  GetGlobalParameterDataController getGlobalParameterDataController =
      Get.put(GetGlobalParameterDataController());
  final TextEditingController _searchController = TextEditingController();
  var customerName = Get.arguments[0];
  var levelID = Get.arguments[1];
  // var details = Get.arguments;
  var terriotoryData = Get.put(CustomerHireDataController());
  CustomerHireDataController customerHireDataController =
      Get.put(CustomerHireDataController());
  SetActivityDetailDataController setActivityController =
      Get.put(SetActivityDetailDataController());

  List<Data> customerList = [];
  List<Data> customerTypeList = [];
  bool isSwitch = false;
  // bool isTimerVisible = true;
  var customerType = "B";
  var dealerCreation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getGlobalParameterDataController.fetchData().then((value) {
      if (value != null) {
        dealerCreation = value!.data![1].parameterValue;
      }
    });

    customerList = customerHireDataController!.customerList!
        .where((element) => element.parentLevelID == levelID)
        .toList();

    customerTypeList = customerList!
        .where((element) => element.customerType.contains(customerType))
        .toList();

    print('customerList: $customerList');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetActivityDetailDataController>(
      init: SetActivityDetailDataController(),
      builder: (setActivityController) {
        return Scaffold(
          body: SafeArea(
            child: GetX<CustomerHireDataController>(
              init: CustomerHireDataController(),
              builder: (controller) {
                return ModalProgressHUD(
                  inAsyncCall: controller.isLoading.value,
                  child: Stack(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            Images.bg_3,
                            fit: BoxFit.fill,
                          )),
                      Positioned(
                        child: Stack(
                          children: [
                            Positioned(
                              child: Visibility(
                                  visible: setActivityController.checkIn,
                                  child: TimerWidget(
                                    tag: "",
                                  )),
                            ),
                            Obx(
                              () => customerHireDataController.isLoading.value
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 18.0,
                                          left: 18.0,
                                          right: 18.0,
                                          top: setActivityController.checkIn
                                              ? 60.0
                                              : 18.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextField(
                                            controller: _searchController,
                                            textInputAction:
                                                TextInputAction.search,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30)),
                                                  borderSide: BorderSide(
                                                    color: Color(0xffECE6E6),
                                                  )),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30)),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xffECE6E6),
                                                      )),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30)),
                                                  borderSide: BorderSide(
                                                    color: Color(0xffECE6E6),
                                                  )),
                                              hintText: 'Search',
                                              prefixIcon: IconButton(
                                                  onPressed: () {
                                                    Get.back();
                                                    setActivityController
                                                        .update();
                                                  },
                                                  icon: Icon(
                                                    Icons.arrow_circle_left,
                                                    color: primaryColor,
                                                    size: 40,
                                                  )),
                                              suffixIcon: IconButton(
                                                  onPressed: () {
                                                    // // customerHireDataController
                                                    // //     .getCustomerHireData(
                                                    // //         "Update");
                                                    // customerHireDataController
                                                    //     .update();
                                                  },
                                                  icon: Icon(
                                                    Icons.sort,
                                                    color: primaryColor,
                                                    size: 40,
                                                  )),
                                            ),
                                            onChanged: (value) {
                                              setState(() {});
                                            },
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Customer - ${customerName}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                      "Count: ${customerTypeList.length}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ],
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (!isSwitch) {
                                                      customerType = "S";
                                                      customerTypeList = customerList!
                                                          .where((element) =>
                                                              element
                                                                  .customerType
                                                                  .contains(
                                                                      customerType))
                                                          .toList();

                                                      print(
                                                          'ShipToList: $customerList');
                                                      isSwitch = !isSwitch;
                                                    } else {
                                                      customerType = "B";
                                                      // customerList =
                                                      customerTypeList = customerList!
                                                          .where((element) =>
                                                              element
                                                                  .customerType
                                                                  .contains(
                                                                      customerType))
                                                          .toList();

                                                      print(
                                                          'BillToList: $customerList');
                                                      isSwitch = !isSwitch;
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.35,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: Colors.white),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 60,
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              color: isSwitch
                                                                  ? Colors.white
                                                                  : primaryColor),
                                                          child: Center(
                                                              child: Text(
                                                            'BILLTO',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: isSwitch
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white),
                                                          )),
                                                        ),
                                                        Container(
                                                          width: 60,
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              color: isSwitch
                                                                  ? primaryColor
                                                                  : Colors
                                                                      .white),
                                                          child: Center(
                                                              child: Text(
                                                            'SHIPTO',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: isSwitch
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // InkWell(
                                              //   onTap: (){
                                              //     Get.to(AddCustomerPage());
                                              //   },
                                              //   child: Container(
                                              //     padding: EdgeInsets.all(8),
                                              //     decoration: BoxDecoration(
                                              //         color: Colors.white,
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 5)),
                                              //     child: Row(
                                              //       children: [
                                              //         Text(
                                              //           "Add Customer",
                                              //           style: TextStyle(
                                              //               fontWeight:
                                              //                   FontWeight
                                              //                       .w500),
                                              //         ),
                                              //         SizedBox(
                                              //           width: 5.0,
                                              //         ),
                                              //         Icon(
                                              //           Icons.add_box_rounded,
                                              //           size: 30,
                                              //           color: primaryColor,
                                              //         )
                                              //       ],
                                              //     ),
                                              //   ),
                                              // )
                                            ],
                                          ),
                                          // SizedBox(
                                          //   height: 10,
                                          // ),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.end,
                                          //   children: [

                                          //   ],
                                          // ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          customerTypeList.length == 0
                                              ? Card(
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Text(
                                                              "No Record Found",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)))),
                                                )
                                              : Expanded(
                                                  child: ListView.builder(
                                                    itemCount:
                                                        customerType == "B "
                                                            ? customerTypeList
                                                                .length
                                                            : customerTypeList
                                                                .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return customerTypeList[
                                                                  index]
                                                              .levelName!
                                                              .toLowerCase()
                                                              .contains(
                                                                  _searchController
                                                                      .text
                                                                      .toLowerCase())
                                                          ? CustomerProfileList(
                                                              context: context,
                                                              index: index,
                                                              customerList:
                                                                  customerTypeList,
                                                              territoryId:
                                                                  levelID,
                                                              territoryName:
                                                                  customerName,
                                                            )
                                                          : SizedBox();
                                                    },
                                                  ),
                                                )
                                        ],
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: primaryColor,
            label: Text(
              "Add Customer",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            ),
            onPressed: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();

              var empID = preferences.getInt("EmployeeId");
              teamsController.getEmployData(empID);
              var dealerCre = preferences.getInt("DealerCreation");

              if (dealerCreation != null) {
                if (dealerCre != null) {
                  if (dealerCre! < int.parse(dealerCreation)) {
                    Get.to(AddCustomerPage(
                      territoryId: levelID,
                      territoryName: customerName,
                      tag: "Add Customer",
                    ));
                    teamsController.update();
                  } else {
                    Get.dialog(
                        barrierDismissible: true,
                        Dialog(
                          backgroundColor: Colors.white,
                          child: WillPopScope(
                            onWillPop: () async => true,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "You have already Created Customers.",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 40,
                                        width: 60,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: Text(
                                          "Ok",
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                  }
                }
              }
            },
            icon: Icon(
              Icons.add_box_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
