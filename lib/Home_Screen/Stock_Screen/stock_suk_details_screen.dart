import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../Controller/get_available_stock_data-controller.dart';
import '../../Controller/stock_controller.dart';
import '../../Elements/common_searchbar_widget.dart';
import '../../Model/StockShowModel.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

class StockSukDetailsScreen extends StatefulWidget {
  List<StockMaster>? stockDetails;
  final dynamic index;

  StockSukDetailsScreen(
      {super.key, required this.stockDetails, required this.index});

  @override
  State<StockSukDetailsScreen> createState() => _StockSukDetailsScreenState();
}

class _StockSukDetailsScreenState extends State<StockSukDetailsScreen> {
  final TextEditingController _searchController = TextEditingController();

  StockController stockController = Get.put(StockController());

  GetAvailableStockDataController marketSectorController =
      Get.put(GetAvailableStockDataController());
  var total=0.0;
@override
  void initState() {
    // TODO: implement initState
  for(var i in stockController
      .filterStockDataModel!
      .stockMaster![widget.index]
      .stockDetailMaster!){
    total= total+i.availbleQty;

  }
  print(total.toStringAsFixed(0));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StockController>(
        init: StockController(),
        builder: (stockController) {
          return Scaffold(
              body: stockController.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SafeArea(
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
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                searchBar(_searchController),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              stockController
                                                  .filterStockDataModel!
                                                  .stockMaster![widget.index]
                                                  .productcode
                                                  .toString(),
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              stockController
                                                  .filterStockDataModel!
                                                  .stockMaster![widget.index]
                                                  .productdesc
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: primaryColor,
                                  padding: EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Depot Name",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      Text("Stock",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: stockController
                                          .filterStockDataModel!
                                          .stockMaster![widget.index]
                                          .stockDetailMaster!
                                          .isNotEmpty
                                      ? ListView.builder(
                                          itemCount: stockController
                                              .filterStockDataModel!
                                              .stockMaster![widget.index]
                                              .stockDetailMaster!
                                              .length,
                                          itemBuilder: (BuildContext context,
                                              dynamic index) {
                                            return GestureDetector(
                                              child: Container(
                                                color: primaryLight,

                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(6.0),
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
                                                      "${stockController.filterStockDataModel!.stockMaster![widget.index]
                                                .stockDetailMaster![index].depotCode
                                                .toString()}-${stockController.filterStockDataModel!.stockMaster![widget.index]
                                                          .stockDetailMaster![index].depotName
                                                          .toString()}",
                                                              style: TextStyle(
                                                                  color:
                                                                      primaryColor,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          Text(
                                                              stockController.filterStockDataModel!
                                                                  .stockMaster![widget.index]
                                                                  .stockDetailMaster![index].availbleQty!
                                                                  .toStringAsFixed(0),                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ],
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      : Center(
                                          child: Text("No Data Found",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                ),
                                Container(
                                  color: primaryColor,
                                  padding: EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      Text(total.toStringAsFixed(0),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ));
        });
  }
}
