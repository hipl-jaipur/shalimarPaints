import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/get_available_stock_data-controller.dart';
import 'package:shalimar/Controller/set_activity_detail_data_controller.dart';
import 'package:shalimar/Controller/set_order_data_controller.dart';
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Elements/common_order-widget.dart';
import 'package:shalimar/Elements/filter_sheet_widget.dart';
import 'package:shalimar/Elements/timer_widget.dart';
import 'package:shalimar/Home_Screen/Customer_Module/CheckIn_Module/cart_screen.dart';
import 'package:shalimar/Model/available_stock_data_model.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

class TakeOrderPage extends StatefulWidget {
  final String tag;

  const TakeOrderPage({super.key, required this.tag});

  @override
  State<TakeOrderPage> createState() => _TakeOrderPageState();
}

class _TakeOrderPageState extends State<TakeOrderPage> {
  final TextEditingController _searchController = TextEditingController();
  GetAvailableStockDataController stockController =
      Get.put(GetAvailableStockDataController());
  SetActivityDetailDataController setActivityController =
      Get.put(SetActivityDetailDataController());
  SetOrderDataController setOrderDataController =
      Get.put(SetOrderDataController());
  List<Data> productList = [];
  final ScrollController listScrollController = ScrollController();

  @override
  void initState() {
    // listScrollController.addListener(_scrollListener);
    SetActivityDetailDataController controller =
        Get.put(SetActivityDetailDataController());
    // TODO: implement initState
    stockController.fetchData(customerCode: controller.levelCode.value);
    super.initState();
  }

  _scrollListener() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetAvailableStockDataController>(
        init: GetAvailableStockDataController(),
        builder: (stockDataController) {
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
                    child: stockController.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Stack(
                            children: [
                              Positioned(
                                  child: Visibility(
                                      visible: setActivityController.checkIn,
                                      child: TimerWidget())),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 18.0,
                                      left: 18.0,
                                      right: 18.0,
                                      top: 60.0),
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: _searchController,
                                        textInputAction: TextInputAction.search,
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
                                              onPressed: () {
                                                showTopModalSheet<String?>(
                                                    context, DumyModal());
                                              },
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
                                      stockController
                                                  .filterAvailableStockDataModel !=
                                              null
                                          ? stockController
                                                  .filterAvailableStockDataModel
                                                  .isNotEmpty
                                              ? Expanded(
                                                  child: ListView.builder(
                                                  itemCount: stockController
                                                      .filterAvailableStockDataModel!
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return stockController
                                                            .filterAvailableStockDataModel![
                                                                index]
                                                            .productdesc!
                                                            .toLowerCase()
                                                            .contains(
                                                                _searchController
                                                                    .text
                                                                    .toLowerCase())
                                                        ? TakeOrderList(
                                                            index: index,
                                                            context: context,
                                                            productList:
                                                                stockController
                                                                    .filterAvailableStockDataModel!)
                                                        : SizedBox();
                                                  },
                                                ))
                                              : Card(
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
                                                              "No Product Available",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)))),
                                                )
                                          : SizedBox(),
                                      Visibility(
                                        visible: stockController.isVisible,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, left: 5, right: 5),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "Total Qty: ${stockController.totalQty} "),
                                                  Text(
                                                      "Total Amount: ${stockController.totalAmount.toStringAsFixed(2)}"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              GetBuilder<
                                                  GetAvailableStockDataController>(
                                                builder: (controller) {
                                                  return OutlinedButton(
                                                      onPressed: () {
                                                        // SharedPreferences prefs =
                                                        //     await SharedPreferences
                                                        //         .getInstance();
                                                        // var division = prefs.getString("Division");
                                                        print(
                                                            "NewList0: ${controller.myList.length}");
                                                        print(
                                                            "List1: ${controller.myList}");

                                                        controller.update();

                                                        if (controller
                                                                .totalQty ==
                                                            0) {
                                                          showSnackBar(
                                                              "Sorry!!",
                                                              "Please Add Any Product.",
                                                              Colors.redAccent);
                                                        } else {
                                                          for (int i = 0;
                                                              i <
                                                                  controller
                                                                      .myList
                                                                      .length;
                                                              i++) {
                                                            if (controller
                                                                        .myList[i]
                                                                    [
                                                                    'category'] !=
                                                                null) {
                                                              if (controller
                                                                          .myList[
                                                                              i]
                                                                              [
                                                                              'category']
                                                                          .trim() !=
                                                                      "D"
                                                                  // stockController
                                                                  //     .productCategory
                                                                  ) {
                                                                controller
                                                                        .catCheck =
                                                                    true;
                                                                break;
                                                              } else {
                                                                controller
                                                                        .catCheck =
                                                                    false;
                                                              }
                                                            }
                                                          }

                                                          if (controller
                                                              .catCheck) {
                                                            showSnackBar(
                                                                "Sorry!! You are Selected Decorative and Industrial Division Product.",
                                                                "Please Add Same Division Product.",
                                                                Colors.redAccent);
                                                            controller
                                                                .catCheck =
                                                                false;
                                                          } else {
                                                            setOrderDataController
                                                                .myCartList
                                                                .clear();

                                                            if (setOrderDataController
                                                                    .orderEditTag ==
                                                                "Edit") {
                                                              setOrderDataController
                                                                  .addOrder()
                                                                  .whenComplete(
                                                                      () {
                                                                /*   setOrderDataController
                                                                    .addAndEdit();*/
                                                                setOrderDataController
                                                                    .update();

                                                                Get.back();
                                                              });
                                                            } else {
                                                              print("add Order");
                                                              setOrderDataController
                                                                  .total = 0.0;
                                                              Get.to(MyCartPage(
                                                                tag: "",
                                                              ));
                                                              controller
                                                                      .catCheck =
                                                                  false;
                                                            }
                                                          }
                                                        }
                                                      },
                                                      child: const SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: Center(
                                                              child: Text(
                                                                  "CONTINUE"))));
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
