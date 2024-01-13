import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/set_order_data_controller.dart';
import 'package:shalimar/Elements/common_cart_widget.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

import '../../Controller/get_available_stock_data-controller.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

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
                            contentPadding:
                                const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                            border: OutlineInputBorder(),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        "\u{20B9}${myCartList[index]["dpl"].toString()}/NOS",
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
                                                "\u{20B9}${myCartList[index]["dpl"].toString()}/NOS",
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
                                                "\u{20B9}${stockController.myList[index]["mrp"].toString()}/NOS",
                                                style: TextStyle(
                                                    color: blackTextColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
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
                                setOrderDataController.fetchData(
                                    context, myCartList);
                                // showSnackBar("Success", "Create Successfully",
                                //     Colors.greenAccent);
                                // Get.off(CheckInPage());

                                // Navigator.pop(context);
                                // Navigator.of(context).pushAndRemoveUntil(
                                //   MaterialPageRoute(
                                //     builder: (context) => CheckInPage()), ModalRoute.withName('/'));
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
                                    "Placed order \u{20B9}$total",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
