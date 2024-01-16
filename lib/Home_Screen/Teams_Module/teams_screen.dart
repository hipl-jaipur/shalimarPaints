import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shalimar/Home_Screen/Stock_Screen/stock_suk_details_screen.dart';
import 'package:shalimar/Home_Screen/Teams_Module/team_details_screen.dart';

import '../../Controller/get_available_stock_data-controller.dart';
import '../../Controller/stock_controller.dart';
import '../../Controller/teams_controller.dart';
import '../../Elements/common_searchbar_widget.dart';
import '../../Model/TeamsDataModel.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  final TextEditingController _searchController = TextEditingController();

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
                                Expanded(
                                    child: controller.temasDataList!.data!
                                                .isNotEmpty ||
                                            controller.temasDataList != null
                                        ? ListView.builder(
                                            itemCount: controller
                                                .filteredLevelFirstList!.length,
                                            itemBuilder: (BuildContext context,
                                                dynamic index) {

                                              return GestureDetector(
                                                onTap: (){

                                                  Get.to(TeamsDetailsScreen(id:  controller.filteredLevelFirstList[index].employeeid.toString(),));

                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: controller
                                                                  .filteredLevelFirstList[index]
                                                                  .hirelevel ==
                                                              2
                                                          ? 12
                                                          : controller
                                                                      .filteredLevelFirstList[
                                                                          index]
                                                                      .hirelevel ==
                                                                  3
                                                              ? 25
                                                              : controller
                                                                          .filteredLevelFirstList![
                                                                              index]
                                                                          .hirelevel ==
                                                                      4
                                                                  ? 30
                                                                  : controller
                                                          .filteredLevelFirstList!
                                                                              [index]
                                                                              .hirelevel ==
                                                                          5
                                                                      ? 40
                                                                      : 0),
                                                  child: Card(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              controller.filteredLevelFirstList.addAll(controller
                                                                  .temasDataList!
                                                                  .data!
                                                                  .where((item) =>
                                                                      item.reportingmgrId ==
                                                                      controller
                                                                          .filteredLevelFirstList[
                                                                              index]
                                                                          .employeeid)
                                                                  .toList());
                                                              controller.update();
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
                                                                color:
                                                                    Colors.grey,
                                                                child: Center(
                                                                    child: Icon(
                                                                        Icons
                                                                            .add))),
                                                          ),
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
                                                                            FontWeight
                                                                                .bold)),
                                                                Row(
                                                                  children: [
                                                                    Flexible(
                                                                      child: Container(

                                                                        child: FittedBox(
                                                                          fit:
                                                                              BoxFit.fill,
                                                                          child: Text(
                                                                              "Designation : ${controller.temasDataList!.data![index].designationName.toString()} ",
                                                                              style: TextStyle(
                                                                                  color: Colors
                                                                                      .black,
                                                                                  fontSize:
                                                                                      16,
                                                                                  fontWeight:
                                                                                      FontWeight.w600)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),

                                                                SizedBox(
                                                                  height: 12,
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
                                              );
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
