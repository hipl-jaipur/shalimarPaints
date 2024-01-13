import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/get_available_stock_data-controller.dart';
import 'package:shalimar/Elements/common_order-widget.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/cart_screen.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

import '../../Elements/filter_sheet_widget.dart';

class TakeOrderPage extends StatefulWidget {
  const TakeOrderPage({super.key});

  @override
  State<TakeOrderPage> createState() => _TakeOrderPageState();
}

class _TakeOrderPageState extends State<TakeOrderPage> {
  final TextEditingController _searchController = TextEditingController();
  GetAvailableStockDataController stockController =
      Get.put(GetAvailableStockDataController());

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetAvailableStockDataController>(
        init: GetAvailableStockDataController(),
    builder: (stockDataController) {
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
              child:  stockController.isLoading
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
                                onPressed: () {

                                  showTopModalSheet<String?>(context, DumyModal());
                                },
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
                        stockController
                            .filterAvailableStockDataModel!.data !.isNotEmpty
                            ? Expanded(
                            child: ListView.builder(
                              itemCount: stockController.filterAvailableStockDataModel!.data!.length,
                              itemBuilder: (context, index) {
                                return stockController
                                    .availableStockDataModel!
                                    .data![index]
                                    .productdesc!
                                    .toLowerCase()
                                    .contains(_searchController.text
                                    .toLowerCase())
                                    ? TakeOrderList(
                                    index: index,
                                    context: context,
                                    availableStockDataModel:
                                    stockController.filterAvailableStockDataModel!)
                                    : SizedBox();
                              },
                            ))
                            : Card(
                          child: Container(
                              width:
                              MediaQuery.of(context).size.width,
                              child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text("No Product Available",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight:
                                          FontWeight.bold)))),
                        ),
                        Visibility(
                          visible: stockController.isVisible,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(MyCartPage());
                            },
                            child: Container(
                              height: 50,
                              child: Center(
                                  child: Text("(${stockController.totalQty}) CONTINUE ")),
                            ),
                          ),
                        )
                      ],
                    )),

            )
          ],
        ),
      ),
    );

        });
  }
}
