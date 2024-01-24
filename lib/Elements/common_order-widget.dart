import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shalimar/Controller/get_available_stock_data-controller.dart';
import 'package:shalimar/Model/available_stock_data_model.dart';
import 'package:shalimar/utils/colors.dart';

class TakeOrderList extends StatefulWidget {
  int index;
  BuildContext context;
  List<Data> productList;
  // List<Data> addProductList;
  List<Map<dynamic, dynamic>> addProductList;

  // AvailableStockDataModel availableStockDataModel;

  TakeOrderList({
    super.key,
    required this.index,
    required this.context,
    required this.productList,
    required this.addProductList,
    // required this.availableStockDataModel,
  });

  @override
  State<TakeOrderList> createState() => _TakeOrderListState();
}

class _TakeOrderListState extends State<TakeOrderList> {
  GetAvailableStockDataController stockDataController =
      Get.put(GetAvailableStockDataController());
  var date = "";
  // List<Map<dynamic, dynamic>> myList = [];
  var qtyCount = 0;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    for (var i in widget.productList) {
      if (i.lastUpdatedOn == null) {
        date = "";
      } else {
        var dateList = i.lastUpdatedOn!.split('T');
        date = DateFormat('dd/MM/yyyy').format(DateTime.parse(dateList[0]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetAvailableStockDataController>(
        init: GetAvailableStockDataController(),
        builder: (stockDataController) {
          return Card(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: () {
                              setState(() {
                                // stockDataController.catCheck = false;
                                // if (myList[widget.index]["Qty"] != 0) {
                                //   myList[widget.index]["Qty"]--;

                                //   stockDataController.totalQty =
                                //       stockDataController.totalQty.toInt() - 1;

                                //   //price
                                //   myList[widget.index]["mrp"] =
                                //       widget.productList[widget.index].dpl;

                                //   stockDataController.totalAmount =
                                //       stockDataController.totalAmount -
                                //           myList[widget.index]["mrp"];

                                //   stockDataController.isVisible = true;
                                //   myList.add({
                                //     "productcode": widget
                                //         .productList[widget.index].productcode,
                                //     "name": widget
                                //         .productList[widget.index].productdesc,
                                //     "dpl": widget.productList[widget.index].dpl,
                                //     "mrp": stockDataController.amount,
                                //     "Qty": stockDataController.counter,
                                //     "category": widget
                                //         .productList[widget.index].division!
                                //         .trim()
                                //   });
                                //   myList[widget.index]["mrp"] =
                                //       (widget.productList[widget.index].dpl)! *
                                //           myList[widget.index]["Qty"];
                                //   myList[widget.index]["productcode"] = widget
                                //       .productList[widget.index].productcode;
                                //   myList[widget.index]["name"] = widget
                                //       .productList[widget.index].productdesc;
                                //   myList[widget.index]["dpl"] =
                                //       widget.productList[widget.index].dpl;
                                //   myList[widget.index]["category"] = widget
                                //       .productList[widget.index].division!
                                //       .trim();

                                //   stockDataController.update();
                                //   print(myList);
                                // }
                                // if (myList[widget.index]["Qty"] == 0) {
                                //   // Remove 'age' key only for the map at the specified index
                                //   myList[widget.index].remove('category');
                                //   stockDataController.update();
                                //   // print('\nList after removing "age" key at index $indexToRemove:');
                                //   print(myList);
                                // }
                                // setState(() {
                                //   myList;
                                // });
                              });
                            },
                            color: primaryColor),
                        // Text(myList[widget.index]["Qty"]
                        //     .toString()),
                        Text(qtyCount.toString()),
                        IconButton(
                          icon: Icon(Icons.add_circle),
                          color: primaryColor,
                          onPressed: () {
                            setState(() {
                              stockDataController.catCheck = false;

                              //qty
                              stockDataController.isVisible = true;

                              // myList[widget.index]["Qty"]++;
                              qtyCount++;

                              stockDataController.totalQty =
                                  stockDataController.totalQty.toInt() + 1;

                              var totalAmount =
                                  widget.productList[widget.index].dpl *
                                      qtyCount;

                              widget.addProductList[widget.index]["mrp"] =
                                  totalAmount;

                              stockDataController.totalAmount =
                                  stockDataController.totalAmount +
                                      widget.addProductList[widget.index]
                                          ["mrp"];

                              // widget.productList[widget.productList.indexWhere(
                              //         (element) =>
                              //             element.mrp ==
                              //             widget.addProductList[widget.index]
                              //                 ['mrp'])] =
                              //     widget.addProductList[widget.index]['mrp'];

                              widget.addProductList.add({
                                "productcode": widget
                                    .productList[widget.index].productcode,
                                "name": widget
                                    .productList[widget.index].productdesc,
                                "dpl": widget.productList[widget.index].dpl,
                                // "mrp": stockDataController.amount,
                                // "Qty": stockDataController.counter,
                                "mrp": totalAmount,
                                "Qty": qtyCount,
                                "category": widget
                                    .productList[widget.index].division!
                                    .trim()
                              });

                              //price

                              // widget.addProductList[widget.index]["mrp"] =
                              //     widget.productList[widget.index].dpl;

                              // stockDataController.totalAmount =
                              //     stockDataController.totalAmount +
                              //         widget.addProductList[widget.index]["mrp"];

                              // myList[widget.index]["category"] = widget
                              //     .productList[widget.index].division!
                              //     .trim();

                              // myList[widget.index]["mrp"] =
                              //     ((widget.productList[widget.index].dpl)! *
                              //         myList[widget.index]["Qty"]);

                              // myList[widget.index]["productcode"] =
                              //     widget.productList[widget.index].productcode;

                              // myList[widget.index]["name"] =
                              //     widget.productList[widget.index].productdesc;

                              // myList[widget.index]["dpl"] =
                              //     widget.productList[widget.index].dpl;

                              // stockDataController.update();
                              // print(myList[widget.index]["totalPrice"]);

                              print(widget.addProductList);
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
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Icon(Icons
                                                      .highlight_remove_sharp))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Stock Updated On",
                                                  style: TextStyle(
                                                      color: blackTextColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              Text("${date}",
                                                  style: TextStyle(
                                                      color: blackTextColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Availabe Stock",
                                                  style: TextStyle(
                                                      color: blackTextColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              Text(
                                                  "${widget.productList[widget.index].availbleQty.toString()}",
                                                  style: TextStyle(
                                                      color: blackTextColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Last Order",
                                                  style: TextStyle(
                                                      color: blackTextColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              Text(
                                                  "${widget.productList[widget.index].openorderQty.toString()}",
                                                  style: TextStyle(
                                                      color: blackTextColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Open Order",
                                                  style: TextStyle(
                                                      color: blackTextColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              Text("x",
                                                  style: TextStyle(
                                                      color: blackTextColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400)),
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
          );
        });
  }
}
