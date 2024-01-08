import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Splash_Screen/splash_screen.dart';
import 'package:shalimar/utils/colors.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


