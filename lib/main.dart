import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Splash_Screen/splash_screen.dart';
import 'package:shalimar/utils/colors.dart';

import 'Controller/timer_controller.dart';

void main() {
  final context = SecurityContext.defaultContext;
  context.allowLegacyUnsafeRenegotiation = true;
  final httpClient = HttpClient(context: context);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
        initialBinding: TimerServiceBinding(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TimerServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TimerService());
  }
}
