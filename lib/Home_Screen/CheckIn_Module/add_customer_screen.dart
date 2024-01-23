import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shalimar/Elements/common_button_widget.dart';
import 'package:shalimar/utils/images.dart';

import '../../Controller/payment_controller.dart';
import '../../Controller/set_customer_complaint_data_controller.dart';
import '../../Model/PaymentTypeModel.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  String plantDropdownvalue = 'Payment Type';
  final paymentFormKey = GlobalKey<FormState>();

  // PaymentController paymentController = Get.put(PaymentController());
  File? _image;
  File? contactPersonImg;
  File? panCardImg;
  File? AadharcardImg;
  File? gstImg;
  SetCustomerComplaintDataController complaintController =
  Get.put(SetCustomerComplaintDataController());
  Future getImageUser() async {
    final pickedFile = await  ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 25,
        maxHeight: 480,
        maxWidth: 640);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
    complaintController.uploadFileChunked(_image!.path).then((value) {
      // paymentController.imagsPayment=value['Data'];
      print(value['Data']);
    }
    );
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
                          height: 0,
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
                        Align(
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                alignment: Alignment.center,
                                child:    _image == null ? Text('No Image ') :  ClipOval(
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(48), // Image radius
                                    child: Image.file(_image!, fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Positioned(bottom: 0.0,right: -6.0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_box_rounded,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    getImageUser();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Form(
                                    key: paymentFormKey,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [



                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Mobile Number",
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                            // controller:  paymentController.referenceNumberController,
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
                                                hintText: "eg: 1234XXX",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "Enter Mobile Number",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Mobile Number is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Status",
                                        ),
                                        SizedBox(
                                          height: 5
                                        ),
                                        TextFormField(
                                            // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "Status",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "Status",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Status is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Street Address",
                                        ),
                                        SizedBox(
                                            height: 5
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "Street Address",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "Street Address",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Street Address is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "State",
                                        ),
                                        SizedBox(
                                            height: 5
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "State",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "State",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The State is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "District",
                                        ),
                                        SizedBox(
                                            height: 5
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "District",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "District",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Status is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "City",
                                        ),
                                        SizedBox(
                                            height: 5
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "City",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "City",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Status is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Localty",
                                        ),
                                        SizedBox(
                                            height: 5
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "Localty",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "Localty",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Status is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Pincode",
                                        ),
                                        SizedBox(
                                            height: 5
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "Pincode",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "Enter Pincode",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Status is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Area",
                                        ),
                                        SizedBox(
                                            height: 5
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "Area",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "Area",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Status is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Business Unit",
                                        ),
                                        SizedBox(
                                            height: 5
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "Business Unit",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "Business Unit",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Status is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Contact Person",
                                        ),
                                        SizedBox(
                                            height: 5
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "Contact Person",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "Contact Person",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Status is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Contact Person Pic",
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
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.add_box_rounded,
                                                  size: 80,
                                                ),
                                                onPressed: () {
                                                  getImageUser();
                                                },
                                              ),
                                              _image == null ? Text('No Image selected') : Image.file(_image!,height: 100,)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Pan Number",
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "Contact Person",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "Contact Person",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Status is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Pan Number Attachment",
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black),
                                              borderRadius: BorderRadius.circular(5)),
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.add_box_rounded,
                                                  size: 80,
                                                ),
                                                onPressed: () {
                                                  getImageUser();
                                                },
                                              ),
                                              _image == null ? Text('No Image selected') : Image.file(_image!,height: 100,)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Aadhar Number",
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "Aadhar Number",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "Aadhar Number",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Status is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Aadher Number Attachment",
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black),
                                              borderRadius: BorderRadius.circular(5)),
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.add_box_rounded,
                                                  size: 80,
                                                ),
                                                onPressed: () {
                                                  getImageUser();
                                                },
                                              ),
                                              _image == null ? Text('No Image selected') : Image.file(_image!,height: 100,)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "GST Number",
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "Gst Number",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "GST Number",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Status is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "GST Number Attachment",
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black),
                                              borderRadius: BorderRadius.circular(5)),
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.add_box_rounded,
                                                  size: 80,
                                                ),
                                                onPressed: () {
                                                  getImageUser();
                                                },
                                              ),
                                              _image == null ? Text('No Image selected') : Image.file(_image!,height: 100,)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Bank Name",
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "Bank Name",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "Back Name",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Status is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Account Number",
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "Acount Number",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "Acount Number",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Status is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "IFSC",
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "IFSC Number",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "IFSC Number",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Status is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Branch Name",
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          // controller:  paymentController.amountController,

                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                                hintText: "Branch Name",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "Branch Name",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Status is required.";
                                              }
                                              return null;
                                            }
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CustomButton(
                                          btnName: "Submit",
                                          onPressed: () {
                                            if (paymentFormKey.currentState!
                                                .validate()) {

                                            }

                                          },
                                        )
                                      ],
                                    ),
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
