import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:native_exif/native_exif.dart';
import 'package:shalimar/Controller/set_customer_data_controller.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

import '../../../Controller/set_customer_complaint_data_controller.dart';

class AddCustomerPage extends StatefulWidget {
  var territoryId, territoryName, tag;

  AddCustomerPage(
      {super.key, this.territoryId, this.territoryName, required this.tag});

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  final formKey = GlobalKey<FormState>();
  File? _image;
  File? contactPersonImg;
  File? panCardImg;
  File? AadharcardImg;
  File? gstImg;
  SetCustomerComplaintDataController complaintController =
      Get.put(SetCustomerComplaintDataController());
  SetCustomerDataController controller = Get.put(SetCustomerDataController());
  final picker = ImagePicker();

  XFile? pickedFile;
  Exif? exif;
  Map<String, Object>? attributes;
  DateTime? shootingDate;
  ExifLatLong? coordinate;
  // String stAddress = '';

  Future getImage() async {
    // pickedFile = await picker.pickImage(source: ImageSource.camera);
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 25,
        maxHeight: 480,
        maxWidth: 640);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });

    exif = await Exif.fromPath(pickedFile!.path);
    attributes = await exif!.getAttributes();
    shootingDate = await exif!.getOriginalDate();
    coordinate = await exif!.getLatLong();

    controller.lat = coordinate!.latitude;

    controller.long = coordinate!.longitude;
    controller.image = pickedFile.name;
    // controller.state = attributes!.state;

    final coordinates = new Coordinates(controller.lat, controller.long);
    var address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = address.first;

    // on below line we have set the address to string
    setState(() {
      // stAddress = first.addressLine.toString();
      controller.addrsssTwoCont.text = first.adminArea!;
      controller.cityCont.text = first.locality!;
      controller.postalCodeCont.text = first.postalCode!;
      controller.distCont.text = first.locality!;
      controller.localityCont.text = first.locality!;
    });
  }

  Future getImageUser() async {
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 25,
        maxHeight: 480,
        maxWidth: 640);

    setState(() {
      if (pickedFile != null) {
        // getImageLocation(pickedFile.path);
        // _image = File(pickedFile.path);
      }
    });
  }

  // Future<void> getImageLocation(String imagePath) async {
  //   try {
  //     Map<String, dynamic> exifData =
  //         await FlutterExifPlugin.readExifFromFile(imagePath);

  //     double? latitude = exifData['GPS GPSLatitude'] as double?;
  //     double? longitude = exifData['GPS GPSLongitude'] as double?;

  //     if (latitude != null && longitude != null) {
  //       print('Latitude: $latitude, Longitude: $longitude');
  //       // Now you have the latitude and longitude, and you can use them as needed.
  //     } else {
  //       print('Image does not contain geolocation information.');
  //     }
  //   } catch (e) {
  //     print('Error reading Exif data: $e');
  //   }
  // }

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
                        Row(
                          children: [
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
                              width: 10,
                            ),
                            Text(
                              widget.tag == "Edit Customer"
                                  ? "Edit Customer"
                                  : "Add Customer",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                alignment: Alignment.center,
                                child: _image == null
                                    ? Icon(
                                        Icons.person,
                                        size: 80,
                                      )
                                    // Text('No Image ')

                                    : ClipOval(
                                        child: SizedBox.fromSize(
                                          size: Size.fromRadius(
                                              48), // Image radius
                                          child: Image.file(_image!,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                              ),
                              Positioned(
                                bottom: 2.0,
                                right: -4.0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_box_rounded,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    // getImageUser();
                                    getImage();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                            child: Text('Profile Picture',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white))),
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
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Customer Name",
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        controller: controller.customerNameCont,
                                        cursorColor: Colors.black,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
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
                                            hintText: "Customer Name",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            // labelText: "Enter Customer Name",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            focusColor: Colors.black),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "The Customer Name is required.";
                                          }
                                          return null;
                                        }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Mobile Number",
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        maxLength: 10,
                                        controller: controller.telephoneCont,
                                        cursorColor: Colors.black,
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.next,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            counter: Offstage(),
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
                                            hintText: "eg: 1234XXX",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            // labelText: "Enter Mobile Number",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            focusColor: Colors.black),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "The Mobile Number is required.";
                                          }
                                          if (value.length < 10) {
                                            return "Enter Valid Mobile Number";
                                          }
                                          return null;
                                        }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // Text(
                                    //   "Status",
                                    // ),
                                    // SizedBox(height: 10),
                                    // TextFormField(
                                    //     // controller:  paymentController.amountController,

                                    //     cursorColor: Colors.black,
                                    //     keyboardType: TextInputType.text,
                                    //     style: TextStyle(color: Colors.black),
                                    //     decoration: InputDecoration(
                                    //         contentPadding:
                                    //             const EdgeInsets.fromLTRB(
                                    //                 20.0, 0.0, 20.0, 0.0),
                                    //         border: OutlineInputBorder(),
                                    //         focusedBorder: OutlineInputBorder(
                                    //             borderRadius: BorderRadius.all(
                                    //                 Radius.circular(3)),
                                    //             borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //             )),
                                    //         enabledBorder: OutlineInputBorder(
                                    //           borderSide: BorderSide(
                                    //               color: Colors
                                    //                   .black), //<-- SEE HERE
                                    //           borderRadius:
                                    //               BorderRadius.circular(5.0),
                                    //         ),
                                    //         hintText: "Status",
                                    //         hintStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         labelText: "Status",
                                    //         labelStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         focusColor: Colors.black),
                                    //     validator: (value) {
                                    //       if (value == null || value.isEmpty) {
                                    //         return "The Status is required.";
                                    //       }
                                    //       return null;
                                    //     }),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    Text(
                                      "Street Address",
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                        textCapitalization:
                                            TextCapitalization.words,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: controller.addrsssOneCont,
                                        cursorColor: Colors.black,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
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
                                            hintText: "Street Address",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            // labelText: "Street Address",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            focusColor: Colors.black),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "The Street Address is required.";
                                          }
                                          return null;
                                        }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "State",
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                        readOnly: true,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: controller.addrsssTwoCont,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: Colors.black,
                                        keyboardType: TextInputType.text,
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
                                            hintText: "State",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            // labelText: "State",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            focusColor: Colors.black),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "The State is required.";
                                          }
                                          return null;
                                        }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "District",
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                        readOnly: true,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: controller.distCont,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: Colors.black,
                                        keyboardType: TextInputType.text,
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
                                            hintText: "District",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            // labelText: "District",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            focusColor: Colors.black),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "The District is required.";
                                          }
                                          return null;
                                        }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "City",
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                        readOnly: true,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        textInputAction: TextInputAction.next,
                                        controller: controller.cityCont,
                                        cursorColor: Colors.black,
                                        keyboardType: TextInputType.text,
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
                                            hintText: "City",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            // labelText: "City",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            focusColor: Colors.black),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "The City is required.";
                                          }
                                          return null;
                                        }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Locality",
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                        readOnly: true,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: controller.localityCont,
                                        cursorColor: Colors.black,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
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
                                            hintText: "Locality",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            // labelText: "Locality",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            focusColor: Colors.black),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "The Locality is required.";
                                          }
                                          return null;
                                        }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Pincode",
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                        // initialValue: controller.postalCode,
                                        controller: controller.postalCodeCont,
                                        readOnly: true,
                                        maxLength: 6,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        // controller: controller.postalCodeCont,
                                        textInputAction: TextInputAction.done,
                                        cursorColor: Colors.black,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            counter: Offstage(),
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
                                            hintText: "Pincode",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            // labelText: "Enter Pincode",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            focusColor: Colors.black),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "The Pincode is required.";
                                          }
                                          if (value.length < 6) {
                                            return "Enter Valid Pincode";
                                          }
                                          return null;
                                        }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Area",
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                        enabled: false,
                                        initialValue: widget.territoryName,
                                        cursorColor: Colors.black,
                                        keyboardType: TextInputType.text,
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
                                            hintText: "Area",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            // labelText: "Area",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            focusColor: Colors.black),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "The Area is required.";
                                          }
                                          return null;
                                        }),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text(
                                    //   "Business Unit",
                                    // ),
                                    // SizedBox(height: 10),
                                    // TextFormField(
                                    //     // controller:  paymentController.amountController,

                                    //     cursorColor: Colors.black,
                                    //     keyboardType: TextInputType.text,
                                    //     style: TextStyle(color: Colors.black),
                                    //     decoration: InputDecoration(
                                    //         contentPadding:
                                    //             const EdgeInsets.fromLTRB(
                                    //                 20.0, 0.0, 20.0, 0.0),
                                    //         border: OutlineInputBorder(),
                                    //         focusedBorder: OutlineInputBorder(
                                    //             borderRadius: BorderRadius.all(
                                    //                 Radius.circular(3)),
                                    //             borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //             )),
                                    //         enabledBorder: OutlineInputBorder(
                                    //           borderSide: BorderSide(
                                    //               color: Colors
                                    //                   .black), //<-- SEE HERE
                                    //           borderRadius:
                                    //               BorderRadius.circular(5.0),
                                    //         ),
                                    //         hintText: "Business Unit",
                                    //         hintStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         labelText: "Business Unit",
                                    //         labelStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         focusColor: Colors.black),
                                    //     validator: (value) {
                                    //       if (value == null || value.isEmpty) {
                                    //         return "The Status is required.";
                                    //       }
                                    //       return null;
                                    //     }),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text(
                                    //   "Contact Person",
                                    // ),
                                    // SizedBox(height: 10),
                                    // TextFormField(
                                    //     // controller:  paymentController.amountController,

                                    //     cursorColor: Colors.black,
                                    //     keyboardType: TextInputType.text,
                                    //     style: TextStyle(color: Colors.black),
                                    //     decoration: InputDecoration(
                                    //         contentPadding:
                                    //             const EdgeInsets.fromLTRB(
                                    //                 20.0, 0.0, 20.0, 0.0),
                                    //         border: OutlineInputBorder(),
                                    //         focusedBorder: OutlineInputBorder(
                                    //             borderRadius: BorderRadius.all(
                                    //                 Radius.circular(3)),
                                    //             borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //             )),
                                    //         enabledBorder: OutlineInputBorder(
                                    //           borderSide: BorderSide(
                                    //               color: Colors
                                    //                   .black), //<-- SEE HERE
                                    //           borderRadius:
                                    //               BorderRadius.circular(5.0),
                                    //         ),
                                    //         hintText: "Contact Person",
                                    //         hintStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         labelText: "Contact Person",
                                    //         labelStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         focusColor: Colors.black),
                                    //     validator: (value) {
                                    //       if (value == null || value.isEmpty) {
                                    //         return "The Status is required.";
                                    //       }
                                    //       return null;
                                    //     }),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text(
                                    //   "Contact Person Pic",
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Container(
                                    //   alignment: Alignment.topLeft,
                                    //   decoration: BoxDecoration(
                                    //       border:
                                    //           Border.all(color: Colors.black),
                                    //       borderRadius:
                                    //           BorderRadius.circular(5)),
                                    //   width: double.infinity,
                                    //   child: Row(
                                    //     children: [
                                    //       IconButton(
                                    //         icon: Icon(
                                    //           Icons.add_box_rounded,
                                    //           size: 80,
                                    //         ),
                                    //         onPressed: () {
                                    //           getImageUser();
                                    //         },
                                    //       ),
                                    //       _image == null
                                    //           ? Text('No Image selected')
                                    //           : Image.file(
                                    //               _image!,
                                    //               height: 100,
                                    //             )
                                    //     ],
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text(
                                    //   "Pan Number",
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // TextFormField(
                                    //     // controller:  paymentController.amountController,

                                    //     cursorColor: Colors.black,
                                    //     keyboardType: TextInputType.text,
                                    //     style: TextStyle(color: Colors.black),
                                    //     decoration: InputDecoration(
                                    //         contentPadding:
                                    //             const EdgeInsets.fromLTRB(
                                    //                 20.0, 0.0, 20.0, 0.0),
                                    //         border: OutlineInputBorder(),
                                    //         focusedBorder: OutlineInputBorder(
                                    //             borderRadius: BorderRadius.all(
                                    //                 Radius.circular(3)),
                                    //             borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //             )),
                                    //         enabledBorder: OutlineInputBorder(
                                    //           borderSide: BorderSide(
                                    //               color: Colors
                                    //                   .black), //<-- SEE HERE
                                    //           borderRadius:
                                    //               BorderRadius.circular(5.0),
                                    //         ),
                                    //         hintText: "Contact Person",
                                    //         hintStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         labelText: "Contact Person",
                                    //         labelStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         focusColor: Colors.black),
                                    //     validator: (value) {
                                    //       if (value == null || value.isEmpty) {
                                    //         return "The Status is required.";
                                    //       }
                                    //       return null;
                                    //     }),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text(
                                    //   "Pan Number Attachment",
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Container(
                                    //   alignment: Alignment.topLeft,
                                    //   decoration: BoxDecoration(
                                    //       border:
                                    //           Border.all(color: Colors.black),
                                    //       borderRadius:
                                    //           BorderRadius.circular(5)),
                                    //   width: double.infinity,
                                    //   child: Row(
                                    //     children: [
                                    //       IconButton(
                                    //         icon: Icon(
                                    //           Icons.add_box_rounded,
                                    //           size: 80,
                                    //         ),
                                    //         onPressed: () {
                                    //           getImageUser();
                                    //         },
                                    //       ),
                                    //       _image == null
                                    //           ? Text('No Image selected')
                                    //           : Image.file(
                                    //               _image!,
                                    //               height: 100,
                                    //             )
                                    //     ],
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text(
                                    //   "Aadhar Number",
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // TextFormField(
                                    //     // controller:  paymentController.amountController,

                                    //     cursorColor: Colors.black,
                                    //     keyboardType: TextInputType.number,
                                    //     style: TextStyle(color: Colors.black),
                                    //     decoration: InputDecoration(
                                    //         contentPadding:
                                    //             const EdgeInsets.fromLTRB(
                                    //                 20.0, 0.0, 20.0, 0.0),
                                    //         border: OutlineInputBorder(),
                                    //         focusedBorder: OutlineInputBorder(
                                    //             borderRadius: BorderRadius.all(
                                    //                 Radius.circular(3)),
                                    //             borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //             )),
                                    //         enabledBorder: OutlineInputBorder(
                                    //           borderSide: BorderSide(
                                    //               color: Colors
                                    //                   .black), //<-- SEE HERE
                                    //           borderRadius:
                                    //               BorderRadius.circular(5.0),
                                    //         ),
                                    //         hintText: "Aadhar Number",
                                    //         hintStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         labelText: "Aadhar Number",
                                    //         labelStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         focusColor: Colors.black),
                                    //     validator: (value) {
                                    //       if (value == null || value.isEmpty) {
                                    //         return "The Status is required.";
                                    //       }
                                    //       return null;
                                    //     }),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text(
                                    //   "Aadher Number Attachment",
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Container(
                                    //   alignment: Alignment.topLeft,
                                    //   decoration: BoxDecoration(
                                    //       border:
                                    //           Border.all(color: Colors.black),
                                    //       borderRadius:
                                    //           BorderRadius.circular(5)),
                                    //   width: double.infinity,
                                    //   child: Row(
                                    //     children: [
                                    //       IconButton(
                                    //         icon: Icon(
                                    //           Icons.add_box_rounded,
                                    //           size: 80,
                                    //         ),
                                    //         onPressed: () {
                                    //           getImageUser();
                                    //         },
                                    //       ),
                                    //       _image == null
                                    //           ? Text('No Image selected')
                                    //           : Image.file(
                                    //               _image!,
                                    //               height: 100,
                                    //             )
                                    //     ],
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text(
                                    //   "GST Number",
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // TextFormField(
                                    //     // controller:  paymentController.amountController,

                                    //     cursorColor: Colors.black,
                                    //     keyboardType: TextInputType.text,
                                    //     style: TextStyle(color: Colors.black),
                                    //     decoration: InputDecoration(
                                    //         contentPadding:
                                    //             const EdgeInsets.fromLTRB(
                                    //                 20.0, 0.0, 20.0, 0.0),
                                    //         border: OutlineInputBorder(),
                                    //         focusedBorder: OutlineInputBorder(
                                    //             borderRadius: BorderRadius.all(
                                    //                 Radius.circular(3)),
                                    //             borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //             )),
                                    //         enabledBorder: OutlineInputBorder(
                                    //           borderSide: BorderSide(
                                    //               color: Colors
                                    //                   .black), //<-- SEE HERE
                                    //           borderRadius:
                                    //               BorderRadius.circular(5.0),
                                    //         ),
                                    //         hintText: "Gst Number",
                                    //         hintStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         labelText: "GST Number",
                                    //         labelStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         focusColor: Colors.black),
                                    //     validator: (value) {
                                    //       if (value == null || value.isEmpty) {
                                    //         return "The Status is required.";
                                    //       }
                                    //       return null;
                                    //     }),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text(
                                    //   "GST Number Attachment",
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Container(
                                    //   alignment: Alignment.topLeft,
                                    //   decoration: BoxDecoration(
                                    //       border:
                                    //           Border.all(color: Colors.black),
                                    //       borderRadius:
                                    //           BorderRadius.circular(5)),
                                    //   width: double.infinity,
                                    //   child: Row(
                                    //     children: [
                                    //       IconButton(
                                    //         icon: Icon(
                                    //           Icons.add_box_rounded,
                                    //           size: 80,
                                    //         ),
                                    //         onPressed: () {
                                    //           getImageUser();
                                    //         },
                                    //       ),
                                    //       _image == null
                                    //           ? Text('No Image selected')
                                    //           : Image.file(
                                    //               _image!,
                                    //               height: 100,
                                    //             )
                                    //     ],
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text(
                                    //   "Bank Name",
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // TextFormField(
                                    //     // controller:  paymentController.amountController,

                                    //     cursorColor: Colors.black,
                                    //     keyboardType: TextInputType.text,
                                    //     style: TextStyle(color: Colors.black),
                                    //     decoration: InputDecoration(
                                    //         contentPadding:
                                    //             const EdgeInsets.fromLTRB(
                                    //                 20.0, 0.0, 20.0, 0.0),
                                    //         border: OutlineInputBorder(),
                                    //         focusedBorder: OutlineInputBorder(
                                    //             borderRadius: BorderRadius.all(
                                    //                 Radius.circular(3)),
                                    //             borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //             )),
                                    //         enabledBorder: OutlineInputBorder(
                                    //           borderSide: BorderSide(
                                    //               color: Colors
                                    //                   .black), //<-- SEE HERE
                                    //           borderRadius:
                                    //               BorderRadius.circular(5.0),
                                    //         ),
                                    //         hintText: "Bank Name",
                                    //         hintStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         labelText: "Back Name",
                                    //         labelStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         focusColor: Colors.black),
                                    //     validator: (value) {
                                    //       if (value == null || value.isEmpty) {
                                    //         return "The Status is required.";
                                    //       }
                                    //       return null;
                                    //     }),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text(
                                    //   "Account Number",
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // TextFormField(
                                    //     // controller:  paymentController.amountController,

                                    //     cursorColor: Colors.black,
                                    //     keyboardType: TextInputType.number,
                                    //     style: TextStyle(color: Colors.black),
                                    //     decoration: InputDecoration(
                                    //         contentPadding:
                                    //             const EdgeInsets.fromLTRB(
                                    //                 20.0, 0.0, 20.0, 0.0),
                                    //         border: OutlineInputBorder(),
                                    //         focusedBorder: OutlineInputBorder(
                                    //             borderRadius: BorderRadius.all(
                                    //                 Radius.circular(3)),
                                    //             borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //             )),
                                    //         enabledBorder: OutlineInputBorder(
                                    //           borderSide: BorderSide(
                                    //               color: Colors
                                    //                   .black), //<-- SEE HERE
                                    //           borderRadius:
                                    //               BorderRadius.circular(5.0),
                                    //         ),
                                    //         hintText: "Acount Number",
                                    //         hintStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         labelText: "Acount Number",
                                    //         labelStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         focusColor: Colors.black),
                                    //     validator: (value) {
                                    //       if (value == null || value.isEmpty) {
                                    //         return "The Status is required.";
                                    //       }
                                    //       return null;
                                    //     }),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text(
                                    //   "IFSC",
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // TextFormField(
                                    //     // controller:  paymentController.amountController,

                                    //     cursorColor: Colors.black,
                                    //     keyboardType: TextInputType.text,
                                    //     style: TextStyle(color: Colors.black),
                                    //     decoration: InputDecoration(
                                    //         contentPadding:
                                    //             const EdgeInsets.fromLTRB(
                                    //                 20.0, 0.0, 20.0, 0.0),
                                    //         border: OutlineInputBorder(),
                                    //         focusedBorder: OutlineInputBorder(
                                    //             borderRadius: BorderRadius.all(
                                    //                 Radius.circular(3)),
                                    //             borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //             )),
                                    //         enabledBorder: OutlineInputBorder(
                                    //           borderSide: BorderSide(
                                    //               color: Colors
                                    //                   .black), //<-- SEE HERE
                                    //           borderRadius:
                                    //               BorderRadius.circular(5.0),
                                    //         ),
                                    //         hintText: "IFSC Number",
                                    //         hintStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         labelText: "IFSC Number",
                                    //         labelStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         focusColor: Colors.black),
                                    //     validator: (value) {
                                    //       if (value == null || value.isEmpty) {
                                    //         return "The Status is required.";
                                    //       }
                                    //       return null;
                                    //     }),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text(
                                    //   "Branch Name",
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // TextFormField(
                                    //     // controller:  paymentController.amountController,

                                    //     cursorColor: Colors.black,
                                    //     keyboardType: TextInputType.text,
                                    //     style: TextStyle(color: Colors.black),
                                    //     decoration: InputDecoration(
                                    //         contentPadding:
                                    //             const EdgeInsets.fromLTRB(
                                    //                 20.0, 0.0, 20.0, 0.0),
                                    //         border: OutlineInputBorder(),
                                    //         focusedBorder: OutlineInputBorder(
                                    //             borderRadius: BorderRadius.all(
                                    //                 Radius.circular(3)),
                                    //             borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //             )),
                                    //         enabledBorder: OutlineInputBorder(
                                    //           borderSide: BorderSide(
                                    //               color: Colors
                                    //                   .black), //<-- SEE HERE
                                    //           borderRadius:
                                    //               BorderRadius.circular(5.0),
                                    //         ),
                                    //         hintText: "Branch Name",
                                    //         hintStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         labelText: "Branch Name",
                                    //         labelStyle: TextStyle(
                                    //           color: Colors.black,
                                    //         ),
                                    //         focusColor: Colors.black),
                                    //     validator: (value) {
                                    //       if (value == null || value.isEmpty) {
                                    //         return "The Status is required.";
                                    //       }
                                    //       return null;
                                    //     }),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            if (_image != null) {
                                              controller.fetchData(
                                                  context: context,
                                                  territoryId:
                                                      widget.territoryId,
                                                  tag: "Add Customer");
                                            } else {
                                              // showSnackBar("Alert!!", "Please Upload Profile Picture.", Colors.redAccent);
                                              Get.dialog(
                                                barrierDismissible: true,
                                                Dialog(
                                                  backgroundColor: Colors.white,
                                                  child: WillPopScope(
                                                    onWillPop: () async => true,
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            child: Text(
                                                              "Please Add Profile Picture.",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Get.back();
                                                            },
                                                            child: Center(
                                                              child: Container(
                                                                height: 40,
                                                                width: 60,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                        primaryColor,
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                            Radius.circular(10))),
                                                                child: Text(
                                                                  "Ok",
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16, bottom: 16),
                                            child: Center(
                                                child: controller
                                                        .isLoading.value
                                                    ? Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                        color: Colors.white,
                                                      ))
                                                    : Text(
                                                        "Submit",
                                                        style: TextStyle(
                                                            color: primaryLight,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontFamily:
                                                                'Nunito Sans'),
                                                      )),
                                          ),
                                        ),
                                      ),
                                    )
                                    // Obx(
                                    //   () => controller.isLoading.value
                                    //       ? Center(
                                    //           child:
                                    //               CircularProgressIndicator())
                                    //       : CustomButton(
                                    //           btnName: "Submit",
                                    //           onPressed: () {
                                    //             if (formKey.currentState!
                                    //                 .validate()) {
                                    //               controller.fetchData(
                                    //                   context: context,
                                    //                   territoryId:
                                    //                       widget.territoryId);
                                    //             }
                                    //           },
                                    //         ),
                                    // )
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
