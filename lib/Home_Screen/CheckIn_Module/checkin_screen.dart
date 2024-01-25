import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shalimar/Controller/activity_controller.dart';
import 'package:shalimar/Controller/get_available_stock_data-controller.dart';
import 'package:shalimar/Controller/get_customer_data_controller.dart';
import 'package:shalimar/Controller/get_customer_note_data_controller.dart';
import 'package:shalimar/Controller/get_customer_schedule_data_controller.dart';
import 'package:shalimar/Controller/get_global_parameter_data_controller.dart';
import 'package:shalimar/Controller/get_order_data_controller.dart';
import 'package:shalimar/Controller/get_user_activity_master_data_controller.dart';
import 'package:shalimar/Controller/plant_data_controller.dart';
import 'package:shalimar/Controller/product_data_controller.dart';
import 'package:shalimar/Controller/set_activity_detail_data_controller.dart';
import 'package:shalimar/Controller/set_order_data_controller.dart';
import 'package:shalimar/Controller/subcategory_data_controller.dart';
import 'package:shalimar/Controller/teams_controller.dart';
import 'package:shalimar/Controller/timer_controller.dart';
import 'package:shalimar/Elements/timer_widget.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/collect_payment_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/make_complain_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/schedule_visit_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/take_note_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/take_order_screen.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/view_open_order_screen.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/consts.dart';
import 'package:shalimar/utils/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckInPage extends StatefulWidget {
  String? tag;
  // String? levelName;
  // String? levelCode;
  // String? levelAddress;
  // bool? isCheckinOnSite;
  // var startTime;

  CheckInPage({
    super.key,
    this.tag,
    // this.startTime
    // this.levelName,
    // this.levelCode,
    // this.levelAddress,
    // this.isCheckinOnSite,
  });

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  GetCustomerDataController getCustomerDataController =
      Get.put(GetCustomerDataController());
  SetActivityDetailDataController controller =
      Get.put(SetActivityDetailDataController());

  GetAvailableStockDataController stockController =
      Get.put(GetAvailableStockDataController());

  PlantDataController plantDataController = Get.put(PlantDataController());

  SubCategoryDataController subCategoryDataController =
      Get.put(SubCategoryDataController());

  ProductDataController productDataController =
      Get.put(ProductDataController());

  SetOrderDataController setOrderDataController =
      Get.put(SetOrderDataController());

  GetOrderDataController orderDataController =
      Get.put(GetOrderDataController());

  GetNoteDataController noteDataController = Get.put(GetNoteDataController());
  GetScheduleDataController scheduleDataController =
      Get.put(GetScheduleDataController());
  GetUserActivityController getUserActivityController =
      Get.put(GetUserActivityController());
  ActivityController activityController = Get.put(ActivityController());
  GetGlobalParameterDataController getGlobalParameterDataController =
      Get.put(GetGlobalParameterDataController());
  TeamsController teamsController = Get.put(TeamsController());

  // TimerService timerService = Get.find<TimerService>();
  // final TimerController timerController = TimerController();
  final TimerService timerService = Get.put(TimerService());
  var profileImage = "";
  var isLock = false;
  var profileSkip;
  File? _imageFile;
  final List<File> imagesList = [];


Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 25,
        maxHeight: 480,
        maxWidth: 640);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        print("ImageList1: $_imageFile");
        imagesList.add(_imageFile!);
      });
      String imgpath = pickedFile.path;
      File imgfile = File(imgpath);
      Uint8List imgbytes = await imgfile.readAsBytes();
      String bs4str = base64.encode(imgbytes);
      print("ImageList2: $bs4str");

      
    }
  }
  void _modalBottomSheetMenu() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
          isDismissible: true,
          context: context,
          builder: (builder) {
            return Obx(
              () => getGlobalParameterDataController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : WillPopScope(
                      onWillPop: () async => true,
                      child: Container(
                        height: 150,
                        color: Colors
                            .transparent, //could change this to Color(0xFF737373),
                        //so you don't have to change MaterialApp canvasColor
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0))),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  "Please take customer picture before proceeding",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                    "This is occasional customer update process. Please comply",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300)),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 100.0, vertical: 10.0),
                                  child: GestureDetector(
                                    onTap: () {_pickImage();},
                                    child: Container(
                                      decoration:
                                          BoxDecoration(color: primaryColor),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "Take Photo",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    Get.back();
                                    SharedPreferences pref =
                                        await SharedPreferences.getInstance();
                                    var empID = pref.getInt("EmployeeId");
                                    teamsController.getEmployData(empID);
                                    var skipProfile =
                                        pref.getInt("ProfileSkip");
                                    if (skipProfile! <=
                                        int.parse(profileSkip)) {
                                      Get.back();
                                      controller.fetchData(
                                          levelCode: controller.levelCode.value,
                                          activityID: 11);
                                      teamsController.update();
                                    } else {
                                      Get.back();
                                      Get.dialog(
                                          barrierDismissible: false,
                                          Dialog(
                                            backgroundColor: Colors.white,
                                            child: WillPopScope(
                                              onWillPop: () async => false,
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        "Please Update Profile.",
                                                        style: TextStyle(
                                                            color: primaryColor,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      child: Text(
                                                        "You have already Skip Profile.",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Center(
                                                        child: Container(
                                                          height: 40,
                                                          width: 60,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  primaryColor,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                      Radius.circular(
                                                                          10))),
                                                          child: Text(
                                                            "Ok",
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ));
                                    }
                                  },
                                  child: const Text(
                                    "Skip",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
            );
          });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getId();
    super.initState();

    getGlobalParameterDataController.fetchData().then((value) {
      if (value != null) {
        profileSkip = value!.data![0].parameterValue;
      }
    });

    // teamsController.getTeamsData();

    if (Get.arguments == 0.0) {
      _modalBottomSheetMenu();
    }

    getCustomerDataController
        .fetchData(controller.customerId, controller.territoryId)
        .then((value) {
      if (value != null) {
        profileImage = AppConstants.BASE_URL + value!.data![0].column1;
        isLock = value!.data![0].islock ?? false;
      }
    });
    // TimerService().startTimer();
    noteDataController.fetchData(controller.levelCode.value);
    scheduleDataController.fetchData(controller.levelCode.value, 0, true);
    activityController.getActivityData(controller.levelCode.value, employeeId);
  }

  getId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    employeeId = prefs.getInt("EmployeeId")!;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetActivityDetailDataController>(
      init: SetActivityDetailDataController(),
      builder: (setActivityController) {
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
                    child: Stack(
                      children: [
                        Positioned(
                          child: Visibility(
                              visible: controller.checkIn,
                              child: TimerWidget(
                                tag: "",
                              )),
                        ),
                        Obx(
                          () => controller.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 18.0,
                                      left: 18.0,
                                      right: 18.0,
                                      top: setActivityController.checkIn
                                          ? 50.0
                                          : 18.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        // Visibility(
                                        //   visible:
                                        //       controller.isCheckinOnSite.value,
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       Container(
                                        //         padding: EdgeInsets.all(8),
                                        //         decoration: BoxDecoration(
                                        //             color: Colors.white,
                                        //             borderRadius:
                                        //                 BorderRadius.circular(5)),
                                        //         child: Row(
                                        //           children: [
                                        //             Icon(
                                        //               Icons.timer,
                                        //               size: 30,
                                        //               color: primaryColor,
                                        //             ),
                                        //             SizedBox(
                                        //               width: 5.0,
                                        //             ),

                                        //             // Obx(
                                        //             //   () => Text(
                                        //             //       'Timer Count: ${cont.formattedTime(timeInSecond: cont.counter.value)}'),
                                        //             // )

                                        //             Obx(
                                        //               () => Text(
                                        //                 'Checkin Timer: ${timerService.formattedTime(timeInSecond: timerService.elapsedSeconds.value)} ',
                                        //                 style: TextStyle(
                                        //                     fontWeight:
                                        //                         FontWeight.w500),
                                        //               ),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ),
                                        //       GestureDetector(
                                        //         onTap: () {
                                        //           controller.checkIn = false;
                                        //           timerService.stopTimer();
                                        //           controller.fetchData(
                                        //               levelCode: controller
                                        //                   .levelCode.value,
                                        //               activityID: 10);
                                        //           showSnackBar(
                                        //               "You are Checked out at",
                                        //               controller.levelName.value,
                                        //               Colors.greenAccent);
                                        //           Navigator.pop(context);
                                        //           controller.update();
                                        //         },
                                        //         child: Container(
                                        //           padding:
                                        //               const EdgeInsets.all(8),
                                        //           decoration: BoxDecoration(
                                        //               color: Colors.white,
                                        //               borderRadius:
                                        //                   BorderRadius.circular(
                                        //                       5)),
                                        //           child: SingleChildScrollView(
                                        //             child: Row(
                                        //               children: [
                                        //                 Icon(
                                        //                   Icons.logout_outlined,
                                        //                   size: 30,
                                        //                   color: primaryColor,
                                        //                 ),
                                        //                 SizedBox(
                                        //                   width: 5.0,
                                        //                 ),
                                        //                 Text(
                                        //                   "CheckOut",
                                        //                   style: TextStyle(
                                        //                       fontWeight:
                                        //                           FontWeight
                                        //                               .w500),
                                        //                 ),
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Card(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  child: SizedBox(
                                                    width: 80,
                                                    height: 80,
                                                    child: Obx(
                                                      () =>
                                                          getCustomerDataController
                                                                  .isLoading
                                                                  .value
                                                              ? Center(
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<Color>(
                                                                            primaryColor),
                                                                  ),
                                                                )
                                                              : CircleAvatar(
                                                                  backgroundImage:
                                                                      NetworkImage(profileImage !=
                                                                              null
                                                                          ? profileImage
                                                                          : ""),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,

                                                                  // child: Icon(
                                                                  //   Icons.person_sharp,
                                                                  //   size: 50,
                                                                  // ),
                                                                ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Flexible(
                                                  child: FittedBox(
                                                    fit: BoxFit.fill,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: 250,
                                                              child: Text(
                                                                  controller
                                                                      .levelName
                                                                      .value,
                                                                  maxLines: 2,
                                                                  style: TextStyle(
                                                                      color:
                                                                          blackTextColor,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400)),
                                                            ),
                                                            Visibility(
                                                              visible:
                                                                  isLock != null
                                                                      ? isLock
                                                                      : false,
                                                              child: IconButton(
                                                                onPressed:
                                                                    () {},
                                                                icon: Icon(
                                                                  Icons.edit,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                            "ID: ${controller.levelCode.value}",
                                                            style: TextStyle(
                                                                color:
                                                                    blackTextColor,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400)),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 250,
                                                          child: Text(
                                                            controller
                                                                .levelAddress
                                                                .value,
                                                            maxLines: 2,
                                                            style: TextStyle(
                                                                color:
                                                                    primaryColor,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                            textAlign:
                                                                TextAlign.start,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Schedules",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                getUserActivityController
                                                    .fetchData();
                                                Get.to(ScheduleVisitPage());
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Add",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    Icon(
                                                      Icons.add_box_rounded,
                                                      size: 30,
                                                      color: primaryColor,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        GetBuilder<GetScheduleDataController>(
                                            init: GetScheduleDataController(),
                                            builder: (scheduleDataController) {
                                              return SizedBox(
                                                  height: 250.0,
                                                  child: Card(
                                                    child: scheduleDataController
                                                                    .getScheduleDataModel ==
                                                                null ||
                                                            scheduleDataController
                                                                    .getScheduleDataModel!
                                                                    .data!
                                                                    .length ==
                                                                0
                                                        ? Center(
                                                            child: Text(
                                                              "No Data Available",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          )
                                                        : ListView.builder(
                                                            itemCount:
                                                                scheduleDataController
                                                                    .getScheduleDataModel!
                                                                    .data!
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10.0),
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              primaryColor),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child: Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text("Schedule For: ${scheduleDataController.getScheduleDataModel!.data![index].schdulefor}"),
                                                                              Text("Date: ${scheduleDataController.getScheduleDataModel!.data![index].date}")
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text("Start Time: ${scheduleDataController.getScheduleDataModel!.data![index].starttime}"),
                                                                              Text("End Time: ${scheduleDataController.getScheduleDataModel!.data![index].endtime}"),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                        ]),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                  ));
                                            }),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Customer History",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 250.0,
                                          child: Card(
                                            child: activityController
                                                            .activityDataModel ==
                                                        null ||
                                                    activityController
                                                            .activityDataModel!
                                                            .data!
                                                            .length ==
                                                        0
                                                ? Center(
                                                    child: Text(
                                                    "No Data Available",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ))
                                                : ListView.builder(
                                                    itemCount:
                                                        activityController
                                                            .activityDataModel!
                                                            .data!
                                                            .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color:
                                                                      primaryColor),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
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
                                                                          "${activityController.activityDataModel!.data![index].activityName}"),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                      "Code: ${activityController.activityDataModel!.data![index].customerCode}"),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                      "Descriptiion: ${activityController.activityDataModel!.data![index].activityDescription}"),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                      "${activityController.activityDataModel!.data![index].createdOn}")
                                                                ]),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Customer Notes",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(TakeNotePage(),
                                                    arguments: [
                                                      controller
                                                          .levelName.value,
                                                      controller
                                                          .levelCode.value,
                                                      controller
                                                          .levelAddress.value
                                                    ]
                                                    // customerProfileData
                                                    );
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Add",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    Icon(
                                                      Icons.add_box_rounded,
                                                      size: 30,
                                                      color: primaryColor,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        GetBuilder<GetNoteDataController>(
                                            init: GetNoteDataController(),
                                            builder: (noteDataController) {
                                              return SizedBox(
                                                height: 250.0,
                                                child: Card(
                                                  child: noteDataController
                                                                  .getcustomerNoteDataModel ==
                                                              null ||
                                                          noteDataController
                                                                  .getcustomerNoteDataModel!
                                                                  .data!
                                                                  .length ==
                                                              0
                                                      ? Center(
                                                          child: Text(
                                                          "No Data Available",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ))
                                                      : ListView.builder(
                                                          itemCount:
                                                              noteDataController
                                                                  .getcustomerNoteDataModel!
                                                                  .data!
                                                                  .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      10.0),
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color:
                                                                            primaryColor),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              "Note: ${noteDataController.getcustomerNoteDataModel!.data![index].note}",
                                                                              style: TextStyle(color: primaryColor),
                                                                            ),
                                                                            Text("${noteDataController.getcustomerNoteDataModel!.data![index].createdOn}")
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                            "Code: ${noteDataController.getcustomerNoteDataModel!.data![index].customerCode}"),
                                                                        SizedBox(
                                                                          height:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                            "Descriptiion: ${noteDataController.getcustomerNoteDataModel!.data![index].activityDescription}"),
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
                                ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              shape: CircleBorder(),
              // BeveledRectangleBorder(borderRadius: BorderRadius.circular(200)),
              onPressed: showMenu,
              child: Icon(Icons.home_filled),
              elevation: 10.0,
            ),
            bottomNavigationBar: SizedBox(
              height: 40,
              child: BottomAppBar(
                  color: Colors.red[100],
                  shape: const CircularNotchedRectangle(),
                  child: Container()),
            ));
      },
    );
  }

  showMenu() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 36,
                ),
                SizedBox(
                    height: (56 * 6).toDouble(),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: Colors.white,
                        ),
                        child: Stack(
                          alignment: Alignment(0, 0),
                          children: <Widget>[
                            Positioned(
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      "View Open Orders",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: Icon(
                                      Icons.menu_book_outlined,
                                      color: primaryColor,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      orderDataController.fetchOrderData(
                                          customerCode:
                                              controller.levelCode.value);
                                      // setOrderDataController.productList.clear();
                                      setOrderDataController.myCartList!
                                          .clear();
                                      setOrderDataController.myCartEditList!
                                          .clear();
                                      setOrderDataController.total = 0.0;

                                      Get.to(ViewOpenOrderPage(
                                          tag: "View Open Order"));
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Schedule A Visit",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: Icon(
                                      Icons.menu_book_outlined,
                                      color: primaryColor,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      getUserActivityController.fetchData();
                                      Get.to(ScheduleVisitPage());
                                    },
                                  ),
                                  ListTile(
                                      title: Text(
                                        "Take Order",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Icon(
                                        Icons.menu_book_outlined,
                                        color: primaryColor,
                                      ),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        stockController.totalQty = 0;
                                        stockController.totalAmount = 0.0;
                                        stockController.isVisible = false;
                                        stockController.myList.clear();
                                        stockController.d = true;
                                        stockController.i = false;
                                        stockController.catCheck = false;
                                        stockController.sectionlist.clear();
                                        setOrderDataController.total = 0.0;

                                        /*stockController.fetchData(
                                          customerCode:
                                              controller.levelCode.value);*/
                                        setOrderDataController.customerCode
                                            .value = controller.levelCode.value;
                                        setOrderDataController.orderEditTag =
                                            "";
                                        Get.to(TakeOrderPage(
                                          tag: '',
                                        ));
                                      }),
                                  ListTile(
                                    title: Text(
                                      "Make Complain",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: Icon(
                                      Icons.menu_book_outlined,
                                      color: primaryColor,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      Get.to(ComplainPage(),
                                          arguments:
                                              controller.levelCode.value);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Take Notes",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: Icon(
                                      Icons.menu_book_outlined,
                                      color: primaryColor,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      Get.to(TakeNotePage(), arguments: [
                                        controller.levelName.value,
                                        controller.levelCode.value,
                                        controller.levelAddress.value
                                      ]
                                          // customerProfileData
                                          );
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Take Payment",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: Icon(
                                      Icons.menu_book_outlined,
                                      color: primaryColor,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      Get.to(CollectPaymentPage(),
                                          arguments:
                                              controller.levelCode.value);
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))),
              ],
            ),
          );
        });
  }
}
