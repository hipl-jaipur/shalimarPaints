import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shalimar/Controller/set_activity_detail_data_controller.dart';
import 'package:shalimar/Elements/commom_snackbar_widget.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

import '../Elements/common_searchbar_widget.dart';
import '../Elements/timer_widget.dart';

class CustomerAttendanceScreen extends StatefulWidget {
  final bool tag;
  final int id;
  const CustomerAttendanceScreen({super.key, required this.tag, required this.id});

  @override
  State<CustomerAttendanceScreen> createState() =>
      _CustomerAttendanceScreenState();
}

class _CustomerAttendanceScreenState extends State<CustomerAttendanceScreen> {
  final TextEditingController _searchController = TextEditingController();

  SetActivityDetailDataController dataController = Get.put(SetActivityDetailDataController());

  var date = "";
  List<String> addresses = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataController.getActivityDetailData(widget.tag,widget.id).whenComplete(() {
      getAddressesFromCoordinatesList();
    });


  }
  Future<void> getAddressesFromCoordinatesList() async {
    for (var coordinates in dataController.getActivityDetailDataModel!.data!) {
      double latitude = coordinates.latitude!;
      double longitude = coordinates.longitude!;

      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

        if (placemarks != null && placemarks.isNotEmpty) {
          Placemark place = placemarks[0];
          setState(() {
            addresses.add("${place.street}, ${place.locality}, ${place.country}");
          });
        } else {
          setState(() {
            addresses.add("Address not found");
          });
        }
      } catch (e) {
        print("Error: $e");
        setState(() {
          addresses.add("Error getting address");
        });
      }
    }
  }
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: GetX<SetActivityDetailDataController>(
            init: SetActivityDetailDataController(),
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
                      child:GetBuilder<SetActivityDetailDataController>(
                        init: SetActivityDetailDataController(),
                        builder: (setActivityController) {
                          return  Stack(

                            children: [
                              Padding(
                                padding: EdgeInsets.all(18.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: setActivityController.checkIn
                                          ? 40
                                          : 20,
                                    ),
                                    widget.tag?  Row(
                                      children: [
                                        Expanded(
                                            child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                side: BorderSide(color: Colors.white),
                                              ),
                                              child: Text("Day Start",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold)),
                                              onPressed: () {
                                                controller.fetchData(
                                                    levelCode: "", activityID: 1).whenComplete(() {
                                                  dataController.getActivityDetailData(widget.tag,widget.id).whenComplete(() {
                                                    getAddressesFromCoordinatesList();
                                                  });
                                                  // getAddressesFromCoordinatesList();


                                                });
                                                showSnackBar(
                                                    "Success",
                                                    "Day Start Successfully.",
                                                    Colors.greenAccent);
                                              },
                                            )),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                            child: OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                  side: BorderSide(color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  controller.fetchData(
                                                      levelCode: "", activityID: 2).whenComplete(() {

                                                    dataController.getActivityDetailData(widget.tag,widget.id).whenComplete(() {
                                                      getAddressesFromCoordinatesList();
                                                    });
                                                    // getAddressesFromCoordinatesList();

                                                  });
                                                  showSnackBar(
                                                      "Success",
                                                      "Day End Successfully.",
                                                      Colors.greenAccent);
                                                },
                                                child: Text("Day End",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold))))
                                      ],
                                    ): searchBar(_searchController),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Summary",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GetBuilder<SetActivityDetailDataController>(
                                        init: SetActivityDetailDataController(),
                                        builder: (controller) {
                                          return Expanded(
                                            child: Card(
                                              child: controller
                                                  .getActivityDetailDataModel ==
                                                  null ||
                                                  controller
                                                      .getActivityDetailDataModel!
                                                      .data!
                                                      .length ==
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
                                                    .getActivityDetailDataModel!
                                                    .data!
                                                    .length,
                                                itemBuilder: (context, index) {

                                                  DateTime time = DateTime.parse(controller.getActivityDetailDataModel!.data![index].createdOn.toString());

                                                  // Format the DateTime object to display in the desired format
                                                  String formattedDateTime = DateFormat('yyyy-MM-dd ( h:mm a )').format(time);

                                                  double latitude =controller.getActivityDetailDataModel!.data![index].latitude;
                                                  double longitude = controller.getActivityDetailDataModel!.data![index].longitude;
                                                  String address = addresses.length > index ? addresses[index] : '';

                                                  return Padding(
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
                                                                      "Activity Name: ${controller.getActivityDetailDataModel!.data![index].activityName}"),
                                                                  // Text(
                                                                  //     "Status: ${controller.getActivityDetailDataModel!.data![index].status}")
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text('Address: $address'),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  "Date: ${formattedDateTime}"),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                            ]),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                              ),
                              Positioned(
                                  child: Visibility(
                                      visible: setActivityController.checkIn,
                                      child: TimerWidget())),
                            ],
                          );

                      },)
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
