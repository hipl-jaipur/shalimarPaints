import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shalimar/Home_Screen/Stock_Screen/stock_suk_details_screen.dart';

import '../../Controller/get_available_stock_data-controller.dart';
import '../../Controller/set_activity_detail_data_controller.dart';
import '../../Controller/stock_controller.dart';
import '../../Elements/common_searchbar_widget.dart';
import '../../Elements/timer_widget.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final TextEditingController searchController = TextEditingController();
  StockController stockController =
  Get.put(StockController());

  GetAvailableStockDataController marketSectorController =
  Get.put(GetAvailableStockDataController());

  @override
  void initState() {
    // TODO: implement initStates

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StockController>(
        init: StockController(),
        builder: (stockController) {
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
                        child: GetBuilder<SetActivityDetailDataController>(
                          init: SetActivityDetailDataController(),
                          builder: (setActivityController) {
                            return Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: setActivityController.checkIn
                                            ? 40
                                            : 20,
                                      ),
                                      TextField(
                                        controller: searchController,
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
                                        onChanged: (c){
                                          setState(() {

                                          });
                                        },
                                      ),
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
                                                stockController.isVisibleMarketSector= false;
                                                // stockController. getStockData();
                                                // stockController.filterStockDataModel!.stockMaster!.clear();
                                                stockController.idDepot=0;
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
                                                // stockController. getStockData();
                                                // stockController.filterStockDataModel!.stockMaster!.clear();
                                                stockController.idMarke=0;
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
                                      stockController.isSelectSku? GestureDetector(
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
                                                stockController.marketSectorName,
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
                                      ):GestureDetector(
                                        onTap: () {
                                          stockController.isVisibleMarketDepot =
                                          !stockController.isVisibleMarketDepot;
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
                                              Text(stockController.depotName,
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
                                      stockController.isSelectSku? Visibility(
                                        visible: stockController.isVisibleMarketSector,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 300,
                                              color: primaryLight,
                                              child: ListView.builder(
                                                itemCount: marketSectorController
                                                    .marketSectorModelData!.data!.length,
                                                itemBuilder: (BuildContext context, dynamic index) {
                                                  return  GestureDetector(
                                                    onTap:(){
                                                      stockController.idMarke=marketSectorController.marketSectorModelData!
                                                          .data![index].marketsectorid;
                                                      stockController. getStockData(stockController.idMarke,0);
                                                      stockController.isVisibleMarketSector=false;
                                                      stockController.marketSectorName=marketSectorController.marketSectorModelData!
                                                          .data![index].marketsectorname.toString();
                                                      stockController.update();
                                                    },
                                                    child: Container(

                                                      padding: EdgeInsets.all(8),
                                                      child: Text(
                                                        marketSectorController.marketSectorModelData!
                                                            .data![index].marketsectorname
                                                            .toString(),
                                                        style: TextStyle(
                                                          color:stockController.idMarke==marketSectorController.marketSectorModelData!.data![index].marketsectorid? primaryColor:Colors.black,
                                                          fontSize: 16,
                                                          fontFamily: 'Raleway',
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),

                                          ],
                                        ),
                                      ):Visibility(
                                        visible: stockController.isVisibleMarketDepot,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 300,
                                              color: primaryLight,
                                              child: ListView.builder(
                                                itemCount: stockController
                                                    .depotMasterDataModel!.data!.length,
                                                itemBuilder: (BuildContext context, dynamic index) {
                                                  return GestureDetector(
                                                    onTap:(){
                                                      stockController.idDepot=stockController
                                                          .depotMasterDataModel!
                                                          .data![index]!.levelID!;
                                                      stockController. getStockData(0,stockController.idDepot);
                                                      stockController.isVisibleMarketDepot=false;
                                                      stockController.depotName=stockController
                                                          .depotMasterDataModel!
                                                          .data![index]!.levelName.toString();
                                                      stockController.update();
                                                    },
                                                    child: Container(

                                                      padding: EdgeInsets.all(8),
                                                      child: Text(
                                                        stockController
                                                            .depotMasterDataModel!.data![index].levelName
                                                            .toString(),
                                                        style: TextStyle(
                                                          color:stockController.idDepot==stockController
                                                              .depotMasterDataModel!.data![index].levelID? primaryColor:Colors.black,
                                                          fontSize: 16,
                                                          fontFamily: 'Raleway',
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      stockController.isLoading?Center(child: CircularProgressIndicator()):  stockController.filterStockDataModel!=null?  Expanded(
                                        child:stockController.filterStockDataModel!.stockMaster!.isNotEmpty? ListView.builder(
                                          itemCount: stockController.filterStockDataModel!.stockMaster!.length,
                                          itemBuilder: (BuildContext context, dynamic index) {
                                            return stockController.filterStockDataModel!.stockMaster![index]!
                                                .productcode!
                                                .toLowerCase()
                                                .contains(searchController
                                                .text
                                                .toLowerCase()) ||stockController.filterStockDataModel!.stockMaster![index]!
                                                .productdesc!
                                                .toLowerCase()
                                                .contains(searchController
                                                .text
                                                .toLowerCase()) ? stockController.isSelectDepot?Card(
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
                                                        Row(
                                                          children: [
                                                            Text(stockController.filterStockDataModel!.stockMaster![index].packsize!.toStringAsFixed(0),
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.bold)),    Text(" ${stockController.filterStockDataModel!.stockMaster![index].uomname.toString()}",
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.bold)),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Text(stockController.filterStockDataModel!.stockMaster![index].productdesc.toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold)),
                                                    SizedBox(height: 12,),
                                                    Row(
                                                      children: [
                                                        Text( "Depot :${stockController.filterStockDataModel!.stockMaster![index].stockDetailMaster![0].depotName.toString()}",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w700)), Text( "(${stockController.filterStockDataModel!.stockMaster![index].stockDetailMaster![0].depotCode.toString()})",
                                                            style: TextStyle(
                                                                color: primaryColor,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w700)),
                                                        SizedBox(width: 12,),
                                                        Text( "Qty : ",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w700)),

                                                        Text( stockController.filterStockDataModel!.stockMaster![index].stockDetailMaster![0].availbleQty.toStringAsFixed(0),
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w700)),
                                                      ],
                                                    ),
                                                    SizedBox(height: 12,),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text( "DPL : ${stockController.filterStockDataModel!.stockMaster![index].dpl.toString()}",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.w700)),
                                                        Text("MRP : ${stockController.filterStockDataModel!.stockMaster![index].mrp.toString()} ",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.w700)),
                                                      ],
                                                    ),

                                                    // Divider(),

                                                  ],
                                                ),
                                              ),
                                            ):GestureDetector(
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
                                                          Row(
                                                            children: [
                                                              Text(stockController.filterStockDataModel!.stockMaster![index].packsize!.toStringAsFixed(0),
                                                                  style: TextStyle(
                                                                      color: Colors.black,
                                                                      fontSize: 16,
                                                                      fontWeight: FontWeight.bold)),    Text(" ${stockController.filterStockDataModel!.stockMaster![index].uomname.toString()}",
                                                                  style: TextStyle(
                                                                      color: Colors.black,
                                                                      fontSize: 16,
                                                                      fontWeight: FontWeight.bold)),
                                                            ],
                                                          ),
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
                                            ):SizedBox();
                                          },
                                        ):Center(
                                          child: Text("No Data Found",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ):SizedBox()
                                    ],
                                  ),
                                ),
                                Positioned(
                                    child: Visibility(
                                        visible: setActivityController.checkIn,
                                        child: TimerWidget())),
                              ],
                            ); },))
                  ],
                ),
              )); });
  }
}
