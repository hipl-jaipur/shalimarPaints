import 'dart:async';

import 'package:get/get.dart';

class TimerService extends GetxService {
  RxInt elapsedSeconds = 0.obs;
  late Timer _timer;

  // @override
  // onInit() {
  //   super.onInit();
  //   _timer = Timer.periodic(Duration(seconds: 1), _onTimerTick);
  // }

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
      _timer = Timer.periodic(Duration(seconds: 1), _onTimerTick);
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
