import 'package:flutter/material.dart';
import 'package:shalimar/utils/images.dart';

class CustomerAttendanceScreen extends StatefulWidget {
  const CustomerAttendanceScreen({super.key});

  @override
  State<CustomerAttendanceScreen> createState() => _CustomerAttendanceScreenState();
}

class _CustomerAttendanceScreenState extends State<CustomerAttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                child: Image.asset(
                  Images.bg_3,
                  fit: BoxFit.fill,
                )),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text("Attendance Screen is under Development",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                    SizedBox(height: 10,),
                   
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
