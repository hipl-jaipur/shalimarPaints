import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/get_user_activity_master_data_controller.dart';
import 'package:shalimar/Controller/set_sechedule_controller.dart';
import 'package:shalimar/Elements/common_button_widget.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class ScheduleVisitPage extends StatefulWidget {
  const ScheduleVisitPage({super.key});

  @override
  State<ScheduleVisitPage> createState() => _ScheduleVisitPageState();
}

class _ScheduleVisitPageState extends State<ScheduleVisitPage> {
  SetCustomerScheduleController scheduleController =
      Get.put(SetCustomerScheduleController());
  GetUserActivityController controller = Get.put(GetUserActivityController());
  // final TextEditingController dateController = TextEditingController();
  // final TextEditingController startTimeController = TextEditingController();
  // final TextEditingController endTimeController = TextEditingController();
  int? selectedOption;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        scheduleController.dateController.text =
            '${picked.toLocal()}'.split(' ')[0];
      });
    }
  }

  TimeOfDay? _selectedTime;
  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        scheduleController.startTimeController.text =
            _selectedTime!.format(context);
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        scheduleController.endTimeController.text =
            _selectedTime!.format(context);
      });
    }
  }

  // List<String> selectedOptions = [];
  void _onCheckboxChanged(String remark, bool value, num? userActivityID) {
    setState(() {
      if (value) {
        scheduleController.scheduleDetailsMaster
            .add({"useractivityid": userActivityID, "remark": remark});
      } else {
        scheduleController.scheduleDetailsMaster
            .remove({"useractivityid": userActivityID, "remark": remark});
      }
    });
  }

  final _formKey = GlobalKey<FormState>();

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
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.arrow_circle_left,
                                  color: Colors.white,
                                  size: 40,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Schedule A Visit",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SingleChildScrollView(
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Radio(
                                              value: 1,
                                              activeColor:
                                                  primaryColor, // Change the active radio button color here
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      primaryColor),
                                              groupValue: selectedOption,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedOption = value!;
                                                  scheduleController.schdulefor
                                                      .value = "Visit";
                                                  print("Button value: $value");
                                                });
                                              },
                                            ),
                                            Text(
                                              'Visit',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Radio(
                                              value: 2,
                                              groupValue: selectedOption,
                                              activeColor:
                                                  primaryColor, // Change the active radio button color here
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      primaryColor),
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedOption = value!;
                                                  scheduleController.schdulefor
                                                      .value = "Call";
                                                  print(
                                                      "Button value: ${scheduleController.schdulefor.value}");
                                                });
                                              },
                                            ),
                                            Text(
                                              'Call',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                      controller:
                                          scheduleController.dateController,
                                      readOnly: true,
                                      onChanged: (value) {
                                        setState(() {
                                          "${selectedDate.toLocal()}"
                                              .split(' ')[0];
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "The Schedule Date is required.";
                                        }
                                        return null;
                                      },
                                      enabled: true,
                                      maxLines: 1,
                                      cursorColor: Colors.black,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.calendar_month,
                                            color: Colors.black,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
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
                                                color: Colors
                                                    .black), //<-- SEE HERE
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          hintText: "Schedule Date",
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          labelText: "Schedule Date",
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          focusColor: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            onTap: () {
                                              _selectStartTime(context);
                                            },
                                            controller: scheduleController
                                                .startTimeController,
                                            readOnly: true,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The Start Time is required.";
                                              }
                                              return null;
                                            },
                                            enabled: true,
                                            maxLines: 1,
                                            cursorColor: Colors.black,
                                            style:
                                                TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                border: OutlineInputBorder(),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    3)),
                                                        borderSide: BorderSide(
                                                          color: Colors.black,
                                                        )),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .black), //<-- SEE HERE
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                hintText: "Start Time",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "Start Time",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            onTap: () {
                                              _selectEndTime(context);
                                            },
                                            controller: scheduleController
                                                .endTimeController,
                                            readOnly: true,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "The End Time is required.";
                                              }
                                              return null;
                                            },
                                            enabled: true,
                                            maxLines: 1,
                                            cursorColor: Colors.black,
                                            style:
                                                TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                border: OutlineInputBorder(),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    3)),
                                                        borderSide: BorderSide(
                                                          color: Colors.black,
                                                        )),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .black), //<-- SEE HERE
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                hintText: "End Time",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                labelText: "End Time",
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                focusColor: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Activities",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                      textAlign: TextAlign.start,
                                    ),
                                    // controller.activitityData != null
                                    //     ? Container(
                                    //         height: 300,
                                    //         child:

                                    //         ListView.builder(
                                    //           itemCount: controller
                                    //               .activitityData!.data!.length,
                                    //           itemBuilder: (context, index) {
                                    //             return CheckboxListTile(
                                    //               title: Text(controller
                                    //                   .activitityData!
                                    //                   .data![index]
                                    //                   .activityName
                                    //                   .toString()),
                                    //               value: scheduleController
                                    //                   .scheduleDetailsMaster
                                    //                   .contains(controller
                                    //                       .activitityData!
                                    //                       .data![index]
                                    //                       .activityName
                                    //                       .toString()),
                                    //               onChanged: (bool? value) {
                                    //                 _onCheckboxChanged(
                                    //                     controller
                                    //                         .activitityData!
                                    //                         .data![index]
                                    //                         .activityName
                                    //                         .toString(),
                                    //                     value!,
                                    //                     controller
                                    //                         .activitityData!
                                    //                         .data![index]
                                    //                         .userActivityID);
                                    //               },
                                    //             );
                                    //           },
                                    //         ))
                                    //     : SizedBox(),

                                    controller.activitityData != null
                                        ? Container(
                                            height: 300,
                                            child: ListView.builder(
                                              itemCount: controller
                                                  .activitityData!.data!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Row(
                                                  children: [
                                                    Checkbox(
                                                        value: controller
                                                            .sectionlist
                                                            .contains(controller
                                                                .activitityData!
                                                                .data![index]
                                                                .userActivityID),
                                                        onChanged: (v) {
                                                          if (controller
                                                              .sectionlist
                                                              .contains(controller
                                                                  .activitityData!
                                                                  .data![index]
                                                                  .userActivityID)) {
                                                            controller
                                                                .sectionlist
                                                                .remove(controller
                                                                    .activitityData!
                                                                    .data![
                                                                        index]
                                                                    .userActivityID);
                                                          } else {
                                                            controller
                                                                .sectionlist
                                                                .add(controller
                                                                    .activitityData!
                                                                    .data![
                                                                        index]
                                                                    .userActivityID);
                                                          }

                                                          controller.update();
                                                          print(controller
                                                              .sectionlist);
                                                        }),
                                                    Container(
                                                      child: Text(
                                                        controller
                                                            .activitityData!
                                                            .data![index]
                                                            .activityName
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontFamily: 'Raleway',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      enabled: true,
                                      maxLines: 2,
                                      controller:
                                          scheduleController.remarkController,
                                      cursorColor: Colors.black,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  20.0, 40.0, 20.0, 0.0),
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3)),
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                              )),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors
                                                    .black), //<-- SEE HERE
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          hintText: "Remark",
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          labelText: "Remark",
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          focusColor: Colors.black),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "The Remark is required.";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomButton(
                                      btnName: "Submit",
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          scheduleController.fetchData(
                                              context: context);
                                        }
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
