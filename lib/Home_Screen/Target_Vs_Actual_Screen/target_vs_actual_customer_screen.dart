import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shalimar/Model/OutStandingModel.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

import '../../Controller/set_activity_detail_data_controller.dart';
import '../../Controller/target_vs_actual_controller.dart';
import '../../Elements/timer_widget.dart';

class TargetVsActualCustomer extends StatefulWidget {


  @override
  State<TargetVsActualCustomer> createState() => _TargetVsActualCustomerState();
}

class _TargetVsActualCustomerState extends State<TargetVsActualCustomer> {
  final TextEditingController searchController = TextEditingController();
  TargetVsActualController targetVsActualController =
  Get.put(TargetVsActualController());
  List<OutStandingList> uniquenum = [];

  @override
  void initState() {
    // TODO: implement initState
   /* if( targetVsActualController.filteredCustomerList.isEmpty &&  targetVsActualController.filteredAllCustomerList.isNotEmpty){
      targetVsActualController.filteredCustomerList.addAll(targetVsActualController.filteredAllCustomerList);
    }*/

    print('List: ${ targetVsActualController.filteredCustomerList}');

    super.initState();
  }



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
                  child:GetBuilder<SetActivityDetailDataController>(
                    init: SetActivityDetailDataController(),
                    builder: (setActivityController) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
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
                                        onPressed: () {
                                          targetVsActualController.getTargetVsActualData();
                                        },
                                        icon: Icon(
                                          Icons.refresh,
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
                                Text(
                                    "Customer - ${targetVsActualController.filteredCustomerList.length}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),

                                SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                  child:targetVsActualController.filteredCustomerList.isNotEmpty? ListView.builder(
                                    itemCount: targetVsActualController.filteredCustomerList!.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return targetVsActualController.filteredCustomerList![index]!
                                          .levelName!
                                          .toLowerCase()
                                          .contains(searchController
                                          .text
                                          .toLowerCase())?Card(
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                // outStandingController.filteredCustomerList = outStandingController
                                                //     .filteredAllCustomerList!.where((item) => item.parentLevelID == outStandingController.filteredTerritorList![index].levelID ).toList();
                                                // print(outStandingController.filteredDepotList!.length);
                                                // Get.to(OutStandingRegion());
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(12),
                                                color: primaryLight,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(

                                                      children: [
                                                        CircleAvatar(child: Icon(Icons.person),),
                                                        SizedBox(width: 5,),
                                                        Flexible(
                                                          child: Container(
                                                            child: FittedBox(
                                                              fit: BoxFit.fill,
                                                              child: Text(
                                                                "${targetVsActualController.filteredCustomerList![index].levelName.toString()}(${ targetVsActualController.filteredCustomerList![index].levelCode.toString()})",
                                                                style: TextStyle(
                                                                    color: blackTextColor,
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.w500,
                                                                    fontFamily: 'NUnit Sans'),
                                                              ),
                                                            ),
                                                          ),
                                                        ),


                                                      ],
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(8),
                                              color: Color(0xffFFD7D7),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Target",
                                                    style: TextStyle(
                                                        color: blackTextColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontFamily:
                                                        'Nunito Sans'),
                                                  ),
                                                  Text(targetVsActualController.filteredCustomerList![index].target==null?"0":formatNumber(targetVsActualController.filteredCustomerList![index].target!.truncate()),
                                                    style: TextStyle(
                                                        color: blackTextColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontFamily:
                                                        'Nunito Sans'),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(8),
                                              color: Color(0xffFFD7D7),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Sales",
                                                    style: TextStyle(
                                                        color: blackTextColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontFamily:
                                                        'Nunito Sans'),
                                                  ),
                                                  Text(targetVsActualController.filteredCustomerList![index].sales==null?"0":formatNumber(targetVsActualController.filteredCustomerList![index].sales!.truncate()),
                                                    style: TextStyle(
                                                        color: blackTextColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontFamily:
                                                        'Nunito Sans'),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(8),
                                              color: Color(0xffFFD7D7),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Achivement",
                                                    style: TextStyle(
                                                        color: blackTextColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontFamily:
                                                        'Nunito Sans'),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(targetVsActualController.filteredCustomerList![index].achivementPer==null?"0":formatNumber(targetVsActualController.filteredCustomerList![index].achivementPer!.truncate()),
                                                        style: TextStyle(
                                                            color: blackTextColor,
                                                            fontSize: 16,
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            fontFamily:
                                                            'Nunito Sans'),
                                                      ),  Text("%",
                                                        style: TextStyle(
                                                            color: blackTextColor,
                                                            fontSize: 16,
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            fontFamily:
                                                            'Nunito Sans'),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),


                                            // Divider(),

                                          ],
                                        ),
                                      ):SizedBox();
                                    },
                                  ):Center(
                                    child: Text(
                                      "No Data Available",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight:
                                          FontWeight.w500),
                                    ),
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
                      ); },) )
            ],
          ),
        ));
  }
  String formatNumber(int number) {
    final formatter = NumberFormat('#,##,##,##,###',);
    return formatter.format(number);
  }
}
