import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../Controller/teams_controller.dart';
import '../../Elements/common_searchbar_widget.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

class TeamsProfileScreen extends StatefulWidget {
  final int id;

  const TeamsProfileScreen({super.key, required this.id});

  @override
  State<TeamsProfileScreen> createState() => _TeamsProfileScreenState();
}

class _TeamsProfileScreenState extends State<TeamsProfileScreen> {
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
                                CrossAxisAlignment.center,
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
                                          "${controller.employeeDetailsModel!.data![0].employeeName.toString()}(${controller.employeeDetailsModel!.data![0].employeeCode.toString()})",
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
                                      Text(
                                          "Email: ${controller.employeeDetailsModel!.data![0].employeeEmail.toString()}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),  Text(
                                          "Mobile No.: ${controller.employeeDetailsModel!.data![0].employeeMobile?.toStringAsFixed(0)}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          "Reporting Manager: ${controller.employeeDetailsModel!.data![0].reportingmgrName??""}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          "Status: ${controller.employeeDetailsModel!.data![0].status??""}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),

                                    ],
                                  ),



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
