import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shalimar/Controller/customer_hire_data_controller.dart';
import 'package:shalimar/Elements/zone_list.dart';
import 'package:shalimar/Model/customer_data_model.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

import '../../Controller/set_activity_detail_data_controller.dart';
import '../../Elements/timer_widget.dart';

class MyCustomerRegionsPage extends StatefulWidget {
  const MyCustomerRegionsPage({super.key});

  @override
  State<MyCustomerRegionsPage> createState() => _MyCustomerRegionsPageState();
}

class _MyCustomerRegionsPageState extends State<MyCustomerRegionsPage> {
  final TextEditingController _searchController = TextEditingController();
  // RegionDataController regionDataController = Get.put(RegionDataController());
  CustomerHireDataController customerHireDataController =
      Get.put(CustomerHireDataController());
  SetActivityDetailDataController setActivityController =
  Get.put(SetActivityDetailDataController());
  List<Data> regionListNew = [];

  var regionName = Get.arguments != null ? Get.arguments[0] : "";
  var levelID = Get.arguments != null ? Get.arguments[1] : "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    regionListNew = levelID != null && levelID != ""
        ? customerHireDataController!.regionsList!
            .where((element) => element.parentLevelID == levelID)
            .toList()
        : customerHireDataController.regionsList;

    print('customerList: $regionListNew');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<CustomerHireDataController>(
          init: CustomerHireDataController(),
          builder: (controller) {
            return ModalProgressHUD(
              inAsyncCall: controller.isLoading.value,
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
                  builder: (controller) {
                    return  Stack(
                      children: [
                        Obx(
                              () => customerHireDataController.isLoading.value
                              ? const Center(
                            child: CircularProgressIndicator(),
                          )
                              : Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:setActivityController.checkIn? 40:20,
                                ),
                                TextField(
                                  controller: _searchController,
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
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    regionName != null && regionName != ""
                                        ? "Regions: $regionName"
                                        : "Regions",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text("Count: ${regionListNew.length}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                  height: 20,
                                ),
                                regionListNew != null && regionListNew != 0
                                    ? Expanded(
                                    child: ListView.builder(
                                      itemCount: regionListNew.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return regionListNew[index]!
                                            .levelName!
                                            .toLowerCase()
                                            .contains(_searchController.text
                                            .toLowerCase())
                                            ? regionList(
                                            context, index, regionListNew)
                                            : SizedBox();
                                      },
                                    ))
                                    : Card(
                                  child: Container(
                                      width:
                                      MediaQuery.of(context).size.width,
                                      child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text("No Record Found",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight:
                                                  FontWeight.bold)))),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            child: Visibility(
                                visible: setActivityController.checkIn,
                                child: TimerWidget())),
                      ],
                    );

                },)
              )
            ],
          ),

            );
          },
         
        ),
      ),
    );
  }
}
