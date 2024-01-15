import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/set_order_data_controller.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/take_order_screen.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

import '../../Controller/get_available_stock_data-controller.dart';

class MyCartPage extends StatefulWidget {
  String? tag;
  String? orderNumber;
  MyCartPage({super.key, this.tag, this.orderNumber});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  final TextEditingController _searchController = TextEditingController();
  SetOrderDataController setOrderDataController =
      Get.put(SetOrderDataController());
  GetAvailableStockDataController stockController =
      Get.put(GetAvailableStockDataController());
  var total = 0.0;
  List<Map<dynamic, dynamic>> myCartList = [];
  final _formKey = GlobalKey<FormState>();
  var totalPrice = 0.0;
  var totalQty = 0;
  @override
  void initState() {
    // TODO: implement initState
    for (var i in stockController.myList) {
      myCartList.add(i);
    }

    print(stockController.myList);
    print(stockController.myList.length);
    print(myCartList.length);
    print(myCartList);

    for (var i in myCartList) {
      total = total + i['mrp'];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myCartList.removeWhere((item) => item["Qty"] == 0);
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
              child: Padding(
                  padding: const EdgeInsets.all(18.0),
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
                          controller: setOrderDataController.remarkController,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white), //<-- SEE HERE
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
                          itemCount: myCartList.length,
                          itemBuilder: (context, index) {
                            for (var i in myCartList) {
                              total = total + i['mrp'];
                            }
                            return Card(
                              child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
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
                                            "${myCartList[index]["productcode"].toString()} - ${myCartList[index]["name"].toString()}",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                        Text(
                                            "\u{20B9}${myCartList[index]["dpl"].toStringAsFixed(2)}/NOS",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Price",
                                                    style: TextStyle(
                                                        color: blackTextColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    "\u{20B9}${myCartList[index]["dpl"].toStringAsFixed(2)}/NOS",
                                                    style: TextStyle(
                                                        color: blackTextColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Qty.",
                                                    style: TextStyle(
                                                        color: blackTextColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    "${stockController.myList[index]["Qty"].toString()}",
                                                    style: TextStyle(
                                                        color: blackTextColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Total Price",
                                                    style: TextStyle(
                                                        color: blackTextColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    "\u{20B9}${stockController.myList[index]["mrp"].toStringAsFixed(2)}/NOS",
                                                    style: TextStyle(
                                                        color: blackTextColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.end,
                                        //   children: <Widget>[
                                        //     IconButton(
                                        //         icon: Icon(Icons.remove_circle),
                                        //         onPressed: () {
                                        //           setState(() {
                                        //             // if (stockController
                                        //             //             .myList[index]
                                        //             //         ["Qty"] !=
                                        //             //     0) {
                                        //             //   var qty = stockController
                                        //             //           .myList[index]
                                        //             //       ["Qty"]--;
                                        //             //   stockController
                                        //             //               .myList[index]
                                        //             //           ["mrp"] =
                                        //             //       stockController.myList[
                                        //             //                   index]
                                        //             //               ["dpl"] *
                                        //             //           qty;
                                        //             //   stockController.update();
                                        //             //   print(stockController
                                        //             //       .myList);
                                        //             // }
                                        //           });
                                        //         },
                                        //         color: primaryColor),
                                        //     Text(
                                        //         "${stockController.myList[index]["Qty"].toString()}"),
                                        //     IconButton(
                                        //       icon: Icon(Icons.add_circle),
                                        //       color: primaryColor,
                                        //       onPressed: () {
                                        //         setState(() {
                                        //           // stockController.myList[index]
                                        //           //     ["Qty"]++;

                                        //           // stockController.totalQty =
                                        //           //     stockController.totalQty
                                        //           //             .toInt() +
                                        //           //         1;

                                        //           // stockController.update();
                                        //           // print(stockController
                                        //           //         .myList[index]
                                        //           //     ["totalPrice"]);
                                        //           // print(stockController.myList);
                                        //         });
                                        //       },
                                        //     ),
                                        //   ],
                                        // ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: OutlinedButton(
                                                onPressed: () {
                                                  Get.off(TakeOrderPage());
                                                },
                                                child: Text(
                                                  "Edit",
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
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
                                  widget.tag == "Edit"
                                      ? Get.off(TakeOrderPage())
                                      : Get.back();
                                },
                                child: Container(
                                  height: 50,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    setOrderDataController.fetchData(
                                        context,
                                        myCartList,
                                        widget.orderNumber != null
                                            ? widget.orderNumber
                                            : "");
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      "Placed order \u{20B9}${total.toStringAsFixed(2)}",
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
            ),
          ],
        ),
      ),
    );
  }
}
