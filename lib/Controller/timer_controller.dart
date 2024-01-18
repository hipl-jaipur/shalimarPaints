import 'dart:async';

import 'package:get/get.dart';

class TimerService extends GetxService {
  RxInt elapsedSeconds = 0.obs;
  late Timer _timer;

  @override
  onInit() {
    super.onInit();
    _timer = Timer.periodic(Duration(seconds: 1), _onTimerTick);
  }

  formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    int hr = timeInSecond ~/ Duration.secondsPerHour;
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    String hour = hr.toString().length <= 1 ? "0$hr" : "$hr";
    return "$hour:$minute:$second";
  }

  void _onTimerTick(Timer timer) {
    elapsedSeconds++;
  }

  void startTimer() {
   _onTimerTick;
  }

  void stopTimer() {
    if (_timer.isActive) {
      _timer.cancel();
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}

// class TimerController extends GetxController {
//   // Observable variable to hold the timer count
//   var counter = 0.obs;

//   late Timer _timer;

//   @override
//   void onInit() {
//     super.onInit();
//     // Start the timer when the controller is initialized
//     startTimer();
//   }

//   void startTimer() {
//     // Create a timer that increments the counter every second
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       // Increment the counter
//       counter++;
//     });
//   }

//    void stopTimer() {
//     // Stop the timer when it's no longer needed
//     _timer.cancel();
//   }

//   @override
//   void onClose() {
//     // Stop the timer when the controller is closed to avoid memory leaks
//     stopTimer();
//     super.onClose();
//   }

//    formattedTime({required int timeInSecond}) {
//     int sec = timeInSecond % 60;
//     int min = (timeInSecond / 60).floor();
//     int hr = timeInSecond ~/ Duration.secondsPerHour;
//     String minute = min.toString().length <= 1 ? "0$min" : "$min";
//     String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
//     String hour = hr.toString().length <= 1 ? "0$hr" : "$hr";
//     return "$hour:$minute:$second";
//   }
// }
