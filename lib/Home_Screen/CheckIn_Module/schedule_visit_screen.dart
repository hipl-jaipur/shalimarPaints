import 'package:flutter/material.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/utils/images.dart';

class ScheduleVisitPage extends StatefulWidget {
  const ScheduleVisitPage({super.key});

  @override
  State<ScheduleVisitPage> createState() => _ScheduleVisitPageState();
}

class _ScheduleVisitPageState extends State<ScheduleVisitPage> {
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
                      height: 20,
                    ),

                    searchBar(),
                    
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                            "Schedule A Visit",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )

                    
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
