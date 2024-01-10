import 'package:flutter/material.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/utils/images.dart';

class ViewOpenOrderPage extends StatefulWidget {
  const ViewOpenOrderPage({super.key});

  @override
  State<ViewOpenOrderPage> createState() => _ViewOpenOrderPageState();
}

class _ViewOpenOrderPageState extends State<ViewOpenOrderPage> {
    final TextEditingController _searchController = TextEditingController();

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

                    searchBar(_searchController),
                    
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                            "View Open Order Screen",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )

                    
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