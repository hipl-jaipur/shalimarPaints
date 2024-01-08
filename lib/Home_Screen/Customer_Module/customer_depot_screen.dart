import 'package:flutter/material.dart';
import 'package:shalimar/Elements/common_card_view_widget.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/utils/images.dart';

class MyCustomerDepotPage extends StatefulWidget {
  const MyCustomerDepotPage({super.key});

  @override
  State<MyCustomerDepotPage> createState() => _MyCustomerDepotPageState();
}

class _MyCustomerDepotPageState extends State<MyCustomerDepotPage> {
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
                  
                      searchBar(),
                  
                      SizedBox(
                        height: 20,
                      ),
                  
                      Text("Depot - Chattisgarh",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text("Count: 1",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 20,
                      ),
                      cardList("Depot","Raipur", "", false),
                     
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
