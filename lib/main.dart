import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:get/get.dart';
import 'package:shalimar/Splash_Screen/splash_screen.dart';
import 'package:shalimar/utils/colors.dart';

// void main() {
//   final context = SecurityContext.defaultContext;
//   context.allowLegacyUnsafeRenegotiation = true;
//   final httpClient = HttpClient(context: context);
//   runApp(const MyApp());
// }

// const simpleTaskKey = "be.tramckrijte.workmanagerExample.simpleTask";
// const rescheduledTaskKey = "be.tramckrijte.workmanagerExample.rescheduledTask";
// const failedTaskKey = "be.tramckrijte.workmanagerExample.failedTask";
// const simpleDelayedTask = "be.tramckrijte.workmanagerExample.simpleDelayedTask";
// const simplePeriodicTask =
//     "be.tramckrijte.workmanagerExample.simplePeriodicTask";
// const simplePeriodic1HourTask =
//     "be.tramckrijte.workmanagerExample.simplePeriodic1HourTask";

// @pragma(
//     'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     switch (task) {
//       case simpleTaskKey:
//         print("$simpleTaskKey was executed. inputData = $inputData");
//         final prefs = await SharedPreferences.getInstance();
//         prefs.setBool("test", true);
//         print("Bool from prefs: ${prefs.getBool("test")}");
//         break;
//       case rescheduledTaskKey:
//         final key = inputData!['key']!;
//         final prefs = await SharedPreferences.getInstance();
//         if (prefs.containsKey('unique-$key')) {
//           print('has been running before, task is successful');
//           return true;
//         } else {
//           await prefs.setBool('unique-$key', true);
//           print('reschedule task');
//           return false;
//         }
//       case failedTaskKey:
//         print('failed task');
//         return Future.error('failed');
//       case simpleDelayedTask:
//         print("$simpleDelayedTask was executed");
//         break;
//       case simplePeriodicTask:
//         print("$simplePeriodicTask was executed");
//         break;
//       case simplePeriodic1HourTask:
//         print("$simplePeriodic1HourTask was executed");
//         break;
//       case Workmanager.iOSBackgroundTask:
//         print("The iOS background fetch was triggered");
//         Directory? tempDir = await getTemporaryDirectory();
//         String? tempPath = tempDir.path;
//         print(
//             "You can access other plugins in the background, for example Directory.getTemporaryDirectory(): $tempPath");
//         break;
//     }

//     return Future.value(true);
//   });
// }

final androidConfig = FlutterBackgroundAndroidConfig(
  notificationTitle: "flutter_background example app",
  notificationText:
      "Background notification for keeping the example app running in the background",
  notificationImportance: AndroidNotificationImportance.Default,
  notificationIcon: AndroidResource(
      name: 'background_icon',
      defType: 'drawable'), // Default is ic_launcher from folder mipmap
);

Future<void> main() async {
  final context = SecurityContext.defaultContext;
  context.allowLegacyUnsafeRenegotiation = true;
  final httpClient = HttpClient(context: context);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Workmanager().initialize(
  //   callbackDispatcher,
  //   isInDebugMode: true,
  // );

  await FlutterBackground.initialize(androidConfig: androidConfig);
  // await FlutterBackground.enableBackgroundExecution();
  

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
