import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/set_activity_detail_data_controller.dart';
import 'package:shalimar/Controller/timer_controller.dart';
import 'package:shalimar/Home_Screen/Customer_Module/customer_detail_screen.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerWidget extends StatelessWidget {
  String? tag;
  TimerWidget({super.key, this.tag});

  SetActivityDetailDataController controller =
      Get.put(SetActivityDetailDataController());
  // TimerService timerService = Get.find<TimerService>();
  final TimerService timerService = Get.put(TimerService());

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 50,
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
                  children: [
                    Text(
                      controller.levelName.value,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: primaryColor,fontSize: 13),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Obx(
                      () => Flexible(
                        child: Text(
                          "Checked-in: ${timerService.formattedTime(timeInSecond: timerService.elapsedSeconds.value)}",
                          style: TextStyle(fontSize: 13,
                              fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                isVisible = false;
                controller.checkIn = false;
                timerService.stopTimer();
                // controller.timer!.cancel();
                // _timer!.cancel();
                controller.fetchData(
                    levelCode: controller.levelCode.value, activityID: 10);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Check Out!!'),
                        content: Text(
                            "You are CheckOut at ${controller.levelName.value}"),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text('Ok'),
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();

                              // timerService.elapsedSeconds.value == 0;
                              // Get.back();
                              if (tag == "") {
                                Navigator.pop(context);
                              } else {
                                Get.off(MyCustomerDetailsPage(), arguments: [
                                  prefs.getString('CustomerName'),
                                  prefs.getInt("levelID")
                                ]);
                              }

                              controller.checkIn = false;
                              controller.update();
                            },
                          ),
                        ],
                      );
                    });
                // showSnackBar("You are Checked out at", controller.levelName.value,
                //     Colors.greenAccent);
                // Navigator.pop(context);
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
