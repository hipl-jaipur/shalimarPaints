import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/region_data_controller.dart';
import 'package:shalimar/Elements/zone_list.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class MyCustomerRegionsPage extends StatefulWidget {
  const MyCustomerRegionsPage({super.key});

  @override
  State<MyCustomerRegionsPage> createState() => _MyCustomerRegionsPageState();
}

class _MyCustomerRegionsPageState extends State<MyCustomerRegionsPage> {
  final TextEditingController _searchController = TextEditingController();
  RegionDataController regionDataController = Get.put(RegionDataController());

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
                () => regionDataController.isLoading.value
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
                            Text(
                                "Regions - ${regionDataController.regionDataModel!.data![0].zoneName.toString()}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Text(
                                "Count: ${regionDataController.regionDataModel!.data!.length}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                                child: ListView.builder(
                                  itemCount: regionDataController
                                          .regionDataModel!.data!.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    return regionDataController.regionDataModel!
                                            .data![index].regionName!
                                            .toLowerCase()
                                            .contains(_searchController.text
                                                .toLowerCase())
                                        ? regionList(
                                            context,
                                            index,
                                            regionDataController.regionDataModel!,
                                            )
                                        : SizedBox();
                                  },
                                )),
                            // cardList("Region", "Kerla",
                            //     "Anindya Banerjee (General Manager)", false),
                            // cardList("Region", "Karnataka",
                            //     "Anindya Banerjee (General Manager)", false),
                            // cardList("Region", "Tamilnadu",
                            //     "Anindya Banerjee (General Manager)", false),
                            // cardList("Region", "Telangana",
                            //     "Anindya Banerjee (General Manager)", false),
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
