import 'package:flutter/material.dart';
import 'package:shalimar/Elements/common_card_view_widget.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/utils/images.dart';

class MyCustomerTerriotoryPage extends StatefulWidget {
  const MyCustomerTerriotoryPage({super.key});

  @override
  State<MyCustomerTerriotoryPage> createState() => _MyCustomerTerriotoryPageState();
}

class _MyCustomerTerriotoryPageState extends State<MyCustomerTerriotoryPage> {
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
                  
                      Text("Terriotory - Chattisgarh",
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
                      cardList("Terriotory","E11", "", false),
                      cardList("Terriotory","E01", "", false),
                      cardList("Terriotory","P91", "", false),
                      cardList("Terriotory","C32", "", false),
                      cardList("Terriotory","R54", "", false),
                     
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
