import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Elements/common_card_view_widget.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/collect_payment_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/customer_profile_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/make_complain_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/schedule_visit_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/take_note_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/take_order_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/view_open_order_screen.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 120,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout_outlined,
                                size: 30,
                                color: primaryColor,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "CheckOut",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CheckInCardView(
                        title: "View Open Orders",
                       onPressed: () {
                        Get.to(ViewOpenOrderPage());
                      },),
                    CheckInCardView(
                      title: "Schedule A Visit",
                      onPressed: () {
                        Get.to(ScheduleVisitPage());
                      },
                    ),
                    CheckInCardView(
                      title: "Customer Profile",
                      onPressed: () {
                        Get.to(CustomerProfilePage());
                      },
                    ),
                    CheckInCardView(
                      title: "Take Order",
                      onPressed: () {
                        Get.to(TakeOrderPage());
                      },
                    ),
                    CheckInCardView(
                        title: "Collect Payment",
                        onPressed: () {
                        Get.to(CollectPaymentPage());
                      },),
                    CheckInCardView(
                        title: "Make Complain",
                       onPressed: () {
                        Get.to(ComplainPage());
                      },),
                    CheckInCardView(
                        title: "Take Notes",
                        onPressed: () {
                        Get.to(TakeNotePage());
                      },),
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
