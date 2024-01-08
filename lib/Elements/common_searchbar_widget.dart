import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/utils/colors.dart';

Widget searchBar() {
  return SearchBar(
      hintText: "Search",
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_circle_left,
            color: primaryColor,
            size: 40,
          )),
      trailing: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.sort_rounded,
              color: primaryColor,
              size: 40,
            )),
      ]);
}
