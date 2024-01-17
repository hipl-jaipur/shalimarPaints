import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Home_Screen/Teams_Module/team_details_screen.dart';

import '../../Controller/teams_controller.dart';
import '../../Elements/common_searchbar_widget.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

class EmpTeamsScreen extends StatefulWidget {
  const EmpTeamsScreen({super.key});

  @override
  State<EmpTeamsScreen> createState() => _EmpTeamsScreenState();
}

class _EmpTeamsScreenState extends State<EmpTeamsScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return GetBuilder<TeamsController>(
        init: TeamsController(),
        builder: (controller) {
          print("1111111");
          print(controller.filteredLevelFirstList.length);
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
                              TextField(
                                controller: searchController,
                                textInputAction: TextInputAction.search,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      20.0, 0.0, 20.0, 0.0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(
                                        color: Color(0xffECE6E6),
                                      )),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(
                                        color: Color(0xffECE6E6),
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(
                                        color: Color(0xffECE6E6),
                                      )),
                                  hintText: 'Search',
                                  prefixIcon: IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                        Icons.arrow_circle_left,
                                        color: primaryColor,
                                        size: 40,
                                      )),
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.sort_rounded,
                                        color: primaryColor,
                                        size: 40,
                                      )),
                                ),
                                onChanged: (c){
                                  setState(() {

                                  });
                                },
                              ),                              SizedBox(
                                height: 20,
                              ),
                              Text(
                             "Teams",
                                  style: TextStyle(
                                      color:
                                      Colors.white,
                                      fontSize:
                                      20,
                                      fontWeight:
                                      FontWeight.bold)),
                              Expanded(
                                  child:
                                  controller.filteredLevelFirstList!
                                      .isNotEmpty ||
                                     controller.filteredLevelFirstList.length>0
                                      ? ListView.builder(
                                    itemCount: controller
                                        .filteredLevelFirstList!
                                        .length,
                                    itemBuilder:
                                        (BuildContext context,
                                        dynamic index) {

                                      return controller.filteredLevelFirstList![index]!
                                          .employeename!
                                          .toLowerCase()
                                          .contains(searchController
                                          .text
                                          .toLowerCase())? GestureDetector(
                                        onTap: () {
                                          Get.to(TeamsDetailsScreen(
                                            id: controller
                                                .filteredLevelFirstList[
                                            index]
                                                .employeeid
                                                .toString(),
                                          ));
                                        },
                                        child: Container(

                                          child: Card(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                            controller
                                                                .filteredLevelFirstList![index]
                                                                .employeename
                                                                .toString(),
                                                            style: TextStyle(
                                                                color:
                                                                primaryColor,
                                                                fontSize:
                                                                16,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        Row(
                                                          children: [
                                                            Flexible(
                                                              child:
                                                              Container(
                                                                child:
                                                                FittedBox(
                                                                  fit: BoxFit.fill,
                                                                  child: Text("Designation : ${controller.filteredLevelFirstList![index].designationName.toString()} ", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        SizedBox(
                                                          height:
                                                          12,
                                                        ),

                                                        // Divider(),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ):SizedBox();
                                    },
                                  )
                                      : Center(
                                    child: Text("No Data Found",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight:
                                            FontWeight.bold)),
                                  )),
                            ],
                          ),
                        ))
                  ],
                ),
              ));
        });
  }
}
