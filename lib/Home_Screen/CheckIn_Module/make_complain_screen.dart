import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Elements/common_button_widget.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class ComplainPage extends StatefulWidget {
  const ComplainPage({super.key});

  @override
  State<ComplainPage> createState() => ComplainPageState();
}

class ComplainPageState extends State<ComplainPage> {
  String dropdownvalue = 'Plant';
  var items = [
    'Plant',
    'Plant 1',
    'Plant 2',
    'Plant 3',
    'Plant 4',
    'Plant 5',
  ];

  String subCatDropdownvalue = 'Sub Category';
  var subCatItems = [
    'Sub Category',
    'Sub Category 1',
    'Sub Category 2',
    'Sub Category 3',
    'Sub Category 4',
    'Sub Category 5',
  ];

  String productDropdownvalue = 'Product';
  var productItems = [
    'Product',
    'Product 1',
    'Product 2',
    'Product 3',
    'Product 4',
    'Product 5',
  ];

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_circle_left,
                              color: Colors.white,
                              size: 40,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Complain",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Complain Management",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "View Instructions",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Complain Details",
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Please fill out our complaint here",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                )),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .black), //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          isExpanded: true,
                                          // Initial Value
                                          value: subCatDropdownvalue,

                                          // Down Arrow Icon
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),

                                          // Array list of items
                                          items:
                                              subCatItems.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),
                                          // After selecting the desired option,it will
                                          // change button value to selected value
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              subCatDropdownvalue = newValue!;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                )),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .black), //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          isExpanded: true,
                                          // Initial Value
                                          value: productDropdownvalue,

                                          // Down Arrow Icon
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),

                                          // Array list of items
                                          items:
                                              productItems.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),
                                          // After selecting the desired option,it will
                                          // change button value to selected value
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              productDropdownvalue = newValue!;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          enabled: true,
                                          maxLines: 1,
                                          cursorColor: Colors.black,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)),
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                  )),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors
                                                        .black), //<-- SEE HERE
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              hintText: "Enter Batch Number",
                                              hintStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              labelText: "Enter Batch Number",
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              focusColor: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                )),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .black), //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          isExpanded: true,
                                          // Initial Value
                                          value: dropdownvalue,

                                          // Down Arrow Icon
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),

                                          // Array list of items
                                          items: items.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),
                                          // After selecting the desired option,it will
                                          // change button value to selected value
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownvalue = newValue!;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Capture Batch Images",
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          width: double.infinity,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.add_box_rounded,
                                              size: 80,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          onTap: () {
                                            _selectDate(context);
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              "${selectedDate.toLocal()}".split(' ')[0];
                                            });
                                          },
                                          enabled: true,
                                          maxLines: 1,
                                          cursorColor: Colors.black,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.calendar_month),
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)),
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                  )),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors
                                                        .black), //<-- SEE HERE
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              hintText: "Manufacturing Date",
                                              hintStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              labelText: "Manufacturing Date",
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              focusColor: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          enabled: true,
                                          maxLines: 1,
                                          cursorColor: Colors.black,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)),
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                  )),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors
                                                        .black), //<-- SEE HERE
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              hintText: "Damaged Qty",
                                              hintStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              labelText: "Damaged Qty",
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              focusColor: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          enabled: true,
                                          maxLines: 2,
                                          cursorColor: Colors.black,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      20.0, 40.0, 20.0, 0.0),
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)),
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                  )),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors
                                                        .black), //<-- SEE HERE
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              hintText: "Description",
                                              hintStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              labelText: "Description",
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              focusColor: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        CustomButton(
                                          btnName: "Submit",
                                          onPressed: () {},
                                        )
                                      ]),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                  child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Service Ticket Status",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "For Shalimar",
                                        style: TextStyle(
                                            color: blackTextColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        enabled: false,
                                        maxLines: 1,
                                        cursorColor: Colors.black,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                )),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .black), //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            hintText: "Fresh Desk Ticket No",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            labelText: "Fresh Desk Ticket No",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            focusColor: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        enabled: false,
                                        maxLines: 1,
                                        cursorColor: Colors.black,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                )),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .black), //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            hintText: "Ticket Date",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            labelText: "Ticket Date",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            focusColor: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        enabled: false,
                                        maxLines: 2,
                                        cursorColor: Colors.black,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    20.0, 40.0, 20.0, 0.0),
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                )),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .black), //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            hintText: "Status",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            labelText: "Status",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            focusColor: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        enabled: false,
                                        maxLines: 2,
                                        cursorColor: Colors.black,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    20.0, 40.0, 20.0, 0.0),
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                )),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .black), //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            hintText: "Remark",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            labelText: "Remark",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            focusColor: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
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
