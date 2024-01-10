import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/zone_data_controller.dart';
import 'package:shalimar/Elements/zone_list.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class MyCustomerZonePage extends StatefulWidget {
  const MyCustomerZonePage({super.key});

  @override
  State<MyCustomerZonePage> createState() => _MyCustomerZonePageState();
}

class _MyCustomerZonePageState extends State<MyCustomerZonePage> {
  final TextEditingController _searchController = TextEditingController();

  ZoneDataController zoneDataController = Get.put(ZoneDataController());

  @override
  void initState() {
    // TODO: implement initState
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
              child: Obx(
                () => zoneDataController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
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
                            Text("Zones",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Text(
                                zoneDataController.zoneDataModel != null
                                    ? "Count: ${zoneDataController.zoneDataModel!.data!.length}"
                                    : "",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: zoneDataController
                                        .zoneDataModel!.data!.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  return zoneDataController
                                          .zoneDataModel!.data![index].zoneName!
                                          .toLowerCase()
                                          .contains(_searchController.text
                                              .toLowerCase())
                                      ? zoneList(
                                          context,
                                          index,
                                          zoneDataController.zoneDataModel!,
                                        )
                                      : SizedBox();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
