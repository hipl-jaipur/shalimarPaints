import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/outstanding_controller.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/Model/OutStandingModel.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class OutStandingCustomer extends StatefulWidget {


  @override
  State<OutStandingCustomer> createState() => _OutStandingCustomerState();
}

class _OutStandingCustomerState extends State<OutStandingCustomer> {
  final TextEditingController _searchController = TextEditingController();
  OutStandingController outStandingController =
      Get.put(OutStandingController());
  List<OutStandingList> uniquenum = [];

  @override
  void initState() {
    // TODO: implement initState
    if( outStandingController.filteredCustomerList.isEmpty &&  outStandingController.filteredAllCustomerList.isNotEmpty){
      outStandingController.filteredCustomerList.addAll(outStandingController.filteredAllCustomerList);
    }

    print('List: ${ outStandingController.filteredCustomerList}');

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
              child: Padding(
            padding: const EdgeInsets.all(18.0),
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
                Text(
                    "Customer - ${outStandingController.filteredCustomerList.length}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),

                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: outStandingController.filteredCustomerList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
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
                                                "${outStandingController.filteredCustomerList![index].levelName.toString()}(${ outStandingController.filteredCustomerList![index].levelID.toString()})",
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
                                    Padding(
                                      padding: const EdgeInsets.only(left: 43),
                                      child: Text(
                                        "BucketTotal- \u{20B9}${outStandingController.filteredCustomerList![index].bucketTotal.toString() ?? 0.0.toString()}",
                                        style: TextStyle(
                                            color: blackTextColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Nunito Sans'),
                                      ),
                                    )
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
                                    "0-30 Days",
                                    style: TextStyle(
                                        color: blackTextColor,
                                        fontSize: 16,
                                        fontWeight:
                                        FontWeight.w500,
                                        fontFamily:
                                        'Nunito Sans'),
                                  ),
                                  Text(outStandingController.filteredCustomerList![index].age030.toString() ?? 0.0.toString(),
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
                                    "31-60 Days",
                                    style: TextStyle(
                                        color: blackTextColor,
                                        fontSize: 16,
                                        fontWeight:
                                        FontWeight.w500,
                                        fontFamily:
                                        'Nunito Sans'),
                                  ),
                                  Text(outStandingController.filteredCustomerList![index].age3160.toString() ?? 0.0.toString(),
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
                                    "61-90 Days",
                                    style: TextStyle(
                                        color: blackTextColor,
                                        fontSize: 16,
                                        fontWeight:
                                        FontWeight.w500,
                                        fontFamily:
                                        'Nunito Sans'),
                                  ),
                                  Text(outStandingController.filteredCustomerList![index].age6190.toString() ?? 0.0.toString(),
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
                                    "91-120 Days",
                                    style: TextStyle(
                                        color: blackTextColor,
                                        fontSize: 16,
                                        fontWeight:
                                        FontWeight.w500,
                                        fontFamily:
                                        'Nunito Sans'),
                                  ),
                                  Text(outStandingController.filteredCustomerList![index].age91120.toString() ?? 0.0.toString(),
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
                                    "121-150 Days",
                                    style: TextStyle(
                                        color: blackTextColor,
                                        fontSize: 16,
                                        fontWeight:
                                        FontWeight.w500,
                                        fontFamily:
                                        'Nunito Sans'),
                                  ),
                                  Text(outStandingController.filteredCustomerList![index].age121150.toString() ?? 0.0.toString(),
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
                                    "151-180 Days",
                                    style: TextStyle(
                                        color: blackTextColor,
                                        fontSize: 16,
                                        fontWeight:
                                        FontWeight.w500,
                                        fontFamily:
                                        'Nunito Sans'),
                                  ),
                                  Text(outStandingController.filteredCustomerList![index].age151180.toString() ?? 0.0.toString(),
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
                                    "Over 181 Days",
                                    style: TextStyle(
                                        color: blackTextColor,
                                        fontSize: 16,
                                        fontWeight:
                                        FontWeight.w500,
                                        fontFamily:
                                        'Nunito Sans'),
                                  ),
                                  Text(outStandingController.filteredCustomerList![index].age181Above.toString(),
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

                            // Divider(),

                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
