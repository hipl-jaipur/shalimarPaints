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

  void _onTimerTick(Timer timer) {
    elapsedSeconds++;
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
