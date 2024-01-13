import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/get_order_data_controller.dart';
import 'package:shalimar/Elements/orderList.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';

class ViewOpenOrderPage extends StatefulWidget {
  const ViewOpenOrderPage({super.key});

  @override
  State<ViewOpenOrderPage> createState() => _ViewOpenOrderPageState();
}

class _ViewOpenOrderPageState extends State<ViewOpenOrderPage> {
  final TextEditingController _searchController = TextEditingController();
  GetOrderDataController orderDataController =
      Get.put(GetOrderDataController());

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
                () => orderDataController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
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
                            SizedBox(
                              height: 10,
                            ),
                            orderDataController.getOrderDataModel == null
                                ? Card(
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Text(
                                                orderDataController
                                                    .noRecord.value,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)))),
                                  )
                                : Expanded(
                                    child: ListView.builder(
                                      itemCount: orderDataController
                                          .getOrderDataModel!.orderData!.length,
                                      itemBuilder: (context, index) {
                                        return orderDataController
                                                .getOrderDataModel!
                                                .orderData![index]
                                                .ordernumber!
                                                .toLowerCase()
                                                .contains(_searchController.text
                                                    .toLowerCase())
                                            ? OrderList(
                                                context: context,
                                                index: index,
                                                orderDataList:
                                                    orderDataController
                                                        .getOrderDataModel!
                                                        .orderData)
                                            : SizedBox();
                                      },
                                    ),
                                  )
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
