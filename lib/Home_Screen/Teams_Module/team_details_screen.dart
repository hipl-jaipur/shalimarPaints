import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shalimar/Home_Screen/Activity_Screen/activity_screen.dart';
import 'package:shalimar/Home_Screen/Teams_Module/emp_team_profile.dart';
import 'package:shalimar/Home_Screen/Teams_Module/emp_team_screen.dart';

import '../../Controller/teams_controller.dart';
import '../../Elements/common_searchbar_widget.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../Customer_Module/my_scedule_screen.dart';
import '../customer_attendance_screen.dart';

class TeamsDetailsScreen extends StatefulWidget {
  final String id;

  const TeamsDetailsScreen({super.key, required this.id});

  @override
  State<TeamsDetailsScreen> createState() => _TeamsDetailsScreenState();
}

class _TeamsDetailsScreenState extends State<TeamsDetailsScreen> {
  final TextEditingController _searchController = TextEditingController();
  TeamsController teamsController = Get.put(TeamsController());

  @override
  void initState() {
    // TODO: implement initState
    teamsController.getEmployData(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamsController>(
        init: TeamsController(),
        builder: (controller) {
          return Scaffold(
              body: controller.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SafeArea(
                      child: Stack(
                        children: [
                          SizedBox(
                              width: double.infinity,
                              child: Image.asset(
                                Images.bg_3,
                                fit: BoxFit.fill,
                              )),
                          Positioned(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 14.0,right: 14,top: 14,bottom: 10),
                                    child: searchBar(_searchController),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    color: primaryLight,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            CircleAvatar(
                                              radius: 25,
                                              child: Icon(Icons.person),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                controller.employeeDetailsModel!
                                                    .data![0].employeeName
                                                    .toString(),
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold)),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                "Designation: ${controller.employeeDetailsModel!.data![0].designationName.toString()}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold)),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor: primaryColor,
                                                  child: Icon(
                                                    Icons.phone,
                                                    size: 16,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(width: 20,),
                                                CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor: primaryColor,
                                                  child: Icon(
                                                    Icons.email_outlined,
                                                    size: 16,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    controller.employeeDetailsModel!.data![0].reportingmgrName??"",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold)),
                                                Text(
                                                    " > ${controller.employeeDetailsModel!.data![0].employeeName}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ],
                                        ),


                                        SizedBox(
                                          height: 5,
                                        ),
                                        Column(
                                          children: [
                                            Card(
                                              child: ListTile(
                                        onTap: (){
                                          Get.to(() =>CustomerActivityScreen(tag: 'Team', id: controller.employeeDetailsModel!.data![0].employeeID,));
                                                                                },
                                                leading: Icon(Icons
                                                    .local_activity_outlined),
                                                title:
                                                    Text('Activity History'),
                                              ),
                                            ),

                                            Card(
                                              child: ListTile(
                                                onTap: (){

                                                  Get.to(()=>CustomerAttendanceScreen(tag: false, id: controller.employeeDetailsModel!.data![0].employeeID,));
                                                },
                                                leading:
                                                    Icon(Icons.menu_book),
                                                title: Text('Attendance'),
                                              ),
                                            ),
                                            Card(
                                              child: ListTile(
                                                onTap: (){

                                                  Get.to(MyScedulePage(tag: false, id:  controller.employeeDetailsModel!.data![0].employeeID,));
                                                },
                                                leading: Icon(Icons.class_),
                                                title: Text('Schedule'),
                                              ),
                                            ),
                                            Card(
                                              child: ListTile(
                                                onTap: (){
                                                  Get.to(()=>TeamsProfileScreen(id:controller.employeeDetailsModel!.data![0].employeeID,));
                                                },
                                                leading: Icon(Icons.person),
                                                title: Text('Profile'),
                                              ),
                                            ),
                                            Card(
                                              child: ListTile(
                                                onTap: () {
                                                  teamsController
                                                      .filteredLevelFirstList
                                                      .clear();
                                                  teamsController
                                                          .filteredLevelFirstList =
                                                      teamsController
                                                          .temasDataList!
                                                          .data!
                                                          .where((item) =>
                                                              item.reportingmgrId ==
                                                              controller
                                                                  .employeeDetailsModel!
                                                                  .data![0]
                                                                  .employeeID)
                                                          .toList();
                                                  Get.to(() => EmpTeamsScreen());
                                                },

                                                leading: Icon(Icons
                                                    .people_alt_outlined),
                                                title: Text('Team'),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ));
        });
  }
}
