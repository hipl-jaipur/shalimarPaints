import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/depot_data_controller.dart';
import 'package:shalimar/Controller/outstanding_controller.dart';
import 'package:shalimar/Controller/region_data_controller.dart';
import 'package:shalimar/Controller/terriotory_data_controller.dart';
import 'package:shalimar/Controller/zone_data_controller.dart';
import 'package:shalimar/Elements/common_button_widget.dart';
import 'package:shalimar/Elements/common_searchbar_widget.dart';
import 'package:shalimar/Home_Screen/OutStanding_Module/outstanding_zone_screen.dart';
import 'package:shalimar/Model/depot_data_model.dart';
import 'package:shalimar/Model/region_data_model.dart';
import 'package:shalimar/Model/terriotory_data_model.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

import '../../Model/zone_data_model.dart';

class OutStandingScreen extends StatefulWidget {
  const OutStandingScreen({super.key});

  @override
  State<OutStandingScreen> createState() => _OutStandingScreenState();
}

class _OutStandingScreenState extends State<OutStandingScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController zoneController = TextEditingController();
  final TextEditingController regionController = TextEditingController();

  TextEditingController editingController = TextEditingController();

  final FocusNode focusNode = FocusNode();
  final GlobalKey autocompleteKey = GlobalKey();
  ZoneDataController zoneDataController = Get.put(ZoneDataController());
  RegionDataController regionDataController = Get.put(RegionDataController());
  DepotDataController depotDataController = Get.put(DepotDataController());
  TerriotoryDataController terriotoryDataController =
      Get.put(TerriotoryDataController());
  OutStandingController outStandingController =
      Get.put(OutStandingController());
  String subCatDropdownvalue = "Select Zone";
  var regionDropdownvalue = "Select Region";
  var territoryDropdownvalue = "Select Territory";
  var territoryId = "";
  var zoneId = "";
  var depotId = "";
  var regionId = "";
  var depotDropdownvalue = "Select Depot";

  // String subCatDropdownvalue = 'Sub Category';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    zoneDataController.fetchZoneData(zoneId: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => zoneDataController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
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
                          Text("Total Dues",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<Data>(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 0.0, 20.0, 0.0),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3)),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black), //<-- SEE HERE
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  isExpanded: true,
                                  // Initial Value
                                  // value: ,
                                  hint: subCatDropdownvalue == "" ||
                                          subCatDropdownvalue == null
                                      ? Text("Select Zone")
                                      : Text(subCatDropdownvalue),
                                  // Down Arrow Icon
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: primaryLight,
                                  ),

                                  // Array list of items
                                  items: zoneDataController.zoneDataModel!.data!
                                      .map((Data option) {
                                    return DropdownMenuItem<Data>(
                                      value: option,
                                      child: Text(option.zoneName.toString()),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (val) {
                                    depotId = "";
                                    territoryId = "";
                                    regionId = "";

                                    regionDataController.selectRegion.value =
                                        false;
                                    subCatDropdownvalue =
                                        val!.zoneName!.toString();
                                    regionDropdownvalue = "Select Region";

                                    zoneId = val!.zoneId.toString();
                                    regionDataController
                                        .fetchData(
                                            zoneId: int.parse(
                                                val.zoneId.toString()))
                                        .then((value) {
                                      setState(() {
                                        regionDataController
                                            .selectRegion.value = true;
                                      });
                                    });
                                    depotDropdownvalue = "Select Region";
                                    territoryDropdownvalue = "Select Territory";
                                    depotDataController.selectDepot.value =
                                        false;
                                    terriotoryDataController
                                        .selectTerritory.value = false;

                                    regionDataController.update();
                                    zoneDataController.update();
                                    setState(() {});
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              regionDataController.selectRegion.value
                                  ? Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        padding: EdgeInsets.only(left: 22),
                                        child: DropdownButton<RegionList>(
                                          icon: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 22),
                                            child: Icon(
                                              Icons.keyboard_arrow_down_sharp,
                                              color: primaryLight,
                                            ),
                                          ),
                                          hint: regionDropdownvalue == ''
                                              ? Text(
                                                  'Select Region',
                                                  // style: theme
                                                  //     .textTheme.titleMedium!,
                                                )
                                              : Text(
                                                  regionDropdownvalue,
                                                  // style: theme
                                                  //     .textTheme.titleMedium!
                                                  //     .copyWith(
                                                  //     color:
                                                  //     appTheme.black900),
                                                ),
                                          items: regionDataController
                                                  .selectRegion.value
                                              ? regionDataController
                                                  .regionDataModel!.data!
                                                  .map((RegionList value) {
                                                  return DropdownMenuItem<
                                                      RegionList>(
                                                    value: value,
                                                    child: Text(
                                                      value.regionName
                                                          .toString(),
                                                    ),
                                                  );
                                                }).toList()
                                              : null,
                                          onChanged: (val) {
                                            territoryId = "";
                                            depotId = "";
                                            regionDropdownvalue =
                                                val!.regionName!.toString();
                                            regionId = val!.regionId.toString();
                                            depotDataController
                                                .fetchData(
                                                    regionId: int.parse(val
                                                        .regionId
                                                        .toString()))
                                                .then((value) {
                                              setState(() {
                                                depotDataController
                                                    .selectDepot.value = true;
                                              });
                                            });

                                            terriotoryDataController
                                                .selectTerritory.value = false;
                                            depotDropdownvalue =
                                                "Select Region";
                                            territoryDropdownvalue =
                                                "Select Territory";
                                            setState(() {});
                                          },
                                          underline: SizedBox(),
                                          isExpanded: true,
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Select Region',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down_sharp,
                                              color: primaryLight,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              depotDataController.selectDepot.value
                                  ? Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: DropdownButton<DepotList>(
                                          // style: theme.textTheme.titleMedium!
                                          //     .copyWith(color: appTheme.black900),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            color: primaryLight,
                                          ),
                                          hint: depotDropdownvalue == ''
                                              ? Text(
                                                  'Select Depot',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15),
                                                  // style: theme
                                                  //     .textTheme.titleMedium!,
                                                )
                                              : Text(
                                                  depotDropdownvalue,
                                                  // style: theme
                                                  //     .textTheme.titleMedium!
                                                  //     .copyWith(
                                                  //     color:
                                                  //     appTheme.black900),
                                                ),
                                          items: depotDataController
                                                  .selectDepot.value
                                              ? depotDataController
                                                  .depotDataModel!.data!
                                                  .map((DepotList value) {
                                                  return DropdownMenuItem<
                                                      DepotList>(
                                                    value: value,
                                                    child: Text(
                                                      value.depotName
                                                          .toString(),
                                                    ),
                                                  );
                                                }).toList()
                                              : null,
                                          onChanged: (val) {
                                            territoryId = "";
                                            depotDropdownvalue =
                                                val!.depotName!.toString();
                                            depotId = val!.depotId.toString();
                                            terriotoryDataController
                                                .fetchData(
                                              depotId: int.parse(
                                                  val.depotId.toString()),
                                            )
                                                .then((value) {
                                              setState(() {
                                                terriotoryDataController
                                                    .selectTerritory
                                                    .value = true;
                                                terriotoryDataController
                                                        .terriotoryDataModel!
                                                        .data!
                                                        .isNotEmpty
                                                    ? territoryDropdownvalue =
                                                        "Select Territory"
                                                    : territoryDropdownvalue =
                                                        "No List Found";
                                              });
                                            });

                                            territoryDropdownvalue =
                                                "Select Territory";
                                            setState(() {});
                                            /* controller.stateErrorShow.value=false;
                                                  controller.itemValueState.value =
                              val!.name.toString();
                                                  controller.stateController.text =
                              val!.id.toString();

                                                  cuntry.getCityData(val.id);
                                                  controller.itemValueCity.value = "";
                                                  controller.selectCity.value = true;
                                                  controller.update();*/
                                          },
                                          underline: SizedBox(),
                                          isExpanded: true,
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Select Depot',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down_sharp,
                                              color: primaryLight,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                width: 12,
                              ),
                              terriotoryDataController.selectTerritory.value
                                  ? Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: DropdownButton<TerriotoryList>(
                                          // style: theme.textTheme.titleMedium!
                                          //     .copyWith(color: appTheme.black900),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            color: primaryLight,
                                          ),
                                          hint: regionDropdownvalue == ''
                                              ? Text(
                                                  'Select Region',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15),
                                                  // style: theme
                                                  //     .textTheme.titleMedium!,
                                                )
                                              : Text(
                                                  territoryDropdownvalue,
                                                  // style: theme
                                                  //     .textTheme.titleMedium!
                                                  //     .copyWith(
                                                  //     color:
                                                  //     appTheme.black900),
                                                ),
                                          items: terriotoryDataController
                                                  .selectTerritory.value
                                              ? terriotoryDataController
                                                  .terriotoryDataModel!.data!
                                                  .map((TerriotoryList value) {
                                                  return DropdownMenuItem<
                                                      TerriotoryList>(
                                                    value: value,
                                                    child: Text(
                                                      value.territoryName
                                                          .toString(),
                                                    ),
                                                  );
                                                }).toList()
                                              : null,
                                          onChanged: (val) {
                                            territoryDropdownvalue =
                                                val!.territoryName!.toString();
                                            territoryId =
                                                val!.territoryid.toString();
                                            print(territoryId);
                                            setState(() {});
                                          },
                                          underline: SizedBox(),
                                          isExpanded: true,
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Select Territory',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down_sharp,
                                              color: primaryLight,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              outStandingController.isLoading.value
                                  ? Expanded(
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: CustomButton(
                                          btnName: "Get Report",
                                          onPressed: () {
                                            outStandingController.day30.value =
                                                0.0;
                                            outStandingController.day60.value =
                                                0.0;
                                            outStandingController.day90.value =
                                                0.0;
                                            outStandingController.day120.value =
                                                0.0;
                                            outStandingController.day180.value =
                                                0.0;
                                            outStandingController
                                                .over180days.value = 0.0;
                                            outStandingController
                                                .totalPrice.value = 0.0;
                                            outStandingController
                                                .getOutStandingData(
                                              zoneId,
                                              regionId,
                                              territoryId,
                                              depotId,
                                            );
                                          }),
                                    ),
                              SizedBox(
                                width: 10,
                              ),
                              outStandingController.isLoading2.value
                                  ? Expanded(
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: CustomButton(
                                          btnName: "Get All Report",
                                          onPressed: () {
                                            /*  outStandingController.day30.value=0.0;
                                   outStandingController.day60.value=0.0;
                                   outStandingController. day90.value=0.0;
                                   outStandingController. day120.value=0.0;
                                   outStandingController. day180.value=0.0;
                                   outStandingController. over180days.value=0.0;
                                   outStandingController. totalPrice.value=0.0;
                                   outStandingController.getOutStandingData(
                                     zoneId,
                                     regionId,
                                     territoryId,
                                     depotId,
                                   );*/
                                          }),
                                    ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Obx(
                            () => outStandingController
                                    .customerOsDataList.isNotEmpty
                                ? Container(
                                    color: Color(0xffFFD7D7),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(12),
                                          color: primaryColor,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Duration",
                                                style: TextStyle(
                                                    color: primaryLight,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Nunito Sans'),
                                              ),
                                              Text(
                                                "Price",
                                                style: TextStyle(
                                                    color: primaryLight,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Nunito Sans'),
                                              )
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(OutStandingZone(
                                              zoneName: outStandingController
                                                  .customerOsDataList[0]
                                                  .zoneName
                                                  .toString(),
                                              days: '0-30 Days',
                                              price: outStandingController
                                                  .day30.value
                                                  .toStringAsFixed(2),
                                            ));
                                          },
                                          child: Container(
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
                                                Text(
                                                  outStandingController
                                                      .day30.value
                                                      .toStringAsFixed(2),
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
                                        ),
                                        Divider(),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(OutStandingZone(
                                              zoneName: outStandingController
                                                  .customerOsDataList[0]
                                                  .zoneName
                                                  .toString(),
                                              days: '30-60 Days',
                                              price: outStandingController
                                                  .day60.value
                                                  .toStringAsFixed(2),
                                            ));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            color: Color(0xffFFD7D7),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "30-60 Days",
                                                  style: TextStyle(
                                                      color: blackTextColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          'Nunito Sans'),
                                                ),
                                                Text(
                                                  outStandingController
                                                      .day60.value
                                                      .toStringAsFixed(2),
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
                                        ),
                                        Divider(),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(OutStandingZone(
                                              zoneName: outStandingController
                                                  .customerOsDataList[0]
                                                  .zoneName
                                                  .toString(),
                                              days: '60-90 Days',
                                              price: outStandingController
                                                  .day180.value
                                                  .toStringAsFixed(2),
                                            ));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            color: Color(0xffFFD7D7),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "60-90 Days",
                                                  style: TextStyle(
                                                      color: blackTextColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          'Nunito Sans'),
                                                ),
                                                Text(
                                                  outStandingController
                                                      .day180.value
                                                      .toStringAsFixed(2),
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
                                        ),
                                        Divider(),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(OutStandingZone(
                                              zoneName: outStandingController
                                                  .customerOsDataList[0]
                                                  .zoneName
                                                  .toString(),
                                              days: '90-120 Days',
                                              price: outStandingController
                                                  .day180.value
                                                  .toStringAsFixed(2),
                                            ));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            color: Color(0xffFFD7D7),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "90-120 Days",
                                                  style: TextStyle(
                                                      color: blackTextColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          'Nunito Sans'),
                                                ),
                                                Text(
                                                  outStandingController
                                                      .day180.value
                                                      .toStringAsFixed(2),
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
                                        ),
                                        Divider(),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(OutStandingZone(
                                              zoneName: outStandingController
                                                  .customerOsDataList[0]
                                                  .zoneName
                                                  .toString(),
                                              days: '120-180 Days',
                                              price: outStandingController
                                                  .day180.value
                                                  .toStringAsFixed(2),
                                            ));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            color: Color(0xffFFD7D7),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "120-180 Days",
                                                  style: TextStyle(
                                                      color: blackTextColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          'Nunito Sans'),
                                                ),
                                                Text(
                                                  outStandingController
                                                      .day180.value
                                                      .toStringAsFixed(2),
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
                                        ),
                                        Divider(),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(OutStandingZone(
                                              zoneName: outStandingController
                                                  .customerOsDataList[0]
                                                  .zoneName
                                                  .toString(),
                                              days: 'Over 180 Days',
                                              price: outStandingController
                                                  .over180days.value
                                                  .toStringAsFixed(2),
                                            ));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            color: Color(0xffFFD7D7),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Over 180 Days",
                                                  style: TextStyle(
                                                      color: blackTextColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          'Nunito Sans'),
                                                ),
                                                Text(
                                                  outStandingController
                                                      .over180days.value
                                                      .toStringAsFixed(2),
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
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(12),
                                          color: primaryColor,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                outStandingController
                                                    .totalPrice.value
                                                    .toStringAsFixed(2),
                                                style: TextStyle(
                                                    color: primaryLight,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Nunito Sans'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Center(
                                    child: Text("No Data Found",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
    ));
  }
}
