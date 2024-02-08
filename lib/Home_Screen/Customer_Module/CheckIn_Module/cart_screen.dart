import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/set_activity_detail_data_controller.dart';
import 'package:shalimar/Controller/set_order_data_controller.dart';
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/Elements/timer_widget.dart';
import 'package:shalimar/Model/get_order_data_model.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

import '../../../Controller/get_available_stock_data-controller.dart';
import 'take_order_screen.dart';

class MyCartPage extends StatefulWidget {
  String? tag;
  String? orderNumber;
  String? orderRemark;
  List<OrderDetailMaster>? productList;

  MyCartPage(
      {super.key,
      this.tag,
      this.orderNumber,
      this.orderRemark,
      this.productList});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  final TextEditingController _searchController = TextEditingController();
  SetOrderDataController setOrderDataController =
      Get.put(SetOrderDataController());
  GetAvailableStockDataController stockController =
      Get.put(GetAvailableStockDataController());
  final _formKey = GlobalKey<FormState>();

  // dynamic dplPrice = 0.0;
  // dynamic totalPrice = 0.0;
  // dynamic totalQty = 0;
  SetActivityDetailDataController setActivityController =
      Get.put(SetActivityDetailDataController());

  @override
  void initState() {
    // TODO: implement initState
    setOrderDataController.myCartEditList.clear();
    if (setOrderDataController.orderEditTag == "Edit") {
      setOrderDataController.productList = widget.productList!;
      print(setOrderDataController.productList.length);
      print("!!!!!!!!!!");
    }
    // for (var i in widget.productList!) {
    // setOrderDataController.productList!.add(i);
    // dplPrice = i.dpl;
    // totalQty = i.qty!.toInt();
    // totalPrice = i.mrp;
    // }
    setOrderDataController.addOrder().whenComplete(() {
      setOrderDataController.addAndEdit();
    });
    if (setOrderDataController.orderEditTag == "Edit") {
      widget.orderRemark != null
          ? setOrderDataController.remarkController.text = widget.orderRemark!
          : "";
    }

    print(stockController.myList);
    print(stockController.myList.length);
    print(setOrderDataController.myCartList.length);
    print(setOrderDataController.myCartList);

    /* if (widget.tag == 'Edit') {
      widget.orderRemark != null
          ? setOrderDataController.remarkController.text = widget.orderRemark!
          : "";
      for (var i in widget.productList!) {
        total = total + i.mrp!;
        setOrderDataController.myCartEditList.add(
            {"Qty": i.qty!.toInt(),
              "productcode":i.productcode,
            "name":i.productdesc,
            "dpl":i.dpl,
            "mrp":i.mrp,


            });
        // dplPrice = i.dpl;
        // totalQty = i.qty!.toInt();
        // totalPrice = i.mrp;
      }
      print(setOrderDataController.myCartEditList);
    } else {
      setOrderDataController.remarkController.text = "";
      for (var i in setOrderDataController.myCartList) {
        total = total + i['mrp'];
        // dplPrice = i["dpl"];
        // totalQty = i["Qty"];
        // totalPrice = i['mrp'];
      }
    }*/

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("add");
    print(setOrderDataController.myCartList);
    print(setOrderDataController.myCartList.length);

    return Scaffold(
        body: GetBuilder<SetOrderDataController>(
      init: SetOrderDataController(),
      builder: (setOrderDataController) {
        setOrderDataController.myCartList
            .removeWhere((item) => item["Qty"] == 0);
        print("remove");
        print(setOrderDataController.myCartList);
        print(setOrderDataController.myCartList.length);
        setOrderDataController.myCartEditList
            .removeWhere((item) => item["Qty"] == 0);
        return SafeArea(
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
                            child: TimerWidget())),
                    Padding(
                        padding: const EdgeInsets.only(
                            bottom: 18.0, left: 18.0, right: 18.0, top: 60.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              searchBar(_searchController),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller:
                                    setOrderDataController.remarkController,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 0.0, 20.0, 0.0),
                                    border: OutlineInputBorder(),
                                    errorStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3)),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3)),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      //<-- SEE HERE
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    hintText: "Enter Remark",
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    labelText: "Enter Remark",
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    focusColor: Colors.white),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "The Remark is required.";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Expanded(
                                  child: ListView.builder(
                                itemCount: setOrderDataController
                                            .orderEditTag ==
                                        "Edit"
                                    ? setOrderDataController
                                        .myCartEditList!.length
                                    : setOrderDataController.myCartList.length,
                                itemBuilder: (context, index) {
                                  // for (var i in myCartList) {
                                  //   total = total + i['mrp'];
                                  // }

                                  return Card(
                                    child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  setOrderDataController
                                                              .orderEditTag ==
                                                          "Edit"
                                                      ? "${setOrderDataController.myCartEditList[index]['productcode'].toString()} - ${setOrderDataController.myCartEditList[index]["name"].toString()}"
                                                      : "${setOrderDataController.myCartList[index]["productcode"].toString()} - ${setOrderDataController.myCartList[index]["name"].toString()}",
                                                  style: TextStyle(
                                                      color: blackTextColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      // "\u{20B9}${dplPrice.toStringAsFixed(2)}/NOS",
                                                      setOrderDataController
                                                                  .orderEditTag ==
                                                              "Edit"
                                                          ? "\u{20B9}${setOrderDataController.myCartEditList[index]["dpl"].toStringAsFixed(2)}/NOS"
                                                          : "\u{20B9}${setOrderDataController.myCartList[index]["dpl"].toStringAsFixed(2)}/NOS",
                                                      style: TextStyle(
                                                          color: blackTextColor,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  Text(
                                                      // "\u{20B9}${dplPrice.toStringAsFixed(2)}/NOS",
                                                      setOrderDataController
                                                                  .orderEditTag ==
                                                              "Edit"
                                                          ? ""
                                                          : "Division: ${setOrderDataController.myCartList[index]["category"]}",
                                                      style: TextStyle(
                                                          color: primaryColor,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ],
                                              ),

                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("Price",
                                                          style: TextStyle(
                                                              color:
                                                                  blackTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                      Text(
                                                          // "\u{20B9}${dplPrice.toStringAsFixed(2)}/NOS",
                                                          setOrderDataController
                                                                      .orderEditTag ==
                                                                  "Edit"
                                                              ? "\u{20B9}${setOrderDataController.myCartEditList[index]["dpl"]!.toStringAsFixed(2)}/NOS"
                                                              : "\u{20B9}${setOrderDataController.myCartList[index]["dpl"].toStringAsFixed(2)}/NOS",
                                                          style: TextStyle(
                                                              color:
                                                                  blackTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("Qty.",
                                                          style: TextStyle(
                                                              color:
                                                                  blackTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                      Text(
                                                          // "${totalQty}",

                                                          setOrderDataController
                                                                      .orderEditTag ==
                                                                  "Edit"
                                                              ? "${setOrderDataController.myCartEditList[index]["Qty"]}"
                                                              : "${setOrderDataController.myCartList[index]["Qty"].toString()}",
                                                          style: TextStyle(
                                                              color:
                                                                  blackTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("Total Price",
                                                          style: TextStyle(
                                                              color:
                                                                  blackTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                      Text(
                                                          // "\u{20B9}${totalPrice.toStringAsFixed(2)}/NOS",

                                                          setOrderDataController
                                                                      .orderEditTag ==
                                                                  "Edit"
                                                              ? "\u{20B9}${setOrderDataController.myCartEditList[index]['mrp']!.toStringAsFixed(2)}/NOS"
                                                              : "\u{20B9}${setOrderDataController.myCartList[index]["mrp"].toStringAsFixed(2)}/NOS",
                                                          style: TextStyle(
                                                              color:
                                                                  blackTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: <Widget>[
                                                  IconButton(
                                                      icon: Icon(
                                                          Icons.remove_circle),
                                                      onPressed: () {
                                                        setState(() {
                                                          if (setOrderDataController
                                                                  .orderEditTag ==
                                                              "Edit") {
                                                            if (setOrderDataController
                                                                        .myCartEditList[
                                                                    index]["Qty"] !=
                                                                0) {
                                                              setOrderDataController
                                                                      .myCartEditList[
                                                                  index]["Qty"]--;

                                                              setOrderDataController
                                                                          .myCartEditList[
                                                                      index][
                                                                  "mrp"] = setOrderDataController
                                                                      .myCartEditList[
                                                                  index]['dpl'];

                                                              setOrderDataController
                                                                          .myCartEditList[
                                                                      index][
                                                                  "mrp"] = (setOrderDataController
                                                                              .myCartEditList[
                                                                          index]
                                                                      [
                                                                      'mrp'])! *
                                                                  setOrderDataController
                                                                          .myCartEditList[
                                                                      index]["Qty"];
                                                              setOrderDataController
                                                                          .myCartEditList[
                                                                      index][
                                                                  "productcode"] = setOrderDataController
                                                                          .myCartEditList[
                                                                      index][
                                                                  "productcode"];
                                                              setOrderDataController
                                                                          .myCartEditList[
                                                                      index][
                                                                  "name"] = setOrderDataController
                                                                      .myCartEditList[
                                                                  index]['name'];
                                                              setOrderDataController
                                                                          .myCartEditList[
                                                                      index][
                                                                  "dpl"] = setOrderDataController
                                                                      .myCartEditList[
                                                                  index]['dpl'];

                                                              setOrderDataController
                                                                  .total = setOrderDataController
                                                                      .total -
                                                                  setOrderDataController
                                                                              .myCartEditList[
                                                                          index]
                                                                      ["dpl"]!;

                                                              stockController.totalAmount =
                                                                  setOrderDataController
                                                                      .total;
                                                              print(setOrderDataController
                                                                  .myCartEditList);
                                                            }
                                                            /*  if (setOrderDataController.myCartEditList[index]
                                                                              [
                                                                              "Qty"] ==
                                                                          0) {
                                                                        setOrderDataController
                                                                            .myCartEditList[index]
                                                                            .remove('productcode');
                                                                        setOrderDataController
                                                                            .myCartEditList[index]
                                                                            .remove('name');
                                                                        setOrderDataController
                                                                            .myCartEditList[index]
                                                                            .remove('dpl');
                                                                        setOrderDataController
                                                                            .myCartEditList[index]
                                                                            .remove('Qty');
                                                                        setOrderDataController
                                                                            .myCartEditList[index]
                                                                            .remove('mrp');

                                                                        print(setOrderDataController
                                                                            .myCartEditList);
                                                                      }*/
                                                          } else {
                                                            if (setOrderDataController
                                                                        .myCartList[
                                                                    index]["Qty"] !=
                                                                0) {
                                                              setOrderDataController
                                                                      .myCartList[
                                                                  index]["Qty"]--;

                                                              stockController
                                                                      .totalQty =
                                                                  stockController
                                                                          .totalQty
                                                                          .toInt() -
                                                                      1;

                                                              setOrderDataController
                                                                          .myCartList[
                                                                      index][
                                                                  "mrp"] = setOrderDataController
                                                                              .myCartList[
                                                                          index]
                                                                      ["mrp"] -
                                                                  setOrderDataController
                                                                          .myCartList[
                                                                      index]["dpl"];

                                                              setOrderDataController
                                                                  .total = setOrderDataController
                                                                      .total -
                                                                  setOrderDataController
                                                                          .myCartList[
                                                                      index]["dpl"];

                                                              stockController
                                                                      .totalAmount =
                                                                  setOrderDataController
                                                                      .total;
                                                              for (var a = 0; a < stockController.myList.length; a++) {
                                                                if (stockController.myList[a]
                                                                        ['productcode'] ==
                                                                    setOrderDataController.myCartList[index]
                                                                        ['productcode']) {
                                                                  stockController
                                                                      .controllers[
                                                                          a]
                                                                      .text = setOrderDataController.myCartList[
                                                                          index]
                                                                          [
                                                                          "Qty"]
                                                                      .toString();
                                                                }
                                                              }
                                                              stockController
                                                                  .update();
                                                              print(
                                                                  stockController
                                                                      .myList);
                                                            }
                                                          }
                                                        });
                                                      },
                                                      color: primaryColor),
                                                  Text(setOrderDataController
                                                              .orderEditTag ==
                                                          "Edit"
                                                      ? "${setOrderDataController.myCartEditList[index]["Qty"]}"
                                                      : "${setOrderDataController.myCartList[index]["Qty"].toString()}"),
                                                  IconButton(
                                                    icon:
                                                        Icon(Icons.add_circle),
                                                    color: primaryColor,
                                                    onPressed: () {
                                                      setState(() {
                                                        if (setOrderDataController
                                                                .orderEditTag ==
                                                            "Edit") {
                                                          setOrderDataController
                                                                  .myCartEditList[
                                                              index]["Qty"]++;

                                                          setOrderDataController
                                                                      .myCartEditList[
                                                                  index]["mrp"] =
                                                              setOrderDataController
                                                                      .myCartEditList[
                                                                  index]['dpl'];

                                                          setOrderDataController
                                                                      .myCartEditList[
                                                                  index][
                                                              "mrp"] = (setOrderDataController
                                                                          .myCartEditList[
                                                                      index]
                                                                  ['mrp'])! *
                                                              setOrderDataController
                                                                      .myCartEditList[
                                                                  index]["Qty"];
                                                          setOrderDataController
                                                                          .myCartEditList[
                                                                      index][
                                                                  "productcode"] =
                                                              setOrderDataController
                                                                          .myCartEditList[
                                                                      index][
                                                                  "productcode"];
                                                          setOrderDataController
                                                                      .myCartEditList[
                                                                  index]["name"] =
                                                              setOrderDataController
                                                                      .myCartEditList[
                                                                  index]['name'];
                                                          setOrderDataController
                                                                      .myCartEditList[
                                                                  index]["dpl"] =
                                                              setOrderDataController
                                                                      .myCartEditList[
                                                                  index]['dpl'];

                                                          print(setOrderDataController
                                                              .myCartEditList);

                                                          setOrderDataController
                                                              .total = setOrderDataController
                                                                  .total +
                                                              setOrderDataController
                                                                      .myCartEditList[
                                                                  index]["dpl"]!;

                                                          stockController
                                                                  .totalAmount =
                                                              setOrderDataController
                                                                  .total;

                                                          stockController
                                                              .update();
                                                          print(
                                                              "Edit)+++++++++++++++++");
                                                          print(
                                                              setOrderDataController
                                                                  .myCartEditList
                                                                  .length);
                                                          print(setOrderDataController
                                                              .myCartEditList);
                                                        } else {
                                                          setOrderDataController
                                                                  .myCartList[
                                                              index]["Qty"]++;

                                                          setOrderDataController
                                                                      .myCartList[
                                                                  index][
                                                              "mrp"] = setOrderDataController
                                                                          .myCartList[
                                                                      index]
                                                                  ["mrp"] +
                                                              setOrderDataController
                                                                      .myCartList[
                                                                  index]["dpl"];

                                                          setOrderDataController
                                                              .total = setOrderDataController
                                                                  .total +
                                                              setOrderDataController
                                                                      .myCartList[
                                                                  index]["dpl"];

                                                          stockController
                                                                  .totalQty =
                                                              stockController
                                                                      .totalQty
                                                                      .toInt() +
                                                                  1;

                                                          stockController
                                                                  .totalAmount =
                                                              setOrderDataController
                                                                  .total;
                                                          for (var a = 0;
                                                              a <
                                                                  stockController
                                                                      .myList
                                                                      .length;
                                                              a++) {
                                                            if (stockController
                                                                        .myList[a]
                                                                    [
                                                                    'productcode'] ==
                                                                setOrderDataController
                                                                            .myCartList[
                                                                        index][
                                                                    'productcode']) {
                                                              stockController
                                                                      .controllers[
                                                                          a]
                                                                      .text =
                                                                  setOrderDataController
                                                                      .myCartList[
                                                                          index]
                                                                          [
                                                                          "Qty"]
                                                                      .toString();
                                                            }
                                                          }
                                                          stockController
                                                              .update();
                                                        }

                                                        // stockController.myList[index]
                                                        //         ["mrp"] =
                                                        //     myCartList[index]["dpl"];

                                                        // stockController
                                                        //         .myList[index]
                                                        //     ["mrp"];

                                                        // stockController.myList[index]
                                                        //     ["mrp"] = stockController
                                                        //             .myList[index]
                                                        //         ["mrp"] +
                                                        //     stockController
                                                        //         .myList[index]["mrp"];
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              // Row(
                                              //   children: [
                                              //     Expanded(
                                              //       child: OutlinedButton(
                                              //         onPressed: () {
                                              //           Get.off(TakeOrderPage());
                                              //         },
                                              //         child: Text(
                                              //           "Edit",
                                              //           maxLines: 2,
                                              //           style: TextStyle(
                                              //               color: Colors.black,
                                              //               fontSize: 16,
                                              //               fontWeight:
                                              //                   FontWeight.bold),
                                              //           textAlign: TextAlign.start,
                                              //         ),
                                              //       ),
                                              //     ),
                                              //   ],
                                              // )
                                            ],
                                          ),
                                        )),
                                  );
                                },
                              )),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        if (setOrderDataController
                                                .orderEditTag ==
                                            "Edit") {
                                          setOrderDataController.myCartList
                                              .clear();
                                          stockController.myList.clear();
                                          Get.to(TakeOrderPage(
                                            tag: 'Edit',
                                          ));
                                        } else {
                                          Get.back();
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: primaryColor),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Add More Items",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Icon(
                                              Icons.add,
                                              size: 30,
                                              color: primaryColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        // setOrderDataController.orderNumber.value =
                                        //     widget.orderNumber != null
                                        //         ? widget.orderNumber!
                                        //         : "";
                                        if (_formKey.currentState!.validate()) {
                                          // if (totalQty == 0) {
                                          //   showSnackBar(
                                          //     "Retry",
                                          //     "Qty is 0, you Can Not Update This Item.",
                                          //     Colors.redAccent);

                                          // } else {

                                          if (setOrderDataController
                                                  .orderEditTag ==
                                              "Edit") {
                                            print(setOrderDataController
                                                .myCartEditList.length);

                                            setOrderDataController.fetchData(
                                                context,
                                                setOrderDataController
                                                    .myCartEditList,
                                                widget.orderNumber != null
                                                    ? widget.orderNumber
                                                    : "");
                                          } else {
                                            setOrderDataController.fetchData(
                                                context,
                                                setOrderDataController
                                                    .myCartList,
                                                widget.orderNumber != null
                                                    ? widget.orderNumber
                                                    : "");
                                          }
                                          // }
                                        } else {
                                          showSnackBar(
                                              "Retry",
                                              "Please Enter Remark!!",
                                              Colors.redAccent);
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: primaryColor),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            "Placed order \u{20B9}${setOrderDataController.total.toStringAsFixed(2)}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
