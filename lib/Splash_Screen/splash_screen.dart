import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Login_Screen/login_screen.dart';
import 'package:shalimar/utils/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Get.off(LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Image.asset(Images.splashbg)),
      ),
    );
  }
}
