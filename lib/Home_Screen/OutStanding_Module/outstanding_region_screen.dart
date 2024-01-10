import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/outstanding_controller.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

import 'outstanding_depot_Screen.dart';

class OutStandingRegion extends StatefulWidget {
  final String regionName;
  final String days;
  final String price;
  const OutStandingRegion({super.key, required this.regionName, required this.days, required this.price});

  @override
  State<OutStandingRegion> createState() => _OutStandingRegionState();
}

class _OutStandingRegionState extends State<OutStandingRegion> {
  final TextEditingController _searchController = TextEditingController();
  OutStandingController outStandingController =
  Get.put(OutStandingController());

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
                    child: SingleChildScrollView(
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
                          Text("Region",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text(widget.days,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            color: primaryLight,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Get.to(OutStandingDepot(depotName:outStandingController.customerOsDataList[0].depotName.toString(), days: widget.days, price: widget.price,));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    color: primaryLight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.regionName,
                                          style: TextStyle(
                                              color: blackTextColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Nunito Sans'),
                                        ),
                                        Text(
                                          widget.price,
                                          style: TextStyle(
                                              color: blackTextColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Nunito Sans'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                // Divider(),
                                /*  Container(
                          padding: EdgeInsets.all(12),
                          color: primaryLight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "30-60 Days",
                                style: TextStyle(
                                    color: blackTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Nunito Sans'),
                              ),
                              Text(
                                outStandingController.day60.value
                                    .toStringAsFixed(2),
                                style: TextStyle(
                                    color: blackTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Nunito Sans'),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.all(12),
                          color: primaryLight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "60-90 Days",
                                style: TextStyle(
                                    color: blackTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Nunito Sans'),
                              ),
                              Text(
                                outStandingController.day90.value
                                    .toStringAsFixed(2),
                                style: TextStyle(
                                    color: blackTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Nunito Sans'),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.all(12),
                          color: primaryLight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "90-120 Days",
                                style: TextStyle(
                                    color: blackTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Nunito Sans'),
                              ),
                              Text(
                                outStandingController.day120.value
                                    .toStringAsFixed(2),
                                style: TextStyle(
                                    color: blackTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Nunito Sans'),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.all(12),
                          color: primaryLight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "120-180 Days",
                                style: TextStyle(
                                    color: blackTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Nunito Sans'),
                              ),
                              Text(
                                outStandingController.day180.value
                                    .toStringAsFixed(2),
                                style: TextStyle(
                                    color: blackTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Nunito Sans'),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.all(12),
                          color: primaryLight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Over 180 Days",
                                style: TextStyle(
                                    color: blackTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Nunito Sans'),
                              ),
                              Text(
                                outStandingController.over180days.value
                                    .toStringAsFixed(2),
                                style: TextStyle(
                                    color: blackTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Nunito Sans'),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.all(12),
                          color: primaryColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Price",
                                style: TextStyle(
                                    color: primaryLight,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Nunito Sans'),
                              ),
                              Text(
                                outStandingController.totalPrice.value
                                    .toStringAsFixed(2),
                                style: TextStyle(
                                    color: primaryLight,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Nunito Sans'),
                              )
                            ],
                          ),
                        ),*/
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
