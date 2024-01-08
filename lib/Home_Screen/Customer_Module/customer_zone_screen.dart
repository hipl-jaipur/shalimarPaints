import 'package:flutter/material.dart';
import 'package:shalimar/Elements/common_card_view_widget.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/utils/images.dart';

class MyCustomerZonePage extends StatefulWidget {
  const MyCustomerZonePage({super.key});

  @override
  State<MyCustomerZonePage> createState() => _MyCustomerZonePageState();
}

class _MyCustomerZonePageState extends State<MyCustomerZonePage> {
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
                  
                      Text("Zones",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text("Count: 5",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 20,
                      ),
                      cardList( "Zone","East", "Anindya Banerjee (General Manager)", true),
                      cardList("Zone","North 1", "Anindya Banerjee (General Manager)",true),
                      cardList("Zone","North 2", "Anindya Banerjee (General Manager)",true),
                      cardList("Zone","South", "Anindya Banerjee (General Manager)",true),
                      cardList("Zone","West", "Anindya Banerjee (General Manager)",true),
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
