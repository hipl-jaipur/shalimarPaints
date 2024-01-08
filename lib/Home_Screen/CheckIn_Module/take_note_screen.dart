import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Elements/common_button_widget.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class TakeNotePage extends StatefulWidget {
  const TakeNotePage({super.key});

  @override
  State<TakeNotePage> createState() => _TakeNotePageState();
}

class _TakeNotePageState extends State<TakeNotePage> {
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
                          children: [
                           
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Balaji Traders",
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Govt. School Near Village Samogarbayana, Bharatpur",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
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
                                      TextFormField(
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
                                                  color: Colors
                                                      .black), //<-- SEE HERE
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
