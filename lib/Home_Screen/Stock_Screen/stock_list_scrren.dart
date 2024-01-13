import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shalimar/Home_Screen/Stock_Screen/stock_suk_details_screen.dart';

import '../../Controller/get_available_stock_data-controller.dart';
import '../../Controller/outstanding_controller.dart';
import '../../Controller/stock_controller.dart';
import '../../Elements/common_searchbar_widget.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final TextEditingController _searchController = TextEditingController();
  StockController stockController =
  Get.put(StockController());

  GetAvailableStockDataController marketSectorController =
  Get.put(GetAvailableStockDataController());

  @override
  void initState() {
    // TODO: implement initStates
    stockController. getStockData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StockController>(
        init: StockController(),
        builder: (stockController) {
          return Scaffold(

              body: stockController.isLoading?Center(child: CircularProgressIndicator()):SafeArea(
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

                              Row(
                                children: [

                                  Text(
                                    'Search By: ',
                                    style: TextStyle(
                                      color: Colors.white,

                                      fontSize: 18,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        stockController.isSelectDepot= true;
                                        stockController.isSelectSku= false;
                                        stockController.update();

                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 8),
                                        decoration: BoxDecoration(
                                            color:  Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16))),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                            children: [
                                              Icon(stockController.isSelectDepot?Icons.check_box_outlined:Icons.check_box_outline_blank_sharp),
                                              Text(
                                                'Depot',
                                                style: TextStyle(
                                                  color:  Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Raleway',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12,),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        stockController.isSelectDepot= false;
                                        stockController.isSelectSku= true;
                                        stockController.update();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 8),
                                        decoration: BoxDecoration(
                                            color:   Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16))),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(stockController.isSelectSku?Icons.check_box_outlined:Icons.check_box_outline_blank_sharp),
                                              Text(
                                                'SKU',
                                                style: TextStyle(
                                                  color:  Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Raleway',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  stockController.isVisibleMarketSector =
                                  !stockController.isVisibleMarketSector;
                                  stockController.update();
                                },
                                child: Container(
                                  height: 35,
                                  color: primaryColor,
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Market Sector',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Icon(Icons.arrow_drop_down_sharp)
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: stockController.isVisibleMarketSector,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 300,
                                      color: primaryLight,
                                      child: ListView.builder(
                                        itemCount: marketSectorController
                                            .marketSectorModelData!.data!.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Row(
                                            children: [
                                              Checkbox(
                                                  value: stockController.sectionlist
                                                      .contains(marketSectorController
                                                      .marketSectorModelData!
                                                      .data![index].marketsectorid),
                                                  onChanged: (v) {
                                                    if (stockController.sectionlist.contains(marketSectorController
                                                        .marketSectorModelData!.data![index].marketsectorid)) {
                                                      stockController.sectionlist
                                                          .remove(marketSectorController
                                                          .marketSectorModelData!.data![index].marketsectorid);
                                                    } else {
                                                      stockController.sectionlist.add(
                                                          marketSectorController
                                                              .marketSectorModelData!
                                                              .data![index].marketsectorid);
                                                    }

                                                    stockController.update();
                                                    print(stockController.sectionlist);
                                                  }),
                                              Container(
                                                child: Text(
                                                  marketSectorController.marketSectorModelData!
                                                      .data![index].marketsectorname
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily: 'Raleway',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            stockController
                                                .filterStockDataModel!.stockMaster!
                                                .clear();
                                            for (var add in stockController
                                                .stockDataModel!.stockMaster!) {
                                              stockController
                                                  .filterStockDataModel!.stockMaster!
                                                  .add(add);
                                            }
                                            stockController.isVisibleMarketSector =false;
                                            stockController.filterStockDataModel!.stockMaster!.removeWhere((item) => !stockController.sectionlist.contains(item.marketsectorid));


                                            stockController.update();


                                          },
                                          child: Container(
                                            width: 100,
                                            height: 30,
                                            color: primaryColor,
                                            child: Center(
                                              child: Text(
                                              'Apply',
                                              style: TextStyle(
                                                color:  Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'Raleway',
                                                fontWeight: FontWeight.w700,
                                              ),
                                                                                      ),
                                            ),),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child:stockController.filterStockDataModel!.stockMaster!.isNotEmpty? ListView.builder(
                                  itemCount: stockController.filterStockDataModel!.stockMaster!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: (){
                                        Get.to(StockSukDetailsScreen(stockDetails:stockController.filterStockDataModel!.stockMaster!, index: index ,));
                                      },
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text( stockController.filterStockDataModel!.stockMaster![index].productcode.toString(),
                                                      style: TextStyle(
                                                          color: primaryColor,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold)),
                                                  Text("${stockController.filterStockDataModel!.stockMaster![index].packsize.toString()} ${stockController.filterStockDataModel!.stockMaster![index].uomname.toString()}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold)),
                                                ],
                                              ),
                                              Text(stockController.filterStockDataModel!.stockMaster![index].productdesc.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold)),

                                              // Divider(),

                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ):Center(
                                  child: Text("No Data Found",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              )); });
  }
}
