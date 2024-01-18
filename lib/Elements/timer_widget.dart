import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/set_activity_detail_data_controller.dart';
import 'package:shalimar/Controller/timer_controller.dart';
import 'package:shalimar/utils/colors.dart';

class TimerWidget extends StatelessWidget {
  TimerWidget({super.key});

  SetActivityDetailDataController controller =
      Get.put(SetActivityDetailDataController());
  TimerService timerService = Get.find<TimerService>();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.levelName.value,
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: primaryColor),
              ),
              SizedBox(
                width: 5.0,
              ),
              Obx(
                () => Text(
                  "Checked-in: ${timerService.formattedTime(timeInSecond: timerService.elapsedSeconds.value)}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              // isVisible = false;
              controller.checkIn = false;
              // timerService.timerCancel();
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
                          onPressed: () {
                            // timerService.elapsedSeconds.value == 0;
                            // Get.back();
                            Navigator.pop(context, false);
                            Future.value(false);
                            // Navigator.pop(context);
                            controller.checkIn = false;
                            controller.update();
                            // timerService.update;
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
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
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
    );
  }
}
