import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Controller/get_customer_data_controller.dart';
import '../../Controller/ledger_statement_controller.dart';
import '../../Controller/stock_controller.dart';
import '../../Elements/commom_snackbar_widget.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

class LedgerStatementPage extends StatefulWidget {
  const LedgerStatementPage({super.key});

  @override
  State<LedgerStatementPage> createState() => _LedgerStatementPageState();
}

class _LedgerStatementPageState extends State<LedgerStatementPage> {
  final TextEditingController searchTerritoryController =
      TextEditingController();
  final TextEditingController searchCustomerController =
      TextEditingController();

  StockController stockController = Get.put(StockController());

  // LedgerStatementController ledgerStatementController =
  //     Get.put(LedgerStatementController());
  GetCustomerDataController getCustomerDataController =
      Get.put(GetCustomerDataController());

  // var totalAmount = 0.0;
  // var totalBalance = 0.0;
  var isLoad = true;

  @override
  void initState() {
    // TODO: implement initState
    stockController.getDepotMasterData("territory").whenComplete(() {
setState(() {
  isLoad = false;

});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoad,
      child: Scaffold(
          body: GetBuilder<LedgerStatementController>(
        init: LedgerStatementController(),
        builder: (cont) {
          return ModalProgressHUD(
            inAsyncCall: cont.isLoading,
            child: SafeArea(
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
                        padding: const EdgeInsets.all(10.0),
                        child: ListView(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 0,
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
                                  width: 20,
                                ),
                                Text(
                                  " Customer Ledger",
                                  style: TextStyle(
                                      color: primaryLight,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              child: Card(
                                color: inactiveIndidcatorColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          cont.isVisibleTerritory =
                                              !cont.isVisibleTerritory;
                                          cont.update();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 8),
                                          // padding: EdgeInsets.symmetric(horizontal: 12),
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              border: Border.all(),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                cont.territoryName,
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
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (cont.onTapCustomer) {
                                            cont.isVisibleCustomer =
                                                !cont.isVisibleCustomer;
                                            cont.update();
                                          }
                                        },
                                        child: Container(
                                          // height: 35,
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              border: Border.all(),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 8),
                                          // padding: EdgeInsets.symmetric(horizontal: 12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Container(
                                                  child: FittedBox(
                                                    fit: BoxFit.fill,
                                                    child: Text(
                                                      cont.customerName,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontFamily: 'Raleway',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Icon(Icons.arrow_drop_down_sharp)
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Visibility(
                                        visible: cont.isVisibleTerritory,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              color: primaryLight,
                                              child: TextField(
                                                controller:
                                                    searchTerritoryController,
                                                textInputAction:
                                                    TextInputAction.search,
                                                textCapitalization:
                                                    TextCapitalization.words,
                                                decoration: InputDecoration(
                                                  hintText: 'Search',
                                                  prefixIcon: IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.search_sharp,
                                                        color: primaryColor,
                                                        size: 40,
                                                      )),
                                                ),
                                                onChanged: (c) {
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.8,
                                              color: primaryLight,
                                              child: stockController
                                                              .depotMasterDataModel !=
                                                          null &&
                                                      stockController
                                                          .depotMasterDataModel!
                                                          .data!
                                                          .isNotEmpty
                                                  ? ListView.builder(
                                                      itemCount: stockController
                                                          .depotMasterDataModel!
                                                          .data!
                                                          .length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              dynamic index) {
                                                        return stockController
                                                                .depotMasterDataModel!
                                                                .data![index]!
                                                                .levelName!
                                                                .toLowerCase()
                                                                .contains(
                                                                    searchTerritoryController
                                                                        .text
                                                                        .toLowerCase())
                                                            ? GestureDetector(
                                                                onTap: () {
                                                                  cont.isLoading =
                                                                      true;
                                                                  cont.idTerritory = stockController
                                                                      .depotMasterDataModel!
                                                                      .data![
                                                                          index]!
                                                                      .levelID!;

                                                                  cont.territoryName = stockController
                                                                      .depotMasterDataModel!
                                                                      .data![
                                                                          index]!
                                                                      .levelName
                                                                      .toString();
                                                                  getCustomerDataController
                                                                      .fetchData(
                                                                          0,
                                                                          stockController
                                                                              .depotMasterDataModel!
                                                                              .data![index]!
                                                                              .levelID!)
                                                                      .then((value) {
                                                                    cont.isLoading =
                                                                        false;

                                                                    if (value !=
                                                                        null) {
                                                                      cont.isVisibleTerritory =
                                                                          false;
                                                                      cont.onTapCustomer =
                                                                          true;
                                                                      cont.idCustomer =
                                                                          "0";
                                                                      cont.customerName =
                                                                          "Select Customer";
                                                                      cont.update();
                                                                    }
                                                                  });
                                                                  cont.update();
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  child: Text(
                                                                    stockController
                                                                        .depotMasterDataModel!
                                                                        .data![
                                                                            index]
                                                                        .levelName
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: cont.idTerritory ==
                                                                              stockController.depotMasterDataModel!.data![index].levelID
                                                                          ? primaryColor
                                                                          : Colors.black,
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          'Raleway',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            : SizedBox();
                                                      },
                                                    )
                                                  : Center(
                                                      child: Text(
                                                          "No Data Found")),
                                            ),
                                          ],
                                        ),
                                      ),
                                      getCustomerDataController
                                                  .getCustomerData !=
                                              null
                                          ? Visibility(
                                              visible: cont.isVisibleCustomer,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    color: primaryLight,
                                                    child: TextField(
                                                      controller:
                                                          searchCustomerController,
                                                      textInputAction:
                                                          TextInputAction
                                                              .search,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .words,
                                                      decoration:
                                                          InputDecoration(
                                                        /*    border: OutlineInputBorder(),
                                        filled: true,
                                        fillColor: Colors.white,

                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(0)),
                                            borderSide: BorderSide(
                                              color: Color(0xffECE6E6),
                                            )),*/

                                                        hintText: 'Search',
                                                        prefixIcon: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              Icons
                                                                  .search_sharp,
                                                              color:
                                                                  primaryColor,
                                                              size: 40,
                                                            )),
                                                      ),
                                                      onChanged: (c) {
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.6,
                                                    color: primaryLight,
                                                    child: ListView.builder(
                                                      itemCount:
                                                          getCustomerDataController
                                                              .getCustomerData!
                                                              .data!
                                                              .length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              dynamic index) {
                                                        return getCustomerDataController
                                                                .getCustomerData!
                                                                .data![index]!
                                                                .customername!
                                                                .toLowerCase()
                                                                .contains(
                                                                    searchCustomerController
                                                                        .text
                                                                        .toLowerCase())
                                                            ? GestureDetector(
                                                                onTap: () {
                                                                  cont.idCustomer = getCustomerDataController
                                                                      .getCustomerData!
                                                                      .data![
                                                                          index]!
                                                                      .customercode!;

                                                                  cont.customerName = getCustomerDataController
                                                                      .getCustomerData!
                                                                      .data![
                                                                          index]!
                                                                      .customername
                                                                      .toString();
                                                                  cont.isVisibleCustomer =
                                                                      false;
                                                                  cont.update();
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  child: Text(
                                                                    getCustomerDataController
                                                                        .getCustomerData!
                                                                        .data![
                                                                            index]
                                                                        .customername
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: cont.customerName ==
                                                                              getCustomerDataController.getCustomerData!.data![index].customername
                                                                          ? primaryColor
                                                                          : Colors.black,
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          'Raleway',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            : SizedBox();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : SizedBox(),
                                      GestureDetector(
                                        onTap: () {
                                          if (cont.idTerritory != 0 &&
                                              cont.idCustomer.isNotEmpty) {
                                            cont.getLedgerStatementData(
                                                cont.idTerritory,
                                                cont.idCustomer);
                                          } else {
                                            showSnackBar(
                                                "Error!!",
                                                "Select Territory \n Select Customer Name ",
                                                Colors.redAccent);
                                          }
                                        },
                                        child: Container(
                                          width: 120,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          padding: EdgeInsets.all(12),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.search_sharp,
                                                color: Colors.white,
                                              ),
                                              Text("Search",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Raleway',
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            cont.ledgerStatementModel != null &&
                                    cont.ledgerStatementModel!
                                        .ledgerStatementMaster!.isNotEmpty
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ledger Statement Master",
                                        style: TextStyle(
                                            color: primaryLight,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 8),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Customer Name:   ",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  cont
                                                      .ledgerStatementModel!
                                                      .ledgerStatementMaster![0]
                                                      .customername
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  "(${cont.ledgerStatementModel!.ledgerStatementMaster![0].customercode.toString()})",
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 8),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Territory:   ",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                cont
                                                    .ledgerStatementModel!
                                                    .ledgerStatementMaster![0]
                                                    .territoryName
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 8),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Address:   ",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  cont
                                                      .ledgerStatementModel!
                                                      .ledgerStatementMaster![0]
                                                      .address
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 8),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Open Balance:   ",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                cont
                                                    .ledgerStatementModel!
                                                    .ledgerStatementMaster![0]
                                                    .openBalance!
                                                    .toStringAsFixed(2),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        color: primaryColor,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Date",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: primaryLight,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 35),
                                              child: Text(
                                                "DocumentNo",
                                                style: TextStyle(
                                                    color: primaryLight,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Text(
                                              "Amount(DR/CR)",
                                              style: TextStyle(
                                                  color: primaryLight,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "Balance",
                                              style: TextStyle(
                                                  color: primaryLight,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemCount: cont
                                            .ledgerStatementModel!
                                            .ledgerStatementMaster![0]
                                            .ledgerStatementDetailMaster!
                                            .length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          cont.totalAmount = cont.totalAmount +
                                              cont
                                                  .ledgerStatementModel!
                                                  .ledgerStatementMaster![0]
                                                  .ledgerStatementDetailMaster![
                                                      index]
                                                  .creditAmt +
                                              cont
                                                  .ledgerStatementModel!
                                                  .ledgerStatementMaster![0]
                                                  .ledgerStatementDetailMaster![
                                                      index]
                                                  .debitAmt;

                                          cont.totalBalance = cont
                                                  .totalBalance +
                                              cont
                                                  .ledgerStatementModel!
                                                  .ledgerStatementMaster![0]
                                                  .ledgerStatementDetailMaster![
                                                      index]
                                                  .balance;

                                          return Container(
                                            height: 30,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black54),
                                              left: BorderSide(
                                                  color: Colors.black54),
                                              right: BorderSide(
                                                  color: Colors.black54),
                                            )),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  cont
                                                      .ledgerStatementModel!
                                                      .ledgerStatementMaster![0]
                                                      .ledgerStatementDetailMaster![
                                                          index]
                                                      .date
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  "${cont.ledgerStatementModel!.ledgerStatementMaster![0].ledgerStatementDetailMaster![index].documentNo.toString()}(${cont.ledgerStatementModel!.ledgerStatementMaster![0].ledgerStatementDetailMaster![index].documentType.toString()})",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  "${cont.ledgerStatementModel!.ledgerStatementMaster![0].ledgerStatementDetailMaster![index]!.dc.toString() == "Dr" ? cont.ledgerStatementModel!.ledgerStatementMaster![0].ledgerStatementDetailMaster![index].debitAmt!.toStringAsFixed(2) : cont.ledgerStatementModel!.ledgerStatementMaster![0].ledgerStatementDetailMaster![index].creditAmt!.toStringAsFixed(2)}(${cont.ledgerStatementModel!.ledgerStatementMaster![0].ledgerStatementDetailMaster![index].dc.toString().toUpperCase()})",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  cont
                                                      .ledgerStatementModel!
                                                      .ledgerStatementMaster![0]
                                                      .ledgerStatementDetailMaster![
                                                          index]
                                                      .balance!
                                                      .toStringAsFixed(2),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      Container(
                                        height: 30,
                                        color: primaryColor,
                                        padding:
                                            EdgeInsets.only(left: 0, right: 2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Closing Balance: ",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: primaryLight,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            // Text(
                                            //   cont.totalAmount != null
                                            //       ? cont.totalAmount
                                            //           .toStringAsFixed(2)
                                            //       : "",
                                            //   style: TextStyle(
                                            //       color: primaryLight,
                                            //       fontSize: 12,
                                            //       fontWeight: FontWeight.w500),
                                            // ),
                                            // SizedBox(
                                            //   width: 20,
                                            // ),
                                            Text(
                                              cont.totalBalance != null
                                                  ? cont.totalBalance
                                                      .toStringAsFixed(2)
                                                  : "",
                                              style: TextStyle(
                                                  color: primaryLight,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Center(
                                    child: Text(
                                      "No Data Available",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
