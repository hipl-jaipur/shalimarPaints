import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Elements/common_button_widget.dart';

import '../../utils/colors.dart';
import '../Controller/get_available_stock_data-controller.dart';

class DumyModal extends StatefulWidget {
  @override
  State<DumyModal> createState() => _DumyModalState();
}

class _DumyModalState extends State<DumyModal> {
  GetAvailableStockDataController stockDataController =
      Get.put(GetAvailableStockDataController());

  Future<int> getValue() async {
    if (stockDataController.i || stockDataController.d) {
      stockDataController.d
          ? stockDataController.filterAvailableStockDataModel!.data!
              .removeWhere((item) => item.division.toString().trim() == "I")
          : stockDataController.filterAvailableStockDataModel!.data!
              .removeWhere((item) => item.division.toString().trim() == "D");
    }

    return Future.value(5);
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return GetBuilder<GetAvailableStockDataController>(
        init: GetAvailableStockDataController(),
        builder: (stockDataController) {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: primaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Filter',
                              style: TextStyle(
                                color: isDarkMode ? primaryLight : primaryLight,
                                fontSize: 20,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.clear,
                                  size: 30,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                      ),
                      // Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  stockDataController.d =
                                      !stockDataController.d;
                                  stockDataController.i = false;

                                  print("D-----${stockDataController.d}");
                                });
                              },
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: stockDataController.d
                                          ? primaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                  child: Center(
                                    child: Text(
                                      'D',
                                      style: TextStyle(
                                        color: stockDataController.d
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  stockDataController.i =
                                      !stockDataController.i;
                                  stockDataController.d = false;

                                  print("I-----${stockDataController.i}");
                                });
                              },
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: stockDataController.i
                                          ? primaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                  child: Center(
                                    child: Text(
                                      'I',
                                      style: TextStyle(
                                        color: stockDataController.i
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          stockDataController.isVisibleMarketSector =
                              !stockDataController.isVisibleMarketSector;
                          stockDataController.update();
                        },
                        child: Container(
                          height: 35,
                          color: Colors.black12,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Market Sector',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down_sharp)
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: stockDataController.isVisibleMarketSector,
                        child: Container(
                          height: 300,
                          child: ListView.builder(
                            itemCount: stockDataController
                                .marketSectorModelData!.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Checkbox(
                                      value: stockDataController.sectionlist
                                          .contains(stockDataController
                                              .marketSectorModelData!
                                              .data![index]
                                              .marketsectorid),
                                      onChanged: (v) {
                                        if (stockDataController.sectionlist
                                            .contains(stockDataController
                                                .marketSectorModelData!
                                                .data![index]
                                                .marketsectorid)) {
                                          stockDataController.sectionlist
                                              .remove(stockDataController
                                                  .marketSectorModelData!
                                                  .data![index]
                                                  .marketsectorid);
                                        } else {
                                          stockDataController.sectionlist.add(
                                              stockDataController
                                                  .marketSectorModelData!
                                                  .data![index]
                                                  .marketsectorid);
                                        }

                                        stockDataController.update();
                                        print(stockDataController.sectionlist);
                                      }),
                                  Container(
                                    child: Text(
                                      stockDataController.marketSectorModelData!
                                          .data![index].marketsectorname
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                                btnName: "Clear",
                                onPressed: () {
                                  stockDataController
                                      .filterAvailableStockDataModel!.data!
                                      .clear();
                                  stockDataController.sectionlist.clear();
                                  for (var add in stockDataController
                                      .availableStockDataModel!.data!) {
                                    stockDataController
                                        .filterAvailableStockDataModel!.data!
                                        .add(add);
                                  }

                                  stockDataController.d = false;
                                  stockDataController.i = false;
                                  stockDataController.update();
                                  print(stockDataController
                                      .filterAvailableStockDataModel!
                                      .data!
                                      .length);
                                  Get.back();
                                }),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomButton(
                                btnName: "Apply",
                                onPressed: () {
                                  /*    stockDataController
                                      .filterAvailableStockDataModel!.data!
                                      .clear();
                                  for (var add in stockDataController
                                      .availableStockDataModel!.data!) {
                                    stockDataController
                                        .filterAvailableStockDataModel!.data!
                                        .add(add);
                                  }
                                  stockDataController
                                      .filterAvailableStockDataModel!.data!.removeWhere((item) => !stockDataController
                                      .sectionlist.contains(item.marketsectorid));
                                  print(stockDataController.filterAvailableStockDataModel!.data!.length);
                                  print(stockDataController.filterAvailableStockDataModel!.data);
                                  stockDataController.update();
                                  for (var add in stockDataController
                                      .availableStockDataModel!.data!) {
                                    stockDataController
                                        .filterAvailableStockDataModel!.data!
                                        .add(add);
                                  }*/
                                  if (stockDataController.i ||
                                      stockDataController.d ||
                                      stockDataController
                                          .sectionlist.isNotEmpty) {
                                    stockDataController
                                        .filterAvailableStockDataModel!.data!
                                        .clear();
                                    for (var add in stockDataController
                                        .availableStockDataModel!.data!) {
                                      stockDataController
                                          .filterAvailableStockDataModel!.data!
                                          .add(add);
                                    }
                                    getValue().then((v) {
                                      stockDataController.sectionlist.isNotEmpty
                                          ? stockDataController
                                              .filterAvailableStockDataModel!
                                              .data!
                                              .removeWhere((item) =>
                                                  !stockDataController
                                                      .sectionlist
                                                      .contains(
                                                          item.marketsectorid))
                                          : null;
                                      stockDataController.update();
                                      print(stockDataController
                                          .filterAvailableStockDataModel!
                                          .data!
                                          .length);
                                      Get.back();
                                    });
                                    /*  if (stockDataController.i || stockDataController.d ) {
                                    stockDataController.d
                                        ? stockDataController
                                            .filterAvailableStockDataModel!.data!.removeWhere((item) => item.division.toString().trim() == "I") : stockDataController.filterAvailableStockDataModel!.data!.removeWhere((item) => item.division.toString().trim() == "D");
                                    stockDataController.update();
                                    print(stockDataController
                                        .filterAvailableStockDataModel!
                                        .data!
                                        .length);
                                    Get.back();
                                    print("I   D");
                                  } if( stockDataController.d && stockDataController.sectionlist.isNotEmpty){
                                    print("lsit with D");
                                    stockDataController
                                        .filterAvailableStockDataModel!.data!.removeWhere((item) => item.division.toString().trim() == "I");
                                    stockDataController.update();
                                    print(stockDataController
                                        .filterAvailableStockDataModel!.data!.length);
                                    Get.back();
                                  }if( stockDataController.i && stockDataController.sectionlist.isNotEmpty){
                                    print("lsit with I");
                                    stockDataController
                                        .filterAvailableStockDataModel!.data!.removeWhere((item) => !stockDataController
                                        .sectionlist.contains(item.marketsectorid));
                                    stockDataController
                                        .filterAvailableStockDataModel!.data!.removeWhere((item) => item.division.toString().trim() == "D");
                                    stockDataController.update();
                                    print(stockDataController
                                        .filterAvailableStockDataModel!
                                        .data!
                                        .length);
                                    Get.back();
                                  }
                                  if(stockDataController.sectionlist.isNotEmpty){
                                    print("lsit ");
                                    stockDataController.filterAvailableStockDataModel!.data!.removeWhere((item) => !stockDataController.sectionlist.contains(item.marketsectorid));
                                    stockDataController.update();
                                    print(stockDataController
                                        .filterAvailableStockDataModel!
                                        .data!
                                        .length);
                                    Get.back();
                                  }*/
                                  } else {
                                    print("Select value");
                                  }
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          );
        });
  }
}
