import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/Elements/common_cart_widget.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/checkin_screen.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
    final TextEditingController _searchController = TextEditingController();

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
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return CartList();
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
                                showSnackBar("Success", "Create Successfully",
                                    Colors.greenAccent);
                                Get.off(CheckInPage());
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
                                    "Placed order \u{20B9}4522",
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
