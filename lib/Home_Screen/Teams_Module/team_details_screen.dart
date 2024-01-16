import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../Controller/teams_controller.dart';
import '../../Elements/common_searchbar_widget.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

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
                              child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                searchBar(_searchController),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            child: Icon(Icons.person),
                                          ),
                                          SizedBox(height: 5,),
                                          Text(controller.employeeDetailsModel!
                                              .data![0].employeeName
                                                  .toString(),
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)) ,
                                          SizedBox(height: 5,),
                                          Text("Designation: ${controller.employeeDetailsModel!.data![0].designationName.toString()}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),

                                          SizedBox(height: 5,),
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: primaryColor,
                                            child: Icon(Icons.phone,size: 16,color: Colors.white,),),
                                          SizedBox(height: 10,),
                                          Container(
                                            color: primaryLight,
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  leading: Icon(Icons.local_activity_outlined),
                                                  title: Text('Activity History'),
                                                ),
                                                ListTile(
                                                  leading: Icon(Icons.route),
                                                  title: Text('Route'),
                                                ),  ListTile(
                                                  leading: Icon(Icons.menu_book),
                                                  title: Text('Attendance'),
                                                ),
                                                ListTile(
                                                  leading: Icon(Icons.class_),
                                                  title: Text('Schedule'),
                                                ), ListTile(
                                                  leading: Icon(Icons.person),
                                                  title: Text('Profile'),
                                                ),
                                                ListTile(
                                                  leading: Icon(Icons.people_alt_outlined),
                                                  title: Text('Team'),
                                                ),
                                              ],
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ));
        });
  }
}
