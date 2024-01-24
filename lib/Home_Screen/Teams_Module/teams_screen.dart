import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:get/get.dart';
import 'package:shalimar/Home_Screen/Teams_Module/team_details_screen.dart';

import '../../Controller/set_activity_detail_data_controller.dart';
import '../../Controller/teams_controller.dart';
import '../../Elements/timer_widget.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  var empId;
  TeamsController teamsController = Get.put(TeamsController());



  late final TreeController<MyNode> treeController;

  final TextEditingController searchController = TextEditingController();
  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // for (var i in teamsController.hireLevelSevenlist) {
    //   rootsSeven.add(MyNode(
    //     title: i.employeename.toString(),
    //     designationName: i.designationName.toString(),
    //   ));
    // }

    // for (var i in teamsController.hireLevelSixlist) {
    //   rootsSix.add(MyNode(
    //       title: i.employeename.toString(),
    //       designationName: i.designationName.toString(),
    //       children: rootsSeven));
    // }

    // for (var i in teamsController.hireLevelFivelist) {
    //   rootsFive.add(MyNode(
    //       title: i.employeename.toString(),
    //       designationName: i.designationName.toString(),
    //       children: rootsSix));
    // }

    // for (var j = 0; j < teamsController.hireLevelFourlist.length; j++) {
    //   if (empId == teamsController.hireLevelFourlist[j].reportingmgrId) {
    //     rootsFour.add(MyNode(
    //         title: teamsController.hireLevelFourlist[j].employeename.toString(),
    //         designationName:
    //             teamsController.hireLevelFourlist[j].designationName.toString(),
    //         employeeid: teamsController.hireLevelFourlist[j].employeeid,
    //         reportingmgr_id:
    //             teamsController.hireLevelFourlist[j].reportingmgrId!.toInt(),
    //         children: rootsFive));
    //   }
    // }

    // for (var j = 0; j < teamsController.hireLevelThreelist.length; j++) {
    //   if (empId == teamsController.hireLevelThreelist[j].reportingmgrId) {
    //     rootsThree.add(MyNode(
    //         title:
    //             teamsController.hireLevelThreelist[j].employeename.toString(),
    //         designationName: teamsController
    //             .hireLevelThreelist[j].designationName
    //             .toString(),
    //         employeeid: teamsController.hireLevelThreelist[j].employeeid,
    //         reportingmgr_id:
    //             teamsController.hireLevelThreelist[j].reportingmgrId!.toInt(),
    //         children: rootsFour));
    //   }
    // }

    // for (var i = 0; i < teamsController.filteredLevelFirstList.length; i++) {
    //   if (teamsController.filteredLevelFirstList[i].hirelevel == 1) {
    //     rootsOne.add(
    //       MyNode(
    //         title: teamsController.filteredLevelFirstList[i].employeename
    //             .toString(),
    //         designationName: teamsController
    //             .filteredLevelFirstList[i].designationName
    //             .toString(),
    //         employeeid: teamsController.filteredLevelFirstList[i].employeeid,
    //         reportingmgr_id: teamsController
    //             .filteredLevelFirstList[i].reportingmgrId!
    //             .toInt(),
    //         children: rootsTwo,
    //       ),
    //     );
    //   }
    // }

    // for (var i in teamsController.hireLevelOnelist) {
    //   rootsOne.add(
    //     MyNode(
    //       title: i.employeename.toString(),
    //       designationName: i.designationName.toString(),
    //       employeeid: i.employeeid,
    //       reportingmgr_id: i.reportingmgrId!.toInt(),
    //       children: rootsTwo,
    //     ),
    //   );
    // }

    // parentTreeView();

    treeController = TreeController<MyNode>(
        roots: TeamsController.roots,
        childrenProvider: (MyNode node) {
          return node.children;
        });
  }

  @override
  void dispose() {
    treeController.dispose();
    super.dispose();
  }

  // void parentTreeView() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   empId = preferences.getInt('EmployeeId');

  //   for (var j = 0; j < teamsController.filteredLevelFirstList.length; j++) {
  //     if (empId == teamsController.filteredLevelFirstList[j].reportingmgrId) {
  //       rootsTwo.add(MyNode(
  //           title: teamsController.filteredLevelFirstList[j].employeename
  //               .toString(),
  //           designationName: teamsController
  //               .filteredLevelFirstList[j].designationName
  //               .toString(),
  //           employeeid: teamsController.filteredLevelFirstList[j].employeeid,
  //           reportingmgr_id: teamsController
  //               .filteredLevelFirstList[j].reportingmgrId!
  //               .toInt(),
  //           children: rootsThree));
  //     }
  //   }
  // }

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
                              child: GetBuilder<SetActivityDetailDataController>(
                                init: SetActivityDetailDataController(),
                                builder: (setActivityController) {
                                  return Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: setActivityController.checkIn
                                                  ? 40
                                                  : 20,
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
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(30)),
                                                    borderSide: BorderSide(
                                                      color: Color(0xffECE6E6),
                                                    )),
                                                disabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(30)),
                                                    borderSide: BorderSide(
                                                      color: Color(0xffECE6E6),
                                                    )),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(30)),
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
                                              onChanged: (c) {
                                                setState(() {});
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),

                                            // GetBuilder<TeamsController>(
                                            //     init: TeamsController(),
                                            //     builder: (c) {
                                            //       return Expanded(
                                            //           child: Card(
                                            //         child: TreeView<MyNode>(
                                            //           treeController: treeController,
                                            //           nodeBuilder: (BuildContext context,
                                            //               TreeEntry<MyNode> entry) {
                                            //             return MyTreeTile(
                                            //               key: ValueKey(entry.node),
                                            //               entry: entry,
                                            //               onTap: () => {
                                            //                 teamsController.employeeId =
                                            //                     entry.node.employeeid!
                                            //                         .toInt(),
                                            //                 teamsController.update(),
                                            //                 print("empId1: $empId"),
                                            //                 treeController
                                            //                     .toggleExpansion(entry.node)
                                            //               },
                                            //             );
                                            //           },
                                            //         ),
                                            //       ));
                                            //     })

                                            Expanded(
                                                child:
                                                controller.temasDataList!.data!
                                                    .isNotEmpty ||
                                                    controller.temasDataList != null
                                                    ? ListView.builder(
                                                  itemCount: controller
                                                      .temasDataList!
                                                      .data!
                                                      .length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                      dynamic index) {
                                                    return controller
                                                        .temasDataList!
                                                        .data![index]
                                                        .employeename!
                                                        .toLowerCase()
                                                        .contains(
                                                        searchController
                                                            .text
                                                            .toLowerCase())
                                                        ? GestureDetector(
                                                      onTap: () {
                                                        Get.to(
                                                            TeamsDetailsScreen(
                                                              id: controller
                                                                  .temasDataList!
                                                                  .data![index]
                                                                  .employeeid
                                                                  .toString(),
                                                            ));
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.symmetric(
                                                            horizontal: controller
                                                                .temasDataList!
                                                                .data![index]
                                                                .hirelevel ==
                                                                1
                                                                ? 0
                                                                : 14),
                                                        child: Card(
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(
                                                                8.0),
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
                                                                  child:
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                          controller.temasDataList!.data![index].employeename.toString(),
                                                                          style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.bold)),
                                                                      Row(
                                                                        children: [
                                                                          Flexible(
                                                                            child: Container(
                                                                              child: FittedBox(
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
                                                    )
                                                        : SizedBox();
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
                                      ),
                                      Positioned(
                                          child: Visibility(
                                              visible: setActivityController.checkIn,
                                              child: TimerWidget())),
                                    ],
                                  );},))
                        ],
                      ),
                    ));
        });
  }
}

class MyNode {
  MyNode({
    required this.title,
    required this.designationName,
    this.employeecode,
    this.status,
    this.reportingmgr_id,
    this.employeeid,
    this.hirelevel,
    this.children = const <MyNode>[],
  });

  final String title;
  final String designationName;
  final String? employeecode;
  final String? status;
  final int? reportingmgr_id;
  final int? employeeid;
  final int? hirelevel;

  final List<MyNode> children;
}
