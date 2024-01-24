import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shalimar/Controller/customer_hire_data_controller.dart';
import 'package:shalimar/Controller/set_activity_detail_data_controller.dart';
import 'package:shalimar/Elements/common_customer_profile_list.dart';
import 'package:shalimar/Elements/timer_widget.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/add_customer_screen.dart';
import 'package:shalimar/Model/customer_data_model.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class MyCustomerDetailsPage extends StatefulWidget {
  const MyCustomerDetailsPage({super.key});

  @override
  State<MyCustomerDetailsPage> createState() => _MyCustomerDetailsPageState();
}

class _MyCustomerDetailsPageState extends State<MyCustomerDetailsPage> {
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
  var customerType = "B ";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
        return WillPopScope(
          onWillPop: () async {
            if (setActivityController.checkIn) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Alert!!'),
                      content: Text(
                          "Please CheckOut at ${setActivityController.checkinCustomer}"),
                      actions: <Widget>[
                        ElevatedButton(
                          child: Text('Ok'),
                          onPressed: () {
                            // Navigator.pop(context);
                            Get.back();

                            // Get.off(
                            //   CheckInPage(),
                            // );
                          },
                        ),
                      ],
                    );
                  });

              return false;
            } else {
              return true;
            }
          },
          child: Scaffold(
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
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    30)),
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xffECE6E6),
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
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    30)),
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xffECE6E6),
                                                        )),
                                                hintText: 'Search',
                                                prefixIcon: IconButton(
                                                    onPressed: () {
                                                      Get.back();
                                                      setActivityController.update();

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
                                              onChanged: (value) {
                                                setState(() {});
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                                FontWeight
                                                                    .bold)),
                                                    Text(
                                                        "Count: ${customerTypeList.length}",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: (){
                                                    Get.to(AddCustomerPage());
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5)),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Add Customer",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
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
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
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
                                                                    ? Colors
                                                                        .white
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
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            customerTypeList.length == 0
                                                ? Card(
                                                    child: Container(
                                                        width:
                                                            MediaQuery.of(
                                                                    context)
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
                                                                    fontSize:
                                                                        20,
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
                                                                context:
                                                                    context,
                                                                index: index,
                                                                customerList:
                                                                    customerTypeList)
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
          ),
        );
      },
    );
  }
}
