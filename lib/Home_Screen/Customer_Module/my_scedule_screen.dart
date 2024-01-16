import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shalimar/Controller/get_customer_schedule_data_controller.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class MyScedulePage extends StatefulWidget {
  const MyScedulePage({super.key});

  @override
  State<MyScedulePage> createState() => _MyScedulePageState();
}

class _MyScedulePageState extends State<MyScedulePage> {
  final TextEditingController _searchController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<GetScheduleDataController>(
            init: GetScheduleDataController(),
            builder: (GetScheduleDataController controller) {
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
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                                    controller: _searchController,
                                    textInputAction: TextInputAction.search,
                                    textCapitalization:
                                        TextCapitalization.words,
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
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                  ),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                                    child: Card(
                                      child: controller.getScheduleDataModel ==
                                                  null ||
                                              controller.getScheduleDataModel!
                                                      .data!.length ==
                                                  0
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Center(
                                                child: Text(
                                                  "No Data Available",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            )
                                          : ListView.builder(
                                              itemCount: controller
                                                  .getScheduleDataModel!
                                                  .data!
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return controller
                                                  .getScheduleDataModel!
                                                  .data![index]!
                                                    .schdulefor!
                                                    .toLowerCase()
                                                    .contains(_searchController
                                                        .text
                                                        .toLowerCase())
                                                ?
                                                
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                primaryColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    "Schedule For: ${controller.getScheduleDataModel!.data![index].schdulefor}"),
                                                                Text(
                                                                    "Date: ${controller.getScheduleDataModel!.data![index].date}")
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    "Start Time: ${controller.getScheduleDataModel!.data![index].starttime}"),
                                                                Text(
                                                                    "End Time: ${controller.getScheduleDataModel!.data![index].endtime}"),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                          ]),
                                                    ),
                                                  ),
                                                ): SizedBox();
                                              },
                                            ),
                                    ),
                                  )
                                
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
