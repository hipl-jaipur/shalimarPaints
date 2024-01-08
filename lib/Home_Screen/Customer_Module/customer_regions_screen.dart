import 'package:flutter/material.dart';
import 'package:shalimar/Elements/common_card_view_widget.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/utils/images.dart';

class MyCustomerRegionsPage extends StatefulWidget {
  const MyCustomerRegionsPage({super.key});

  @override
  State<MyCustomerRegionsPage> createState() => _MyCustomerRegionsPageState();
}

class _MyCustomerRegionsPageState extends State<MyCustomerRegionsPage> {
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
                  
                      Text("Regions - East",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text("Count: 4",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 20,
                      ),
                      cardList("Region","Kerla", "Anindya Banerjee (General Manager)", false),
                      cardList("Region","Karnataka", "Anindya Banerjee (General Manager)",false),
                      cardList("Region","Tamilnadu", "Anindya Banerjee (General Manager)",false),
                      cardList("Region","Telangana", "Anindya Banerjee (General Manager)",false),
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
