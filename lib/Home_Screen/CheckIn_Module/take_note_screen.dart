import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/set_customer_note_data_controller.dart';
import 'package:shalimar/Elements/common_button_widget.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class TakeNotePage extends StatefulWidget {
  const TakeNotePage({super.key});

  @override
  State<TakeNotePage> createState() => _TakeNotePageState();
}

class _TakeNotePageState extends State<TakeNotePage> {
  SetCustomerNoteDataController setNoteController =
      Get.put(SetCustomerNoteDataController());
  final _formKey = GlobalKey<FormState>();
  var customerProfile = Get.arguments;

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
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    customerProfile[0],
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    customerProfile[1],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    customerProfile[2],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                            child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller:
                                        setNoteController.noteController,
                                    maxLines: 5,
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
                                        hintText: "Enter Note",
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        labelText: "Enter Notes",
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        focusColor: Colors.black),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter Note.";
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
                                      if (_formKey.currentState!.validate()) {
                                        setNoteController.fetchData(
                                            levelCode: customerProfile[1],
                                            context: context);
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))
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
