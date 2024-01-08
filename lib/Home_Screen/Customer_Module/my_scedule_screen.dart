import 'package:flutter/material.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/utils/images.dart';

class MyScedulePage extends StatefulWidget {
  const MyScedulePage({super.key});

  @override
  State<MyScedulePage> createState() => _MyScedulePageState();
}

class _MyScedulePageState extends State<MyScedulePage> {
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
                child:
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    searchBar(),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Schedule Screen",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}