import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shalimar/Controller/set_activity_detail_data_controller.dart';
import 'package:shalimar/Controller/timer_controller.dart';
import 'package:shalimar/Home_Screen/Customer_Module/CheckIn_Module/checkin_screen.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_detail_screen.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerWidget extends StatefulWidget {
  String? tag;

  TimerWidget({super.key, this.tag});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  SetActivityDetailDataController controller =
      Get.put(SetActivityDetailDataController());

  // TimerService timerService = Get.find<TimerService>();
  final TimerService timerService = Get.put(TimerService());

  var currentTimes = "";
  DateFormat format = DateFormat('h:mm a');
  int differenceInMinutes=0;
  int differenceInHours =0;
  Future getData() async {
    print("Get Time_____________");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTimes = prefs.getString('currentTime').toString();
    print(prefs.getString('currentTime'));
    print("Current _____________");
    print(currentTimes);
    setState(() {});
  }

  void mainCall() {
    // Define two time strings
    String timeString1 = '10:30 AM';
    String timeString2 = '6:30 PM';
    // Parse time strings into DateTime objects

    DateTime time1 = format.parse(currentTimes);
    DateTime currentTime = DateTime.now();

    // Calculate the difference between time2 and time1
    Duration difference = currentTime.difference(time1);

    // Convert the duration to hours and minutes
  differenceInHours = difference.inHours;
   differenceInMinutes = difference.inMinutes.remainder(60);

    print('Time Difference: $differenceInHours hours and $differenceInMinutes minutes');

  }

  @override
  void initState() {
    // TODO: implement initState
    getData().whenComplete(() {
      mainCall();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          CheckInPage(tag: ""),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: controller.isCheckinOnSite.value,
              child: Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      controller.checkInlevelName.value,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: primaryColor,
                          fontSize: 13),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Flexible(
                      child: Text(
                        "Checked-in Time: ${currentTimes}",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    /* Obx(
                      () => Flexible(
                        child: Text(

                          "Checked-in: ${timerService.formattedTime(timeInSecond: timerService.elapsedSeconds.value)}",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.checkIn = false;
                timerService.stopTimer();
                // controller.timer!.cancel();
                // _timer!.cancel();

                controller
                    .fetchData(
                        levelCode: controller.checkInlevelCode.value,
                        activityID: 10)
                    .whenComplete(() {
                  mainCall();
                  Timer(Duration(seconds: 1), () {
                    Navigator.pop(context);
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              height: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Check Out!!',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                      "You are CheckOut at:  ${controller.checkInlevelName.value}"),
                                  Text("Check-in Time: ${currentTimes}"),

                                  Text(
                                    'Duration: ${differenceInMinutes} Minutes',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                child: Text('Ok'),
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();


                                  // timerService.elapsedSeconds.value == 0;
                                  // Get.back();
                                  if (widget.tag == "") {
                                    Navigator.pop(context);
                                  } else {
                                    Get.off(MyCustomerDetailsPage(),
                                        arguments: [
                                          prefs.getString('CustomerName'),
                                          prefs.getInt("levelID"),
                                          controller.update()
                                        ]);
                                  }

                                  controller.checkIn = false;
                                  controller.update();
                                },
                              ),
                            ],
                          );
                        });
                    controller.update();
                  });
                });

                // showSnackBar("You are Checked out at", controller.levelName.value,
                //     Colors.greenAccent);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        size: 30,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Check-Out",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
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
