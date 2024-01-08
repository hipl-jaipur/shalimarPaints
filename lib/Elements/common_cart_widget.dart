import 'package:flutter/material.dart';
import 'package:shalimar/utils/colors.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("10011145000900 - She colza Yellow Ral 1021",
                  style: TextStyle(
                      color: blackTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              Text("\u{20B9}410.00/NOS",
                  style: TextStyle(
                      color: blackTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
                      SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price",
                          style: TextStyle(
                              color: blackTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      Text("\u{20B9}410.00/NOS",
                          style: TextStyle(
                              color: blackTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Qty.",
                          style: TextStyle(
                              color: blackTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      Text("4",
                          style: TextStyle(
                              color: blackTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price",
                          style: TextStyle(
                              color: blackTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      Text("\u{20B9}410.00/NOS",
                          style: TextStyle(
                              color: blackTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
