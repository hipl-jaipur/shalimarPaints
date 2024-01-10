import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shalimar/Controller/plant_data_controller.dart';
import 'package:shalimar/Controller/product_data_controller.dart';
import 'package:shalimar/Controller/subcategory_data_controller.dart';
import 'package:shalimar/Elements/common_button_widget.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

import '../../Model/plant_data_model.dart';
import '../../Model/product_data_model.dart';
import '../../Model/subCatagory_data_model.dart';

class ComplainPage extends StatefulWidget {
  const ComplainPage({super.key});

  @override
  State<ComplainPage> createState() => ComplainPageState();
}

class ComplainPageState extends State<ComplainPage> {
  PlantDataController plantDataController = Get.put(PlantDataController());
  SubCategoryDataController subCategoryDataController =
      Get.put(SubCategoryDataController());
  ProductDataController productDataController =
      Get.put(ProductDataController());

  String plantDropdownvalue = 'Plant';
  int plantID = 0;

  String subCatDropdownvalue = 'Sub Category';
  int subCategoryID = 0;

  String productDropdownvalue = 'Product';
  String productCode = "";

  DateTime selectedDate = DateTime.now();
  TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = '${picked.toLocal()}'.split(' ')[0];
      });
    }
  }

  // File? image, downloadURL;
  List<XFile> _images = [];

  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker()
  //         .pickImage(source: ImageSource.camera, imageQuality: 24);
  //     if (image == null) return;
  //     final imageTemp = File(image.path);
  //     setState(() {
  //       this.image = imageTemp;
  //     });
  //   } on PlatformException catch (e) {
  //     if (kDebugMode) {
  //       print('Failed to pick image: $e');
  //     }
  //   }
  // }

  Future<void> _getImage() async {
    if (await Permission.camera.request().isGranted) {
      XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );

      if (image != null) {
        setState(() {
          _images.add(image);
        });
      }
    } else {
      print('Permission denied');
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DropdownButtonFormField<SubCategory>(
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
                                      ),
                                      isExpanded: true,
                                      // Initial Value
                                      // value: ,
                                      hint: subCatDropdownvalue == "" ||
                                              subCatDropdownvalue == null
                                          ? Text("Sub Category")
                                          : Text(subCatDropdownvalue),
                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: subCategoryDataController
                                          .subCatagoryDataModel!.data!
                                          .map((SubCategory option) {
                                        return DropdownMenuItem<SubCategory>(
                                          value: option,
                                          child: Text(option.subcategoryName
                                              .toString()),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (val) {
                                        subCategoryID =
                                            val!.subCategoryID!.toInt();
                                        print("subCategory ID: $subCategoryID");
                                        setState(() {});
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    DropdownButtonFormField<Product>(
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
                                      ),
                                      isExpanded: true,
                                      // Initial Value
                                      // value: ,
                                      hint: productDropdownvalue == "" ||
                                              productDropdownvalue == null
                                          ? Text("Product")
                                          : Text(productDropdownvalue),
                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: productDataController
                                                  .productDataModel !=
                                              null
                                          ? productDataController
                                              .productDataModel!.data!
                                              .map((Product option) {
                                              return DropdownMenuItem<Product>(
                                                value: option,
                                                child: Text(
                                                    "${option.productcode} - ${option.productdesc}"
                                                        .toString()),
                                              );
                                            }).toList()
                                          : List.empty(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (val) {
                                        productCode = val!.productcode!;
                                        print("productCode: $productCode");
                                        setState(() {});
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
                                    DropdownButtonFormField<Data>(
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
                                      ),
                                      isExpanded: true,
                                      // Initial Value
                                      // value: ,
                                      hint: plantDropdownvalue == "" ||
                                              plantDropdownvalue == null
                                          ? Text("Plant")
                                          : Text(plantDropdownvalue),
                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: plantDataController
                                          .plantDataModel!.data!
                                          .map((Data option) {
                                        return DropdownMenuItem<Data>(
                                          value: option,
                                          child:
                                              Text(option.plantname.toString()),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (val) {
                                        plantID = val!.plantid!.toInt();
                                        print("Plant ID: $plantID");
                                        setState(() {});
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
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: _images.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Image.file(
                                                        File(_images[index]
                                                            .path),
                                                        height: 150,
                                                        width: 150,
                                                      ),
                                                    );
                                                  })),
                                          IconButton(
                                            icon: Icon(
                                              Icons.add_box_rounded,
                                              size: 80,
                                            ),
                                            onPressed: () async {
                                              // pickImage();
                                              await _getImage;
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                      controller: _dateController,
                                      readOnly: true,
                                      onChanged: (value) {
                                        setState(() {
                                          "${selectedDate.toLocal()}"
                                              .split(' ')[0];
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                              color:
                                                  Colors.black), //<-- SEE HERE
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
                                              color:
                                                  Colors.black), //<-- SEE HERE
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
                                              color:
                                                  Colors.black), //<-- SEE HERE
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
                                              color:
                                                  Colors.black), //<-- SEE HERE
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
