import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/utils/colors.dart';

Widget searchBar(TextEditingController searchController) {
  return TextField(
                              controller: searchController,
                              textInputAction: TextInputAction.search,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 0.0, 20.0, 0.0),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                      color: Color(0xffECE6E6),
                                    )),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                      color: Color(0xffECE6E6),
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                      color: Color(0xffECE6E6),
                                    )),
                                hintText: 'Search',
                                prefixIcon: IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(
                                      Icons.arrow_circle_left,
                                      color: primaryColor,
                                      size: 40,
                                    )),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.sort_rounded,
                                      color: primaryColor,
                                      size: 40,
                                    )),
                              ),
                            );
  
  
  //  SearchBar(
  //     hintText: "Search",
  //     controller: searchController,
  //     onChanged: (value) {
        
  //     },
  //     leading: IconButton(
  //         onPressed: () {
  //           Get.back();
  //         },
  //         icon: Icon(
  //           Icons.arrow_circle_left,
  //           color: primaryColor,
  //           size: 40,
  //         )),
  //     trailing: [
  //       IconButton(
  //           onPressed: () {},
  //           icon: Icon(
  //             Icons.sort_rounded,
  //             color: primaryColor,
  //             size: 40,
  //           )),
  //     ]);
}
