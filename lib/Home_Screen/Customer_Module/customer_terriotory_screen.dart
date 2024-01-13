import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/customer_hire_data_controller.dart';
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
  // TerriotoryDataController terriotoryDataController =  Get.put(TerriotoryDataController());
  // String terriotoryName = Get.arguments;
  CustomerHireDataController customerHireDataController =
      Get.put(CustomerHireDataController());

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
                            Text("Terriotory",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Text(
                                "Count: ${customerHireDataController.terriotoryList.length}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 20,
                            ),
                            customerHireDataController.terriotoryList != null
                                ? Expanded(
                                    child: ListView.builder(
                                      itemCount: customerHireDataController
                                              .terriotoryList.length ??
                                          0,
                                      itemBuilder: (context, index) {
                                        return customerHireDataController.terriotoryList![index]
                                                .levelName!
                                                .toLowerCase()
                                                .contains(_searchController.text
                                                    .toLowerCase())
                                            ? terriotoryList(
                                                context,
                                                index
                                              )
                                            : SizedBox();
                                      },
                                    ),
                                  )
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
            )
          ],
        ),
      ),
    );
  }
}
