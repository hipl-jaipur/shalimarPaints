import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shalimar/Elements/common_button_widget.dart';
import 'package:shalimar/utils/images.dart';

class CollectPaymentPage extends StatefulWidget {
  const CollectPaymentPage({super.key});

  @override
  State<CollectPaymentPage> createState() => _CollectPaymentPageState();
}

class _CollectPaymentPageState extends State<CollectPaymentPage> {
  String dropdownvalue = 'Cheque';
  var items = [
    'Cheque',
    'Demand Draft',
    'Cash',
    'NEFT',
    'RTGS',
    'Others',
  ];

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                              child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mode of Payment",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
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
                                            color: Colors.black), //<-- SEE HERE
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    isExpanded: true,
                                    // Initial Value
                                    value: dropdownvalue,

                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),

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
                                    "Reference Number",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
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
                                              color:
                                                  Colors.black), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        hintText: "eg: ABCDXXX",
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        labelText: "Enter Reference Number",
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        focusColor: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Amount",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
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
                                              color:
                                                  Colors.black), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        hintText: "\u{20B9}XXX",
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        labelText: "Enter Amount",
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        focusColor: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Images",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(5)),
                                    width: double.infinity,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add_box_rounded,
                                        size: 80,
                                      ),
                                      onPressed: () {
                                        pickImage;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Remark",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    maxLines: 4,
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
                                              color:
                                                  Colors.black), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        hintText: "Remark",
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        labelText: "Enter Remark",
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
                                ],
                              ),
                            ),
                          )),
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
