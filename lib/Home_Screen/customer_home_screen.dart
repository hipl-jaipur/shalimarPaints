import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shalimar/Controller/customer_hire_data_controller.dart';
import 'package:shalimar/Controller/get_available_stock_data-controller.dart';
import 'package:shalimar/Controller/get_customer_schedule_data_controller.dart';
import 'package:shalimar/Controller/get_user_activity_master_data_controller.dart';
import 'package:shalimar/Controller/outstanding_controller.dart';
import 'package:shalimar/Controller/stock_controller.dart';
import 'package:shalimar/Controller/teams_controller.dart';
import 'package:shalimar/Home_Screen/Customer_Module/my_scedule_screen.dart';
import 'package:shalimar/Home_Screen/OutStanding_Module/outstanding_customer_screen.dart';
import 'package:shalimar/Home_Screen/OutStanding_Module/outstanding_depot_Screen.dart';
import 'package:shalimar/Home_Screen/OutStanding_Module/outstanding_region_screen.dart';
import 'package:shalimar/Home_Screen/OutStanding_Module/outstanding_territory_screen.dart';
import 'package:shalimar/Home_Screen/OutStanding_Module/outstanding_zone_screen.dart';
import 'package:shalimar/Home_Screen/Stock_Screen/stock_list_scrren.dart';
import 'package:shalimar/Home_Screen/Teams_Module/teams_screen.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/set_activity_detail_data_controller.dart';
import '../Controller/target_vs_actual_controller.dart';
import '../Elements/timer_widget.dart';
import 'Target_Vs_Actual_Screen/target_vas_actual_region_screen.dart';
import 'Target_Vs_Actual_Screen/target_vs_actual_customer_screen.dart';
import 'Target_Vs_Actual_Screen/target_vs_actual_depot_screen.dart';
import 'Target_Vs_Actual_Screen/target_vs_actual_territory_svreen.dart';
import 'Target_Vs_Actual_Screen/target_vs_actual_zone_csreen.dart';

class CustomerHomeScreen extends StatefulWidget {
  String EmployeeName;
  String Email;
  String DesignationName;
  CustomerHomeScreen(
      {super.key,
      required this.EmployeeName,
      required this.Email,
      required this.DesignationName});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  // ZoneDataController zoneDataController = Get.put(ZoneDataController());

  StockController stockController = Get.put(StockController());
  CustomerHireDataController customerHireDataController =
      Get.put(CustomerHireDataController());
  OutStandingController outStandingController =
      Get.put(OutStandingController());
  GetUserActivityController getUserActivityController =
      Get.put(GetUserActivityController());
  GetAvailableStockDataController marketSectorController =
      Get.put(GetAvailableStockDataController());
  GetScheduleDataController scheduleDataController =
      Get.put(GetScheduleDataController());
  TargetVsActualController targetVsActualController =
      Get.put(TargetVsActualController());
  SetActivityDetailDataController setActivityController =
  Get.put(SetActivityDetailDataController());
  TeamsController teamsController = Get.put(TeamsController());
  @override
  void initState() {
    // TODO: implement initState
    teamsController.getTeamsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<CustomerHireDataController>(
          init: CustomerHireDataController(),
          builder: (CustomerHireDataController controller) {
            return ModalProgressHUD(
              inAsyncCall: controller.isLoading.value,
              child: Stack(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        Images.bg_3,
                        fit: BoxFit.fill,
                      )),
                  Positioned(
                    child: GetBuilder<SetActivityDetailDataController>(
    init: SetActivityDetailDataController(),
    builder: (controller) {
    return Stack(

                        children: [

                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                setActivityController.checkIn? SizedBox(height: 40,):SizedBox(),
                                SizedBox(
                                  width: double.infinity,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    width: 150,
                                                    height: 60,
                                                    child: Image.asset(Images
                                                        .shalimarLogoHorizontal)),
                                                Icon(
                                                  Icons.notifications_rounded,
                                                  color: primaryColor,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              widget.EmployeeName,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              widget.Email,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              widget.DesignationName,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                              textAlign: TextAlign.left,
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GridView.count(
                                    primary: false,
                                    padding: const EdgeInsets.all(20),
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    crossAxisCount: 2,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          // getUserActivityController.fetchData();
                                          // Get.to(ScheduleVisitPage());

                                          Get.to(MyScedulePage(
                                            tag: true,
                                            id: 0,
                                          ));
                                        },
                                        child: Card(
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.calendar_month_sharp,
                                                  color: primaryColor,
                                                  size: 40,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("My Schedule",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          final SharedPreferences prefs =
                                              await SharedPreferences.getInstance();
                                          var division = prefs.getString('Division');
                                          // zoneDataController.fetchZoneData(zoneId: 0);
                                          customerHireDataController
                                              .getCustomerHireData();

                                          // Get.to(MyCustomerZonePage());

                                          // Get.to(division == 1
                                          //     ? MyCustomerZonePage()
                                          //     : division == 2
                                          //         ? MyCustomerRegionsPage()
                                          //         : division == 3
                                          //             ? MyCustomerDepotPage()
                                          //             : MyCustomerTerriotoryPage());
                                        },
                                        child: Card(
                                          child: Center(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color: primaryColor,
                                                size: 40,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text('Customer',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold)),
                                            ],
                                          )),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          /*       teamsController.filteredLevelFirstList
                                              .clear();
                                          teamsController.filteredLevelFirstList =
                                              teamsController.temasDataList!.data!
                                                  .where(
                                                      (item) => item.hirelevel == 1)
                                                  .toList();*/
                                          Get.to(TeamsScreen());

                                          // Get.to(TreeNode());
                                        },
                                        child: Container(
                                          child: Card(
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.people_alt_rounded,
                                                    color: primaryColor,
                                                    size: 40,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text('Teams',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (outStandingController
                                                  .filteredZoneList.length >
                                              0) {
                                            Get.to(OutStandingZone());
                                          } else if (outStandingController
                                                  .filteredAllRegionList.length >
                                              0) {
                                            Get.to(OutStandingRegion());
                                          } else if (outStandingController
                                                  .filteredAllDepotList.length >
                                              0) {
                                            Get.to(OutStandingDepot());
                                          } else if (outStandingController
                                                  .filteredAllTerritorList.length >
                                              0) {
                                            Get.to(OutStandingTerritory());
                                          } else if (outStandingController
                                                  .filteredAllCustomerList.length >
                                              0) {
                                            Get.to(OutStandingCustomer());
                                          }
                                          // Get.to(OutStandingScreen());
                                        },
                                        child: Container(
                                          child: Card(
                                            child: Center(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.people_alt_rounded,
                                                  color: primaryColor,
                                                  size: 40,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text('OutStanding',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold)),
                                              ],
                                            )),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(StockScreen());
                                        },
                                        child: Container(
                                          child: Card(
                                            child: Center(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.people_alt_rounded,
                                                  color: primaryColor,
                                                  size: 40,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text('Stock',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold)),
                                              ],
                                            )),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (targetVsActualController
                                                  .filteredZoneList.length >
                                              0) {
                                            Get.to(TargetVsActualZone());
                                          } else if (targetVsActualController
                                                  .filteredAllRegionList.length >
                                              0) {
                                            Get.to(TargetVsActyalRegion());
                                          } else if (targetVsActualController
                                                  .filteredAllDepotList.length >
                                              0) {
                                            Get.to(TargetVsActualDepot());
                                          } else if (targetVsActualController
                                                  .filteredAllTerritorList.length >
                                              0) {
                                            Get.to(TargetVsActualTerritory());
                                          } else if (targetVsActualController
                                                  .filteredAllCustomerList.length >
                                              0) {
                                            Get.to(TargetVsActualCustomer());
                                          }
                                          // Get.to(OutStandingScreen());
                                        },
                                        child: Container(
                                          child: Card(
                                            child: Center(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.tag,
                                                  color: primaryColor,
                                                  size: 40,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text('Target Vs Actual',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold)),
                                              ],
                                            )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              child: Visibility(
                                  visible: setActivityController.checkIn,
                                  child: TimerWidget())),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
