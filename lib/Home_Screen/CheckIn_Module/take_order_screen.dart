import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Elements/common_order-widget.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/cart_screen.dart';
import 'package:shalimar/utils/images.dart';

class TakeOrderPage extends StatefulWidget {
  const TakeOrderPage({super.key});

  @override
  State<TakeOrderPage> createState() => _TakeOrderPageState();
}

class _TakeOrderPageState extends State<TakeOrderPage> {
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
                      searchBar(),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return TakeOrderList(
                            index: index,
                          );
                        },
                      )),
                      Visibility(
                        visible: true,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(MyCartPage());
                          },
                          child: Container(
                            height: 50,
                            child: Center(child: Text("(4) CONTINUE \u{20B9}1000")),
                          ),
                        ),
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
