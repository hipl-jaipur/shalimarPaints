import 'package:flutter/material.dart';
import 'package:shalimar/utils/colors.dart';

class TakeOrderList extends StatefulWidget {
  int index;
  TakeOrderList({super.key, required this.index, });

  @override
  State<TakeOrderList> createState() => _TakeOrderListState();
}

class _TakeOrderListState extends State<TakeOrderList> {
  int counter = 0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        setState(() {
                          // widget.isVisible = true;
                          if (counter != 0) {
                            counter--;
                          }
                        });
                      },
                      color: primaryColor),
                  Text(counter.toString()),
                  IconButton(
                    icon: Icon(Icons.add_circle),
                    color: primaryColor,
                    onPressed: () {
                      setState(() {
                        // widget.isVisible = true;
                        counter++;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            insetPadding: EdgeInsets.zero,
                            contentPadding: EdgeInsets.zero,
                            content: Container(
                              width: 300,
                              height: 200,
                              color: primaryLight,
                              padding: const EdgeInsets.only(
                                  top: 12, left: 12, right: 12, bottom: 12),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(
                                                Icons.highlight_remove_sharp))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Stock Updated On",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                        Text("01/05/2024",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Availabe Stock",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                        Text("5",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Last Order",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                        Text("100",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Open Order",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                        Text("x",
                                            style: TextStyle(
                                                color: blackTextColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.info,
                        color: primaryColor,
                      )),
                  Text("Available Stock: 5"),
                  Text("Last Order: 100")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
