import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(textMessage, String messgae, MaterialAccentColor bgColor) {
  Get.showSnackbar(
    GetSnackBar(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
      borderRadius: 10,
      title: textMessage,
      message: messgae,
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
      backgroundColor: bgColor,
      snackStyle: SnackStyle.FLOATING,
    ),
  );
}

class CheckInSnackBarPage extends StatelessWidget {
  const CheckInSnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Hi, I am a SnackBar!'),
            backgroundColor: (Colors.black12),
            action: SnackBarAction(
              label: 'dismiss',
              onPressed: () {
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text(
          'Click to Display a SnackBar',
        ),
      ),
    );
  }
}