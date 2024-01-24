import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/utils/images.dart';

import '../Controller/set_activity_detail_data_controller.dart';
import '../Elements/timer_widget.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({super.key});

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
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
              child: GetBuilder<SetActivityDetailDataController>(
                init: SetActivityDetailDataController(),
                builder: (setActivityController) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: setActivityController.checkIn
                                  ? 80
                                  : 50,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("7982035139",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(
                                  Icons.mail,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("App.support@shalimarpaints.com",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(
                                  Icons.mail,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Shiv.kumar@shalimarpaints.com",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          child: Visibility(
                              visible: setActivityController.checkIn,
                              child: TimerWidget())),
                    ],
                  ); },),
            ),
          ],
        ),
      ),
    );
  }
}
