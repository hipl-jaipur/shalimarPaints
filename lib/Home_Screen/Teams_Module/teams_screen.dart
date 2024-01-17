import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Home_Screen/Teams_Module/team_details_screen.dart';

import '../../Controller/teams_controller.dart';
import '../../Elements/common_searchbar_widget.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  final TextEditingController searchController = TextEditingController();

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
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                    child:
                                        controller.temasDataList!.data!
                                                    .isNotEmpty ||
                                                controller.temasDataList != null
                                            ? ListView.builder(
                                                itemCount: controller
                                                    .temasDataList!.data!
                                                    .length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        dynamic index) {

                                                  return controller.temasDataList!.data![index]
                                                      .employeename!
                                                      .toLowerCase()
                                                      .contains(searchController
                                                      .text
                                                      .toLowerCase())? GestureDetector(
                                                    onTap: () {
                                                      Get.to(TeamsDetailsScreen(
                                                        id: controller
                                                            .temasDataList!.data![
                                                                index]
                                                            .employeeid
                                                            .toString(),
                                                      ));
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.symmetric(
                                                          horizontal: controller
                                                                      .temasDataList!.data![
                                                                          index]
                                                                      .hirelevel ==
                                                                  1 ?0:14
                                                      ),
                                                      child: Card(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            children: [
                                                       /*       GestureDetector(
                                                                onTap: () {
                                                                  controller.filteredLevelFirstList.addAll(controller
                                                                      .temasDataList!
                                                                      .data!
                                                                      .where((item) =>
                                                                          item.reportingmgrId ==
                                                                          controller
                                                                              .filteredLevelFirstList[index]
                                                                              .employeeid)
                                                                      .toList());
                                                                  controller
                                                                      .update();
                                                                  print(controller
                                                                      .filteredLevelFirstList
                                                                      .length);
                                                                  print(controller
                                                                      .filteredLevelFirstList[
                                                                          index]
                                                                      .employeeid);
                                                                },
                                                                child: Container(
                                                                    height: 26,
                                                                    width: 26,
                                                                    color: Colors
                                                                        .grey,
                                                                    child: Center(
                                                                        child: Icon(
                                                                            Icons.add))),*/
                                                              // ),
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
                                                                            .temasDataList!
                                                                            .data![
                                                                                index]
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
                                                                              child: Text("Designation : ${controller.temasDataList!.data![index].designationName.toString()} ", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
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
