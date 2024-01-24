import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shalimar/Elements/common_button_widget.dart';
import 'package:shalimar/utils/images.dart';

import '../../Controller/payment_controller.dart';
import '../../Controller/set_activity_detail_data_controller.dart';
import '../../Controller/set_customer_complaint_data_controller.dart';
import '../../Elements/timer_widget.dart';
import '../../Model/PaymentTypeModel.dart';

class CollectPaymentPage extends StatefulWidget {
  const CollectPaymentPage({super.key});

  @override
  State<CollectPaymentPage> createState() => _CollectPaymentPageState();
}

class _CollectPaymentPageState extends State<CollectPaymentPage> {
  String plantDropdownvalue = 'Payment Type';
  final paymentFormKey = GlobalKey<FormState>();

  PaymentController paymentController = Get.put(PaymentController());
  File? _image;
  final picker = ImagePicker();
  SetCustomerComplaintDataController complaintController =
  Get.put(SetCustomerComplaintDataController());
  Future getImageFromCamera() async {
    final pickedFile = await  ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 25,
        maxHeight: 480,
        maxWidth: 640);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
    complaintController.uploadFileChunked(_image!.path).then((value) {
paymentController.imagsPayment=value['Data'];
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
             child: GetBuilder<SetActivityDetailDataController>(
               init: SetActivityDetailDataController(),
               builder: (setActivityController) {
                 return  Obx(() =>  Stack(
                   children: [
                     Padding(
                         padding: const EdgeInsets.all(18.0),
                         child:paymentController.isLoading.value?Center(child: CircularProgressIndicator()): SingleChildScrollView(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               SizedBox(
                                 height: setActivityController.checkIn
                                     ? 40
                                     : 10,
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
                                         child: Form(
                                           key: paymentFormKey,
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text(
                                                 "Mode of Payment",
                                               ),
                                               SizedBox(
                                                 height: 10,
                                               ),

                                               DropdownButtonFormField<Data>(
                                                 validator: (value) {
                                                   if (value == null ||
                                                       value.paymentType!
                                                           .isEmpty) {
                                                     return "The Payment Type is required.";
                                                   }
                                                   return null;
                                                 },
                                                 decoration: InputDecoration(
                                                   contentPadding:
                                                   const EdgeInsets
                                                       .fromLTRB(20.0, 0.0,
                                                       20.0, 0.0),
                                                   border:
                                                   OutlineInputBorder(),
                                                   focusedBorder:
                                                   OutlineInputBorder(
                                                       borderRadius:
                                                       BorderRadius
                                                           .all(Radius
                                                           .circular(
                                                           3)),
                                                       borderSide:
                                                       BorderSide(
                                                         color:
                                                         Colors.black,
                                                       )),
                                                   enabledBorder:
                                                   OutlineInputBorder(
                                                     borderSide: BorderSide(
                                                         color: Colors.black),
                                                     //<-- SEE HERE
                                                     borderRadius:
                                                     BorderRadius.circular(
                                                         5.0),
                                                   ),
                                                 ),
                                                 isExpanded: true,
                                                 // Initial Value
                                                 // value: ,
                                                 hint: plantDropdownvalue ==
                                                     "" ||
                                                     plantDropdownvalue ==
                                                         null
                                                     ? Text("Payment Type")
                                                     : Text(
                                                     plantDropdownvalue),
                                                 // Down Arrow Icon
                                                 icon: const Icon(Icons
                                                     .keyboard_arrow_down),

                                                 // Array list of items
                                                 items:



                                                 paymentController
                                                     .paymentTypeModel!.data!
                                                     .map((Data option) {
                                                   return DropdownMenuItem<
                                                       Data>(
                                                     value: option,
                                                     child: Text(option
                                                         .paymentType
                                                         .toString()),
                                                   );
                                                 }).toList(),

                                                 // After selecting the desired option,it will
                                                 // change button value to selected value
                                                 onChanged: (val) {
                                                   paymentController.paymentIdController =
                                                       val!.paymentTypeID;
                                                   print("Payment ID: ${paymentController.paymentIdController}");
                                                   setState(() {});
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
                                                   controller:  paymentController.referenceNumberController,
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
                                                   validator: (value) {
                                                     if (value == null ||
                                                         value.isEmpty) {
                                                       return "The Reference Number is required.";
                                                     }
                                                     return null;
                                                   }
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
                                                   controller:  paymentController.amountController,

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
                                                       hintText: "\u{20B9}XXX",
                                                       hintStyle: TextStyle(
                                                         color: Colors.black,
                                                       ),
                                                       labelText: "Enter Amount",
                                                       labelStyle: TextStyle(
                                                         color: Colors.black,
                                                       ),
                                                       focusColor: Colors.black),
                                                   validator: (value) {
                                                     if (value == null ||
                                                         value.isEmpty) {
                                                       return "The Amount is required.";
                                                     }
                                                     return null;
                                                   }
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
                                                 child: Row(
                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                   children: [
                                                     IconButton(
                                                       icon: Icon(
                                                         Icons.add_box_rounded,
                                                         size: 80,
                                                       ),
                                                       onPressed: () {
                                                         getImageFromCamera();
                                                       },
                                                     ),
                                                     _image == null ? Text('No Image selected') : Image.file(_image!,height: 100,),
                                                     SizedBox(width: 20,)
                                                   ],
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
                                                   controller:  paymentController.remarkController,

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
                                                   validator: (value) {
                                                     if (value == null ||
                                                         value.isEmpty) {
                                                       return "The Remark is required.";
                                                     }
                                                     return null;
                                                   }
                                               ),
                                               SizedBox(
                                                 height: 20,
                                               ),
                                               CustomButton(
                                                 btnName: "Submit",
                                                 onPressed: () {
                                                   if (paymentFormKey.currentState!
                                                       .validate()) {
                                                     paymentController.setPayment(context: context, customerCode: Get.arguments,);
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
                     Positioned(
                         child: Visibility(
                             visible: setActivityController.checkIn,
                             child: TimerWidget())),
                   ],
                 )); },),
           ),
          ],
        ),
      ),
    );
  }
}
