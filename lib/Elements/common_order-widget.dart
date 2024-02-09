import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shalimar/Controller/get_available_stock_data-controller.dart';
import 'package:shalimar/Model/available_stock_data_model.dart';
import 'package:shalimar/utils/colors.dart';

import '../Controller/set_order_data_controller.dart';

class TakeOrderList extends StatefulWidget {
  int index;
  BuildContext context;
  List<Data> productList;

  // AvailableStockDataModel availableStockDataModel;

  TakeOrderList({
    super.key,
    required this.index,
    required this.context,
    required this.productList,
    // required this.availableStockDataModel,
  });

  @override
  State<TakeOrderList> createState() => _TakeOrderListState();
}

class _TakeOrderListState extends State<TakeOrderList> {
  GetAvailableStockDataController stockDataController =
      Get.put(GetAvailableStockDataController());

  SetOrderDataController setOrderDataController =
      Get.put(SetOrderDataController());
  var date = "";

  // var countr = 0;
  final _formKey = GlobalKey<FormState>();
  final qtyFocus = FocusNode();
  Key keyValue = UniqueKey();

  // List<TextEditingController> _controllers = [];

  // static GlobalKey<FormState> _screenFormKey = GlobalKey<FormState>();
  List<dynamic> matchingValues = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
print("Edit List-----${setOrderDataController.myCartEditList}");
print("controller List-----${ stockDataController.controllers}");
print("controller List-----${ stockDataController.controllers.length}");
   /* for (int i = 0; i < stockDataController.myList.length; i++) {
      for (int a = 0; a < setOrderDataController.myCartEditList.length; a++) {
        if (stockDataController.myList[i]["productcode"] ==
            setOrderDataController.myCartEditList[a]["productcode"]) {
          stockDataController.controllers.add(TextEditingController(
              text: setOrderDataController.myCartEditList[a]["Qty"].toString()));
        } else {
          stockDataController.controllers.add(TextEditingController(
              text: stockDataController.myList[i]["Qty"].toString()));
        }
      }
    }*/

     for (int i = 0; i < stockDataController.myList.length; i++) {
      stockDataController.controllers.add(TextEditingController(
          text: stockDataController.myList[i]["Qty"].toString()));

    }
    // Iterate over elements of array1

    if(setOrderDataController.orderEditTag == "Edit") {
      for (int i = 0; i < stockDataController.myList.length; i++) {
        // Iterate over elements of array2
        for (int j = 0; j < setOrderDataController.myCartEditList.length; j++) {
          // Compare elements for equality
          if (stockDataController.myList[i]['productcode'] ==
              setOrderDataController.myCartEditList[j]['productcode']) {
            // If match found, store the value
            // stockDataController.controllers.add(TextEditingController(
            //     text: setOrderDataController.myCartEditList[j]['Qty'].toString()));
            stockDataController.controllers[i].text =
                setOrderDataController.myCartEditList[j]['Qty'].toString();
          } else {
            stockDataController.controllers[i].text = "0";
          }
        }
      }
    }



    for (var i in widget.productList) {
      if (i.lastUpdatedOn == null) {
        date = "";
      } else {
        var dateList = i.lastUpdatedOn!.split('T');
        date = DateFormat('dd/MM/yyyy').format(DateTime.parse(dateList[0]));
      }
    }

    print(stockDataController.myList.length);
    // stockDataController.myList[widget.index]["controller"].text = "0";
    // stockDataController.controllers[widget.index].text = "0";
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetAvailableStockDataController>(
        init: GetAvailableStockDataController(),
        builder: (stockDataController) {
          return stockDataController.isLoading
              ? CircularProgressIndicator()
              : Card(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "${widget.productList![widget.index].productcode.toString()} - ${widget.productList![widget.index].productdesc.toString()}",
                                style: TextStyle(
                                    color: blackTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "\u{20B9}${widget.productList![widget.index].dpl.toString()}/NOS",
                                    style: TextStyle(
                                        color: blackTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                    "Division: ${widget.productList![widget.index].division!}",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon: Icon(Icons.remove_circle),
                                    onPressed: () {
                                      stockDataController.myList[widget.index]
                                              ["Qty"] =
                                          int.parse(stockDataController
                                              .controllers[widget.index].text);
                                      // int.parse(stockDataController
                                      //     .myList[widget.index]
                                      //         ["controller"]
                                      //     .text);

                                      setState(() {
                                        stockDataController.catCheck = false;
                                        if (stockDataController
                                                .myList[widget.index]["Qty"] !=
                                            0) {
                                          stockDataController
                                              .myList[widget.index]["Qty"]--;

                                          // stockDataController
                                          //     .myList[widget.index]
                                          //         ["controller"]
                                          //     .text =
                                          stockDataController
                                              .controllers[widget.index]
                                              .text = (stockDataController
                                                  .myList[widget.index]["Qty"])
                                              .toString();

                                          stockDataController.totalQty =
                                              stockDataController.totalQty
                                                      .toInt() -
                                                  1;

                                          //price
                                          stockDataController
                                                  .myList[widget.index]["mrp"] =
                                              widget.productList[widget.index]
                                                  .dpl;

                                          stockDataController.totalAmount =
                                              stockDataController.totalAmount -
                                                  stockDataController
                                                          .myList[widget.index]
                                                      ["mrp"];

                                          stockDataController.isVisible = true;
                                          stockDataController.myList.add({
                                            "productcode": widget
                                                .productList[widget.index]
                                                .productcode,
                                            "name": widget
                                                .productList[widget.index]
                                                .productdesc,
                                            "dpl": widget
                                                .productList[widget.index].dpl,
                                            "mrp": stockDataController.amount,
                                            "Qty": stockDataController.counter,
                                            "category": widget
                                                .productList[widget.index]
                                                .division!
                                                .trim()
                                          });
                                          stockDataController
                                                  .myList[widget.index]
                                              ["mrp"] = (widget
                                                  .productList[widget.index]
                                                  .dpl)! *
                                              stockDataController
                                                  .myList[widget.index]["Qty"];

                                          stockDataController
                                                      .myList[widget.index]
                                                  ["productcode"] =
                                              widget.productList[widget.index]
                                                  .productcode;
                                          stockDataController
                                                      .myList[widget.index]
                                                  ["name"] =
                                              widget.productList[widget.index]
                                                  .productdesc;
                                          stockDataController
                                                  .myList[widget.index]["dpl"] =
                                              widget.productList[widget.index]
                                                  .dpl;
                                          stockDataController
                                                      .myList[widget.index]
                                                  ["category"] =
                                              widget.productList[widget.index]
                                                  .division!
                                                  .trim();

                                          stockDataController.update();
                                          print(stockDataController.myList);
                                        }
                                        if (stockDataController
                                                .myList[widget.index]["Qty"] ==
                                            0) {
                                          // stockDataController.myList
                                          //     .removeAt(widget.index);
                                          // Remove  key only for the map at the specified index
                                          stockDataController
                                              .myList[widget.index]
                                              .remove('category');

                                          stockDataController
                                              .myList[widget.index]
                                              .remove('productcode');
                                          stockDataController
                                              .myList[widget.index]
                                              .remove('name');
                                          stockDataController
                                              .myList[widget.index]
                                              .remove('dpl');
                                          stockDataController.update();
                                          // print('\nList after removing "age" key at index $indexToRemove:');
                                          print(stockDataController.myList);
                                        }
                                        // setState(() {
                                        //   stockDataController.myList;
                                        // });
                                      });
                                    },
                                    color: primaryColor),

                                // Text(stockDataController.myList[widget.index]
                                //         ["Qty"]
                                //     .toString()),
                                Container(
                                  width: 20,
                                  child: TextFormField(
                                      // key: keyValue,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      // inputFormatters: [
                                      //   FilteringTextInputFormatter.digitsOnly,
                                      //   FilteringTextInputFormatter.allow(
                                      //       RegExp(r'[0-9]'))
                                      // ],
                                      decoration: const InputDecoration(
                                        hintText: "0",
                                        hintStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      onChanged: (value) {
                                        stockDataController.myList[widget.index]
                                            ["Qty"] = stockDataController
                                                    .controllers[widget.index]
                                                    .text ==
                                                ""
                                            ? 0
                                            : int.parse(stockDataController
                                                    .controllers[widget.index]
                                                    .text
                                                // stockDataController
                                                //   .myList[widget.index]
                                                //       ["controller"]
                                                //   .text
                                                );

                                        setState(() {
                                          stockDataController.catCheck = false;
                                          stockDataController.isVisible = true;

                                          // stockDataController
                                          //     .myList[widget.index]
                                          //         ["controller"]
                                          //     .text =
                                          stockDataController
                                              .controllers[widget.index]
                                              .text = (stockDataController
                                                  .myList[widget.index]["Qty"])
                                              .toString();

                                          stockDataController
                                                  .myList[widget.index]
                                              ["mrp"] = widget
                                                  .productList[widget.index]
                                                  .dpl *
                                              stockDataController
                                                  .myList[widget.index]["Qty"];

                                          stockDataController.myList.add({
                                            "productcode": widget
                                                .productList[widget.index]
                                                .productcode,
                                            "name": widget
                                                .productList[widget.index]
                                                .productdesc,
                                            "dpl": widget
                                                .productList[widget.index].dpl,
                                            "mrp": stockDataController.amount,
                                            "Qty": stockDataController.counter,
                                            "category": widget
                                                .productList[widget.index]
                                                .division!
                                                .trim()
                                          });

                                          int totalQty = 0;
                                          double totalAmnt = 0.0;
                                          stockDataController.myList
                                              .forEach((item) {
                                            //getting the key direectly from the name of the key
                                            totalQty += int.parse(
                                                item["Qty"].toString());
                                            totalAmnt += item["mrp"];
                                          });

                                          // print("totalQty: ${totalQty}");
                                          stockDataController.totalQty =
                                              totalQty;
                                          stockDataController.totalAmount =
                                              totalAmnt;

                                          stockDataController
                                                      .myList[widget.index]
                                                  ["category"] =
                                              widget.productList[widget.index]
                                                  .division!
                                                  .trim();

                                          stockDataController
                                                  .myList[widget.index]
                                              ["mrp"] = ((widget
                                                  .productList[widget.index]
                                                  .dpl)! *
                                              stockDataController
                                                  .myList[widget.index]["Qty"]);

                                          stockDataController
                                                      .myList[widget.index]
                                                  ["productcode"] =
                                              widget.productList[widget.index]
                                                  .productcode;

                                          stockDataController
                                                      .myList[widget.index]
                                                  ["name"] =
                                              widget.productList[widget.index]
                                                  .productdesc;

                                          stockDataController
                                                  .myList[widget.index]["dpl"] =
                                              widget.productList[widget.index]
                                                  .dpl;

                                          stockDataController.update();
                                          print(stockDataController
                                                  .myList[widget.index]
                                              ["totalPrice"]);
                                          print(stockDataController.myList);
                                        });
                                      },
                                      keyboardType: TextInputType.number,
                                      controller: stockDataController
                                          .controllers[widget.index]

                                      // stockDataController
                                      //     .myList[widget.index]["controller"]

                                      ),
                                ),

                                IconButton(
                                  icon: Icon(Icons.add_circle),
                                  color: primaryColor,
                                  onPressed: () {
                                    stockDataController.myList[widget.index]
                                        ["Qty"] = int.parse(stockDataController
                                            .controllers[widget.index].text
                                        // stockDataController
                                        //   .myList[widget.index]["controller"]
                                        //   .text

                                        );

                                    setState(() {
                                      stockDataController.catCheck = false;
                                      stockDataController.isVisible = true;

                                      //qty

                                      stockDataController.myList[widget.index]
                                          ["Qty"]++;

                                      stockDataController
                                          .controllers[widget.index]
                                          .text = (stockDataController
                                              .myList[widget.index]["Qty"])
                                          .toString();

                                      stockDataController.totalQty =
                                          stockDataController.totalQty.toInt() +
                                              1;

                                      //price

                                      stockDataController.myList[widget.index]
                                              ["mrp"] =
                                          widget.productList[widget.index].dpl;

                                      stockDataController.totalAmount =
                                          stockDataController.totalAmount +
                                              stockDataController
                                                  .myList[widget.index]["mrp"];

                                      stockDataController.myList.add({
                                        "productcode": widget
                                            .productList[widget.index]
                                            .productcode,
                                        "name": widget.productList[widget.index]
                                            .productdesc,
                                        "dpl": widget
                                            .productList[widget.index].dpl,
                                        "mrp": stockDataController.amount,
                                        "Qty": stockDataController.counter,
                                        "category": widget
                                            .productList[widget.index].division!
                                            .trim()
                                      });

                                      stockDataController.myList[widget.index]
                                              ["category"] =
                                          widget.productList[widget.index]
                                              .division!
                                              .trim();

                                      stockDataController.myList[widget.index]
                                          ["mrp"] = ((widget
                                              .productList[widget.index].dpl)! *
                                          stockDataController
                                              .myList[widget.index]["Qty"]);

                                      stockDataController.myList[widget.index]
                                              ["productcode"] =
                                          widget.productList[widget.index]
                                              .productcode;

                                      stockDataController.myList[widget.index]
                                              ["name"] =
                                          widget.productList[widget.index]
                                              .productdesc;

                                      stockDataController.myList[widget.index]
                                              ["dpl"] =
                                          widget.productList[widget.index].dpl;

                                      stockDataController.update();
                                      print(stockDataController
                                          .myList[widget.index]["totalPrice"]);
                                      print(stockDataController.myList);
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          insetPadding: EdgeInsets.zero,
                                          contentPadding: EdgeInsets.zero,
                                          content: Container(
                                            width: 300,
                                            height: 200,
                                            color: primaryLight,
                                            padding: const EdgeInsets.only(
                                                top: 12,
                                                left: 12,
                                                right: 12,
                                                bottom: 12),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Icon(Icons
                                                              .highlight_remove_sharp))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("Stock Updated On",
                                                          style: TextStyle(
                                                              color:
                                                                  blackTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                      Text("${date}",
                                                          style: TextStyle(
                                                              color:
                                                                  blackTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("Availabe Stock",
                                                          style: TextStyle(
                                                              color:
                                                                  blackTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                      Text(
                                                          "${widget.productList[widget.index].availbleQty.toString()}",
                                                          style: TextStyle(
                                                              color:
                                                                  blackTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("Last Order",
                                                          style: TextStyle(
                                                              color:
                                                                  blackTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                      Text(
                                                          "${widget.productList[widget.index].openorderQty.toString()}",
                                                          style: TextStyle(
                                                              color:
                                                                  blackTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("Open Order",
                                                          style: TextStyle(
                                                              color:
                                                                  blackTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                      Text("x",
                                                          style: TextStyle(
                                                              color:
                                                                  blackTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                    ],
                                                  )
                                                ]),
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.info,
                                      color: primaryColor,
                                    )),
                                Text(
                                    "Available Stock: ${widget.productList[widget.index].availbleQty.toString()}"),
                                Text(
                                    "Last Order: ${widget.productList[widget.index].openorderQty.toString()}")
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        });
  }
}
