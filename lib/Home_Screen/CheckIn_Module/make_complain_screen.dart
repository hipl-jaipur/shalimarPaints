import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shalimar/Controller/plant_data_controller.dart';
import 'package:shalimar/Controller/product_data_controller.dart';
import 'package:shalimar/Controller/set_customer_complaint_data_controller.dart';
import 'package:shalimar/Controller/subcategory_data_controller.dart';
import 'package:shalimar/Controller/upload_image_controller.dart';
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

//karishma
class ComplainPageState extends State<ComplainPage> {
  PlantDataController plantDataController = Get.put(PlantDataController());
  SubCategoryDataController subCategoryDataController =
      Get.put(SubCategoryDataController());
  ProductDataController productDataController =
      Get.put(ProductDataController());

  SetCustomerComplaintDataController complaintController =
      Get.put(SetCustomerComplaintDataController());

  ImageUploadController uploadImageController =
      Get.put(ImageUploadController());

  TextEditingController searchPlantController = TextEditingController();

  String plantDropdownvalue = 'Plant';
  int plantID = 0;

  String subCatDropdownvalue = 'Sub Category';
  int subCategoryID = 0;

  String productDropdownvalue = 'Product';
  String productCode = "";

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        complaintController.dateController.text =
            '${picked.toLocal()}'.split(' ')[0];
      });
    }
  }

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  void _pickImageBase64() async {
    try {
      // pick image from gallery, change ImageSource.camera if you want to capture image from camera.
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) return;
      // read picked image byte data.
      Uint8List imagebytes = await image!.readAsBytes();
      // using base64 encoder convert image into base64 string.
      String _base64String = base64.encode(imagebytes);
      print("ImageList2: $_base64String");

      final imageTemp = File(image.path);
      print("ImageList1: $imageTemp");
      setState(() {
        this._imageFile =
            imageTemp; // setState to image the UI and show picked image on screen.
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('error');
      }
    }
  }

  final List<File> _images = [];

  // File? _imageFile;
  String? _base64Image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        print("ImageList1: $_imageFile");
        _images.add(_imageFile!);
      });

      String imgpath = pickedFile.path;
      File imgfile = File(imgpath);
      Uint8List imgbytes = await imgfile.readAsBytes();
      String bs4str = base64.encode(imgbytes);
      print("ImageList2: $bs4str");

      // String bs4strr = "/9j/4VG+RXhpZgAATU0AKgAAAAgADQEAAAMAAAABC7gAAAEBAAMAAAABD6AAAAEPAAIAAAAHAAAAqgEQAAIAAAALAAAAsgESAAMAAAABAAEAAAEaAAUAAAABAAAAvgEbAAUAAAABAAAAxgEoAAMAAAABAAIAAAEyAAIAAAAUAAAAzgITAAMAAAABAAEAAIdpAAQAAAABAAAA6poAAAIAAAAHAAAA4oglAAQAAAABAAADAgAAA+BYaWFvbWkAAE0yMDEySzExQUkAAAAAAEgAAAABAAAASAAAAAEyMDI0OjAxOjEyIDE2OjE0OjU5AE1pIDExWAAAAB+CmgAFAAAAAQAAAmSCnQAFAAAAAQAAAmyIIgADAAAAAQACAACIJwADAAAAAQE+AACQAAAHAAAABDAyMjCQAwACAAAAFAAAAnSQBAACAAAAFAAAAoiRAQAHAAAABAECAwCSAQAKAAAAAQAAApySAgAFAAAAAQAAAqSSAwAKAAAAAQAAAqySBAAKAAAAAQAAArSSBQAFAAAAAQAAArySBwADAAAAAQACAACSCAADAAAAAQAVAACSCQADAAAAAQAQAACSCgAFAAAAAQAAAsSSkAACAAAABwAAAsySkQACAAAABwAAAtSSkgACAAAABwAAAtygAAAHAAAABDAxMDCgAQADAAAAAQABAACgAgAEAAAAAQAAC7igAwAEAAAAAQAAD6CgBQAEAAAAAQAAAuOiFwADAAAAAQABAACjAQABAAAAAQEAAACkAgADAAAAAQAAAACkAwADAAAAAQAAAACkBQADAAAAAQAZAACkBgADAAAAAQAAAAAAAAAAAAAAAQAAADIAAACzAAAAZDIwMjQ6MDE6MTIgMTY6MTQ6NTkAMjAyNDowMToxMiAxNjoxNDo1OQAAABYLAAAD6AAAAKcAAABk////wwAAAGQAAAAAAAAABgAAAKcAAABkAAASZgAAA+gwNjMwMjEAADA2MzAyMQAAMDYzMDIxAAACAAEAAgA";
      Uint8List decodedbytes = base64.decode(bs4str);
      File decodedimgfile = await File("image.jpg").writeAsBytes(decodedbytes);
      String decodedpath = decodedimgfile.path;
      print("ImageList2: $decodedpath");

      // var image = imageToBase64(_imageFile!.path);

      // print("ImageList2: $image");

      // Uint8List bytes = _imageFile!.readAsBytesSync();
      // String base64Image = base64Encode(bytes);
      // print("ImageList2: $base64Image");

      // getUint8ListFromFile(_imageFile!);

      // final bytes = io.File(pickedFile.path).readAsBytesSync();
      // String img64 = base64Encode(bytes);
      // print("ImageList2: $img64");

      //  uploadImageController.fetchData(img64, "jpg");

      //convert Path to File
      // Uint8List imagebytes = await _imageFile!.readAsBytes(); //convert to bytes
      // String base64string = base64.encode(imagebytes);
      // print("ImageList2: $base64string");
      // Uint8List decodedbytes = base64.decode(base64string);
      // print("ImageList3: $decodedbytes");

      // Uint8List _bytes = await _imageFile!.readAsBytes();
      // String base64String = base64.encode(_bytes);
      // print("ImageList2 : $base64String");

      // List<int> imageBytes = File(pickedFile.path).readAsBytesSync();
      // print(imageBytes);
      // String base64Image = base64Encode(imageBytes);
      // print("ImageList2: $base64Image");

      // final bytes = File(pickedFile.path).readAsBytesSync();
      // String _base64Image = "data:image/png;base64," + base64Encode(bytes);

      // print("ImageList3 : $_base64Image");

      // _convertImageToBase64();
    }
  }

  String imageToBase64(String imageUrl) {
    // Fetch the image as bytes
    Uint8List bytes =
        Uint8List.fromList(List<int>.generate(200, (index) => index));

    // Encode bytes to base64
    String base64Encoded = base64Encode(bytes);
    return base64Encoded;
  }

  Future<Uint8List> getUint8ListFromFile(File picture) async {
    List<int> imageBase64 = picture.readAsBytesSync();
    String imageAsString = base64Encode(imageBase64);
    Uint8List uint8list = base64.decode(imageAsString);
    print("ImageList0 : $uint8list");
    print("ImageList00 : $imageAsString");
    return uint8list;
  }

  Future<void> _convertImageToBase64() async {
    if (_imageFile == null) {
      return;
    }

    final bytes = await _imageFile!.readAsBytes();
    final base64String = base64Encode(bytes);

    setState(() {
      _base64Image = base64String;
      print("ImageList2: $_base64Image");
    });
  }

  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker()
  //         .pickImage(source: ImageSource.camera, imageQuality: 24);
  //     if (image == null) return;
  //     final imageTemp = XFile(image.path);
  //     print("ImageList1: ${image.path}");

  //     setState(() {
  //       // _images.add(imageTemp);
  //       final _imageFile = File(image.path);
  //       print("ImageList2: $imageTemp");
  //       // print("ImageList3: $_images");
  //       print("ImageList4: ${_imageFile}");
  //       // _images.add(_imageFile);
  //     });
  //     _convertImageToBase64();
  //   } on PlatformException catch (e) {
  //     if (kDebugMode) {
  //       print('Failed to pick image: $e');
  //     }
  //   }
  // }

  // Future<void> _convertImageToBase64() async {
  //   if (_imageFile == null) {
  //     return;
  //   }

  //   final bytes = await _imageFile!.readAsBytes();
  //   final image = img.decodeImage(Uint8List.fromList(bytes));

  //   // List<int> imageBytes = widget.fileData.readAsBytesSync();
  //   // print(imageBytes);
  //   // String base64Image = base64Encode(imageBytes);

  //   if (image != null) {
  //     final base64String =
  //         base64Encode(Uint8List.fromList(img.encodePng(image)));
  //     setState(() {
  //       _base64Image = base64String;
  //       print("ImageList5: ${_base64Image}");
  //     });
  //   }
  // }

  final _formKey = GlobalKey<FormState>();

  final GlobalKey _autocompleteKey = GlobalKey();
  final GlobalKey _plantAutocompleteKey = GlobalKey();
  final FocusNode _textFieldFocusNode1 = FocusNode();
  final FocusNode _textFieldFocusNode2 = FocusNode();
  final FocusNode _textFieldFocusNodePlant = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _plantEditingController = TextEditingController();
  static String _displayStringForOption(dynamic option) =>
      option.subcategoryName.toString();
  static String _plantDisplayStringForOption(dynamic option) =>
      option.subcategoryName.toString();

  List<dynamic>? subCategoryList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subCategoryList = subCategoryDataController.subCategoryList.value[0];
    print("subList: $subCategoryList");
    // subCategoryDataController.subCategoryList;
    // print(subCategoryDataController.subCategoryList);
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
              child: Obx(
                () => productDataController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
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
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
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
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            // SizedBox(
                                            //   height: 20,
                                            // ),
                                            // LayoutBuilder(
                                            //   builder: (context, constraints) =>
                                            //       RawAutocomplete<SubCategory>(
                                            //     focusNode: _textFieldFocusNode1,
                                            //     key: _autocompleteKey,
                                            //     textEditingController:
                                            //         _textEditingController,
                                            //     optionsViewBuilder: (context,
                                            //             onSelected, options) =>
                                            //         Align(
                                            //       alignment: Alignment.topLeft,
                                            //       child: Material(
                                            //         shape:
                                            //             const RoundedRectangleBorder(
                                            //           borderRadius:
                                            //               BorderRadius.vertical(
                                            //                   bottom: Radius
                                            //                       .circular(
                                            //                           4.0)),
                                            //         ),
                                            //         child: Container(
                                            //           height:
                                            //               52.0 * options.length,
                                            //           width: constraints.biggest
                                            //               .width, // <-- Right here !
                                            //           child: ListView.builder(
                                            //             padding:
                                            //                 EdgeInsets.zero,
                                            //             itemCount:
                                            //                 options.length,
                                            //             shrinkWrap: false,
                                            //             itemBuilder:
                                            //                 (BuildContext
                                            //                         context,
                                            //                     int index) {
                                            //               final SubCategory
                                            //                   option =
                                            //                   options.elementAt(
                                            //                       index);
                                            //               return InkWell(
                                            //                 onTap: () => {
                                            //                   onSelected(
                                            //                       option),
                                            //                   _textFieldFocusNode2
                                            //                       .requestFocus(),
                                            //                 },
                                            //                 child: Padding(
                                            //                   padding:
                                            //                       const EdgeInsets
                                            //                           .all(
                                            //                           16.0),
                                            //                   child: Text(option
                                            //                       .subcategoryName
                                            //                       .toString()),
                                            //                 ),
                                            //               );
                                            //             },
                                            //           ),
                                            //         ),
                                            //       ),
                                            //     ),
                                            //     displayStringForOption:
                                            //         _displayStringForOption,
                                            //     fieldViewBuilder:
                                            //         (BuildContext context,
                                            //             TextEditingController
                                            //                 controller,
                                            //             FocusNode focusNode,
                                            //             VoidCallback
                                            //                 onFieldSubmitted) {
                                            //       return TextFormField(
                                            //         autovalidateMode:
                                            //             AutovalidateMode
                                            //                 .onUserInteraction,
                                            //         textInputAction:
                                            //             TextInputAction.next,
                                            //         validator: (value) {
                                            //           if (value == null ||
                                            //               value.isEmpty) {
                                            //             return "The Sub Category Name is required.";
                                            //           }
                                            //           return null;
                                            //         },
                                            //         onChanged: (value) {
                                            //           // setState(() {
                                            //           //   hideError = false;
                                            //           // }
                                            //           // );
                                            //         },
                                            //         decoration: InputDecoration(
                                            //           contentPadding:
                                            //               const EdgeInsets
                                            //                   .fromLTRB(20.0,
                                            //                   0.0, 20.0, 0.0),
                                            //           border:
                                            //               const OutlineInputBorder(),
                                            //           focusedBorder:
                                            //               const OutlineInputBorder(
                                            //                   borderRadius:
                                            //                       BorderRadius
                                            //                           .all(Radius
                                            //                               .circular(
                                            //                                   3)),
                                            //                   borderSide:
                                            //                       BorderSide(
                                            //                     color: Colors
                                            //                         .black,
                                            //                   )),
                                            //           disabledBorder:
                                            //               const OutlineInputBorder(
                                            //                   borderRadius:
                                            //                       BorderRadius
                                            //                           .all(Radius
                                            //                               .circular(
                                            //                                   3)),
                                            //                   borderSide:
                                            //                       BorderSide(
                                            //                     color: Color(
                                            //                         0xffECE6E6),
                                            //                   )),
                                            //           enabledBorder:
                                            //               const OutlineInputBorder(
                                            //                   borderRadius:
                                            //                       BorderRadius
                                            //                           .all(Radius
                                            //                               .circular(
                                            //                                   5)),
                                            //                   borderSide:
                                            //                       BorderSide(
                                            //                     color: Colors
                                            //                         .black,
                                            //                   )),
                                            //           labelText: 'Sub Category',
                                            //           labelStyle:
                                            //               const TextStyle(
                                            //                   color: Color(
                                            //                       0xff0A2540)),
                                            //           hintText: "Sub Category",
                                            //         ),
                                            //         controller:
                                            //             _textEditingController,
                                            //         focusNode: focusNode,
                                            //         onFieldSubmitted:
                                            //             (String value) {
                                            //           onFieldSubmitted();
                                            //         },
                                            //       );
                                            //     },
                                            //     optionsBuilder:
                                            //         (TextEditingValue
                                            //             textEditingValue) {
                                            //       if (textEditingValue.text ==
                                            //           '') {
                                            //         return const Iterable<
                                            //             SubCategory>.empty();
                                            //       }

                                            //       debugPrint(
                                            //           'subCategoryList: ${subCategoryList}');
                                            //       List<SubCategory>
                                            //           _userOptions = [];
                                            //       for (var str
                                            //           in subCategoryList!) {
                                            //         if (str.subcategoryName!
                                            //             .toLowerCase()
                                            //             .contains(textEditingValue
                                            //                 .text
                                            //                 .toLowerCase())) {
                                            //           _userOptions.add(SubCategory(
                                            //               subCategoryID:
                                            //                   str.subCategoryID,
                                            //               subcategoryName: str
                                            //                   .subcategoryName));
                                            //         }
                                            //       }
                                            //       debugPrint(
                                            //           'productList: $_userOptions');
                                            //       return _userOptions;
                                            //     },
                                            //     onSelected:
                                            //         (SubCategory selection) {
                                            //       debugPrint(
                                            //           'You just selected $selection');
                                            //       // cont.productIdController
                                            //       //         .text =
                                            //       //     selection.subCategoryID
                                            //       //         .toString();
                                            //       // debugPrint(
                                            //       //     'You just selected productName id: ${cont.productIdController.text}');
                                            //     },
                                            //   ),
                                            // ),
                                            DropdownButtonFormField<
                                                SubCategory>(
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                border: OutlineInputBorder(),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    3)),
                                                        borderSide: BorderSide(
                                                          color: Colors.black,
                                                        )),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .black), //<-- SEE HERE
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.categoryName!
                                                        .isEmpty) {
                                                  return "The Subcategory Name is required.";
                                                }
                                                return null;
                                              },
                                              isExpanded: true,
                                              // Initial Value
                                              // value: ,
                                              hint: subCatDropdownvalue == "" ||
                                                      subCatDropdownvalue ==
                                                          null
                                                  ? Text("Sub Category")
                                                  : Text(subCatDropdownvalue),
                                              // Down Arrow Icon
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),

                                              // Array list of items
                                              items:
                                                  // [
                                                  //   DropdownMenuItem<SubCategory>(
                                                  //     value: "",
                                                  //     child: TextFormField(
                                                  //       controller:
                                                  //           searchPlantController,
                                                  //       decoration: InputDecoration(
                                                  //         contentPadding:
                                                  //             const EdgeInsets
                                                  //                 .fromLTRB(20.0,
                                                  //                 0.0, 20.0, 0.0),
                                                  //         focusedBorder:
                                                  //             OutlineInputBorder(
                                                  //                 borderRadius:
                                                  //                     BorderRadius
                                                  //                         .all(Radius
                                                  //                             .circular(
                                                  //                                 3)),
                                                  //                 borderSide:
                                                  //                     BorderSide(
                                                  //                   color: Colors
                                                  //                       .black,
                                                  //                 )),
                                                  //         enabledBorder:
                                                  //             OutlineInputBorder(
                                                  //           borderSide: BorderSide(
                                                  //               color:
                                                  //                   Colors.black),
                                                  //         ),
                                                  //         labelText: 'Search Plant',
                                                  //         labelStyle: TextStyle(
                                                  //             color: Colors.black),
                                                  //         border:
                                                  //             OutlineInputBorder(),
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  //   // for (String option in subCategoryDataController.subCategoryList)
                                                  //   //   DropdownMenuItem<SubCategory>(
                                                  //   //     value: option,
                                                  //   //     child: option
                                                  //   //             .toLowerCase()
                                                  //   //             .contains(
                                                  //   //                 searchPlantController
                                                  //   //                     .text
                                                  //   //                     .toLowerCase())
                                                  //   //         ? Text(option)
                                                  //   //         : SizedBox(),
                                                  //   //   ),
                                                  //   subCategoryDataController
                                                  //       .subCatagoryDataModel!.data!
                                                  //       .map((SubCategory option) {
                                                  //     return DropdownMenuItem<
                                                  //         SubCategory>(
                                                  //       value: option,
                                                  //       child: Text(option
                                                  //           .subcategoryName
                                                  //           .toString()),
                                                  //     );
                                                  //   }).toList(),
                                                  // ],

                                                  subCategoryDataController
                                                      .subCatagoryDataModel!
                                                      .data!
                                                      .map(
                                                          (SubCategory option) {
                                                return DropdownMenuItem<
                                                    SubCategory>(
                                                  value: option,
                                                  child: Text(option
                                                      .subcategoryName
                                                      .toString()),
                                                );
                                              }).toList(),

                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (val) {
                                                subCategoryID =
                                                    val!.subCategoryID!.toInt();
                                                print(
                                                    "subCategory ID: $subCategoryID");
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
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    3)),
                                                        borderSide: BorderSide(
                                                          color: Colors.black,
                                                        )),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .black), //<-- SEE HERE
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.productcategoryname!
                                                        .isEmpty) {
                                                  return "The Product is required.";
                                                }
                                                return null;
                                              },
                                              isExpanded: true,
                                              // Initial Value
                                              // value: ,
                                              hint: productDropdownvalue ==
                                                          "" ||
                                                      productDropdownvalue ==
                                                          null
                                                  ? Text("Product")
                                                  : Text(productDropdownvalue),
                                              // Down Arrow Icon
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),

                                              // Array list of items
                                              items: productDataController
                                                          .productDataModel !=
                                                      null
                                                  ? productDataController
                                                      .productDataModel!.data!
                                                      .map((Product option) {
                                                      return DropdownMenuItem<
                                                          Product>(
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
                                                print(
                                                    "productCode: $productCode");
                                                setState(() {});
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              controller: complaintController
                                                  .batchNumberController,
                                              enabled: true,
                                              maxLines: 1,
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  border: OutlineInputBorder(),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          3)),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.black,
                                                          )),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .black), //<-- SEE HERE
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  hintText:
                                                      "Enter Batch Number",
                                                  hintStyle: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  labelText:
                                                      "Enter Batch Number",
                                                  labelStyle: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  focusColor: Colors.black),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return "The Batch Number is required.";
                                                }
                                                return null;
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),

                                            LayoutBuilder(
                                              builder: (context, constraints) =>
                                                  RawAutocomplete<Data>(
                                                focusNode:
                                                    _textFieldFocusNodePlant,
                                                key: _plantAutocompleteKey,
                                                textEditingController:
                                                    _plantEditingController,
                                                optionsViewBuilder: (context,
                                                        onSelected, options) =>
                                                    Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Material(
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              bottom: Radius
                                                                  .circular(
                                                                      4.0)),
                                                    ),
                                                    child: Container(
                                                      height:
                                                          52.0 * options.length,
                                                      width: constraints.biggest
                                                          .width, // <-- Right here !
                                                      child: ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        itemCount:
                                                            options.length,
                                                        shrinkWrap: false,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          final Data option =
                                                              options.elementAt(
                                                                  index);
                                                          return InkWell(
                                                            onTap: () => {
                                                              onSelected(
                                                                  option),
                                                              _textFieldFocusNode2
                                                                  .requestFocus(),
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      16.0),
                                                              child: Text(option
                                                                  .plantname
                                                                  .toString()),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                displayStringForOption:
                                                    _plantDisplayStringForOption,
                                                fieldViewBuilder:
                                                    (BuildContext context,
                                                        TextEditingController
                                                            controller,
                                                        FocusNode focusNode,
                                                        VoidCallback
                                                            onFieldSubmitted) {
                                                  return TextFormField(
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return "The Plant Name is required.";
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      // setState(() {
                                                      //   hideError = false;
                                                      // }
                                                      // );
                                                    },
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .fromLTRB(20.0,
                                                              0.0, 20.0, 0.0),
                                                      border:
                                                          const OutlineInputBorder(),
                                                      focusedBorder:
                                                          const OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              3)),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                      disabledBorder:
                                                          const OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              3)),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xffECE6E6),
                                                              )),
                                                      enabledBorder:
                                                          const OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              5)),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                      labelText: 'Plant',
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: Color(
                                                                  0xff0A2540)),
                                                      hintText: "Plant",
                                                    ),
                                                    controller:
                                                        _plantEditingController,
                                                    focusNode: focusNode,
                                                    onFieldSubmitted:
                                                        (String value) {
                                                      onFieldSubmitted();
                                                    },
                                                  );
                                                },
                                                optionsBuilder:
                                                    (TextEditingValue
                                                        textEditingValue) {
                                                  if (textEditingValue.text ==
                                                      '') {
                                                    return const Iterable<
                                                        Data>.empty();
                                                  }

                                                  debugPrint(
                                                      'PlantList: ${plantDataController.plantList}');
                                                  List<Data> _userOptions = [];
                                                  for (var str
                                                      in plantDataController
                                                          .plantList) {
                                                    if (str.plantname!
                                                        .toLowerCase()
                                                        .contains(textEditingValue
                                                            .text
                                                            .toLowerCase())) {
                                                      _userOptions.add(Data(
                                                          plantid: str.plantid,
                                                          plantname:
                                                              str.plantname));
                                                    }
                                                  }
                                                  debugPrint(
                                                      'plantList: $_userOptions');
                                                  return _userOptions;
                                                },
                                                onSelected: (Data selection) {
                                                  debugPrint(
                                                      'You just selected $selection');
                                                  // cont.productIdController
                                                  //         .text =
                                                  //     selection.subCategoryID
                                                  //         .toString();
                                                  // debugPrint(
                                                  //     'You just selected productName id: ${cont.productIdController.text}');
                                                },
                                              ),
                                            ),

                                            SizedBox(height: 20),
                                            DropdownButtonFormField<Data>(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.plantname!.isEmpty) {
                                                  return "The Plant is required.";
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                border: OutlineInputBorder(),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    3)),
                                                        borderSide: BorderSide(
                                                          color: Colors.black,
                                                        )),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .black), //<-- SEE HERE
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
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
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),

                                              // Array list of items
                                              items:

                                                  // [
                                                  //   DropdownMenuItem<String>(
                                                  //     value: 'Other',
                                                  //     child:
                                                  // TextFormField(
                                                  //       controller: searchPlantController,
                                                  //       decoration: InputDecoration(
                                                  //         contentPadding:
                                                  //             const EdgeInsets.fromLTRB(
                                                  //                 20.0, 0.0, 20.0, 0.0),
                                                  //         focusedBorder:
                                                  //             OutlineInputBorder(
                                                  //                 borderRadius:
                                                  //                     BorderRadius.all(
                                                  //                         Radius.circular(
                                                  //                             3)),
                                                  //                 borderSide: BorderSide(
                                                  //                   color: Colors.black,
                                                  //                 )),
                                                  //         enabledBorder:
                                                  //             OutlineInputBorder(
                                                  //           borderSide: BorderSide(
                                                  //               color: Colors.black),
                                                  //         ),
                                                  //         labelText: 'Search Plant',
                                                  //         labelStyle: TextStyle(
                                                  //             color: Colors.black),
                                                  //         border: OutlineInputBorder(),
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  //   for (String option in plantList)
                                                  //     DropdownMenuItem<String>(
                                                  //       value: option,
                                                  //       child: option
                                                  //               .toLowerCase()
                                                  //               .contains(
                                                  //                   searchPlantController
                                                  //                       .text
                                                  //                       .toLowerCase())
                                                  //           ? Text(option)
                                                  //           : SizedBox(),
                                                  //     ),
                                                  // ],

                                                  plantDataController
                                                      .plantDataModel!.data!
                                                      .map((Data option) {
                                                return DropdownMenuItem<Data>(
                                                  value: option,
                                                  child: Text(option.plantname
                                                      .toString()),
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
                                                  border: Border.all(
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              width: double.infinity,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: SizedBox(
                                                    height: 100.0,
                                                    child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            _images.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: Image.file(
                                                              fit: BoxFit.fill,
                                                              File(
                                                                  _images[index]
                                                                      .path),
                                                              height: 100,
                                                              width: 80,
                                                            ),
                                                          );
                                                        }),
                                                  )),
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.add_box_rounded,
                                                      size: 80,
                                                    ),
                                                    onPressed: () {
                                                      // _pickImage;
                                                      // _pickImage();
                                                      _pickImageBase64();
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
                                              controller: complaintController
                                                  .dateController,
                                              readOnly: true,
                                              onChanged: (value) {
                                                setState(() {
                                                  "${selectedDate.toLocal()}"
                                                      .split(' ')[0];
                                                });
                                              },
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return "The Manufacture Date is required.";
                                                }
                                                return null;
                                              },
                                              enabled: true,
                                              maxLines: 1,
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons
                                                      .calendar_month),
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  border: OutlineInputBorder(),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          3)),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.black,
                                                          )),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .black), //<-- SEE HERE
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  hintText:
                                                      "Manufacturing Date",
                                                  hintStyle: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  labelText:
                                                      "Manufacturing Date",
                                                  labelStyle: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  focusColor: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              controller: complaintController
                                                  .damagedQtyController,
                                              enabled: true,
                                              maxLines: 1,
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  border: OutlineInputBorder(),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          3)),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.black,
                                                          )),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .black), //<-- SEE HERE
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
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
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return "The Damaged Qty is required.";
                                                }
                                                return null;
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              controller: complaintController
                                                  .descriptionController,
                                              enabled: true,
                                              maxLines: 2,
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          20.0,
                                                          40.0,
                                                          20.0,
                                                          0.0),
                                                  border: OutlineInputBorder(),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          3)),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.black,
                                                          )),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .black), //<-- SEE HERE
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
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
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return "The Description is required.";
                                                }
                                                return null;
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            CustomButton(
                                              btnName: "Submit",
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  complaintController.fetchData(
                                                      SubCategoryID:
                                                          subCategoryID,
                                                      ProductCode: productCode,
                                                      PlantID: plantID,
                                                      CustomerCode:
                                                          Get.arguments,
                                                      context: context);
                                                }
                                              },
                                            )
                                          ]),
                                    ),
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
            )
          ],
        ),
      ),
    );
  }
}
