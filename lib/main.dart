import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Splash_Screen/splash_screen.dart';
import 'package:shalimar/utils/colors.dart';

// void main() {
//   final context = SecurityContext.defaultContext;
//   context.allowLegacyUnsafeRenegotiation = true;
//   final httpClient = HttpClient(context: context);
//   runApp(const MyApp());
// }

Future<void> main() async {
  final context = SecurityContext.defaultContext;
  context.allowLegacyUnsafeRenegotiation = true;
  final httpClient = HttpClient(context: context);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
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
