import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/terriotory_data_controller.dart';
import 'package:shalimar/Elements/zone_list.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class MyCustomerTerriotoryPage extends StatefulWidget {
  const MyCustomerTerriotoryPage({super.key});

  @override
  State<MyCustomerTerriotoryPage> createState() =>
      _MyCustomerTerriotoryPageState();
}

class _MyCustomerTerriotoryPageState extends State<MyCustomerTerriotoryPage> {
  @override
  final TextEditingController _searchController = TextEditingController();
  TerriotoryDataController terriotoryDataController =
      Get.put(TerriotoryDataController());
  String terriotoryName = Get.arguments;

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
                () => terriotoryDataController.isLoading.value
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
                                "Terriotory - ${terriotoryName
                                // terriotoryDataController.terriotoryDataModel!.data![0].depotName.toString()
                                }",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Text(
                                terriotoryDataController.terriotoryDataModel ==
                                        null
                                    ? "Count: 0"
                                    : "Count: ${terriotoryDataController.terriotoryDataModel!.data!.length}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 20,
                            ),
                            terriotoryDataController.terriotoryDataModel != null
                                ? Expanded(
                                    child: ListView.builder(
                                      itemCount: terriotoryDataController
                                              .terriotoryDataModel!
                                              .data!
                                              .length ??
                                          0,
                                      itemBuilder: (context, index) {
                                        return terriotoryDataController.terriotoryDataModel!
                                            .data![index].territoryName!
                                            .toLowerCase()
                                            .contains(_searchController.text
                                                .toLowerCase())?
                                        
                                        
                                        terriotoryList(
                                          context,
                                          index,
                                          terriotoryDataController
                                              .terriotoryDataModel!,
                                        ) : SizedBox();
                                      },
                                    ),
                                  )
                                : Card(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                        child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Text(
                                                terriotoryDataController
                                                    .noRecord.value,
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
            )
          ],
        ),
      ),
    );
  }
}
