import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../Controller/activity_controller.dart';
import '../../Controller/stock_controller.dart';
import '../../Elements/common_searchbar_widget.dart';
import '../../utils/images.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActivityController>(
        init: ActivityController(),
        builder: (controller) {
          return Scaffold(
              body: controller.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SafeArea(
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
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              searchBar(_searchController),
                              SizedBox(
                                height: 20,
                              ),

                            ],
                          ),
                        ))
                  ],
                ),
              ));
        });
  }
}

