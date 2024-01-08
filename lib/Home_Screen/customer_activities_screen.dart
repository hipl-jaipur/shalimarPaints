import 'package:flutter/material.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/utils/images.dart';

class CustomerActivityScreen extends StatefulWidget {
  const CustomerActivityScreen({super.key});

  @override
  State<CustomerActivityScreen> createState() => _CustomerActivityScreenState();
}

class _CustomerActivityScreenState extends State<CustomerActivityScreen> {
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
                    Text("Activity Screen is under Development",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                    SizedBox(height: 10,),
                   
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
