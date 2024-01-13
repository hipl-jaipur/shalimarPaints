import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/get_available_stock_data-controller.dart';
import 'package:shalimar/Model/available_stock_data_model.dart';
import 'package:shalimar/utils/colors.dart';

class TakeOrderList extends StatefulWidget {
  int index;
  BuildContext context;
  AvailableStockDataModel availableStockDataModel;

  TakeOrderList({
    super.key,
    required this.index,
    required this.context,
    required this.availableStockDataModel,
  });

  @override
  State<TakeOrderList> createState() => _TakeOrderListState();
}

class _TakeOrderListState extends State<TakeOrderList> {
  GetAvailableStockDataController stockDataController =
      Get.put(GetAvailableStockDataController());

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
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
                        "${widget.availableStockDataModel.data![widget.index].productcode.toString()} - ${widget.availableStockDataModel.data![widget.index].productdesc.toString()}",
                        style: TextStyle(
                            color: blackTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    Text(
                        "\u{20B9}${widget.availableStockDataModel.data![widget.index].dpl.toString()}/NOS",
                        style: TextStyle(
                            color: blackTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: () {
                              setState(() {
                                // widget.isVisible = true;
                                if (stockDataController.myList[widget.index]
                                        ["Qty"] !=
                                    0) {
                                  stockDataController.myList[widget.index]
                                      ["Qty"]--;
                                  stockDataController.totalQty =
                                      stockDataController.totalQty.toInt() - 1;
                                  stockDataController.isVisible = true;
                                  stockDataController.myList.add({
                                    "productcode": widget
                                        .availableStockDataModel
                                        .data![widget.index]
                                        .productcode,
                                    "name": widget.availableStockDataModel
                                        .data![widget.index].productdesc,
                                    "dpl": widget.availableStockDataModel
                                        .data![widget.index].dpl,
                                    "mrp": stockDataController.totalAmount,
                                    "Qty": stockDataController.counter
                                  });
                                  stockDataController.myList[widget.index]
                                      ["mrp"] = (widget.availableStockDataModel
                                          .data![widget.index].dpl)! *
                                      stockDataController.myList[widget.index]
                                          ["Qty"];
                                  stockDataController.myList[widget.index]
                                          ["productcode"] =
                                      widget.availableStockDataModel
                                          .data![widget.index].productcode;
                                  stockDataController.myList[widget.index]
                                          ["name"] =
                                      widget.availableStockDataModel
                                          .data![widget.index].productdesc;
                                  stockDataController.myList[widget.index]
                                          ["dpl"] =
                                      widget.availableStockDataModel
                                          .data![widget.index].dpl;

                                  stockDataController.update();
                                  print(stockDataController.myList);
                                }
                              });
                            },
                            color: primaryColor),
                        Text(stockDataController.myList[widget.index]["Qty"]
                            .toString()),
                        IconButton(
                          icon: Icon(Icons.add_circle),
                          color: primaryColor,
                          onPressed: () {
                            setState(() {
                              stockDataController.isVisible = true;
                              // widget.isVisible = true;
                              // counter++;
                              stockDataController.myList[widget.index]["Qty"]++;

                              stockDataController.totalQty =
                                  stockDataController.totalQty.toInt() + 1;
                              stockDataController.myList.add({
                                "productcode": widget.availableStockDataModel
                                    .data![widget.index].productcode,
                                "name": widget.availableStockDataModel
                                    .data![widget.index].productdesc,
                                "dpl": widget.availableStockDataModel
                                    .data![widget.index].dpl,
                                "mrp": stockDataController.totalAmount,
                                "Qty": stockDataController.counter
                              });
                              stockDataController.myList[widget.index]["mrp"] =
                                  ((widget.availableStockDataModel
                                          .data![widget.index].dpl)! *
                                      stockDataController.myList[widget.index]
                                          ["Qty"]);
                              stockDataController.myList[widget.index]
                                      ["productcode"] =
                                  widget.availableStockDataModel
                                      .data![widget.index].productcode;
                              stockDataController.myList[widget.index]["name"] =
                                  widget.availableStockDataModel
                                      .data![widget.index].productdesc;
                              stockDataController.myList[widget.index]["dpl"] =
                                  widget.availableStockDataModel
                                      .data![widget.index].dpl;
                              stockDataController.update();
                              print(stockDataController.myList[widget.index]
                                  ["totalPrice"]);
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
                                              Text(
                                                  "${widget.availableStockDataModel.data![widget.index].lastUpdatedOn.toString()}",
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
                                                  "${widget.availableStockDataModel.data![widget.index].availbleQty.toString()}",
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
                                                  "${widget.availableStockDataModel.data![widget.index].openorderQty.toString()}",
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
                            "Available Stock: ${widget.availableStockDataModel.data![widget.index].availbleQty.toString()}"),
                        Text(
                            "Last Order: ${widget.availableStockDataModel.data![widget.index].openorderQty.toString()}")
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
