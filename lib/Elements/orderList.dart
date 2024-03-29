import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shalimar/Controller/get_order_data_controller.dart';
import 'package:shalimar/Model/get_order_data_model.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shalimar/utils/images.dart';
import 'package:share_plus/share_plus.dart';

import '../Controller/get_available_stock_data-controller.dart';
import '../Controller/set_order_data_controller.dart';
import '../Home_Screen/Customer_Module/CheckIn_Module/cart_screen.dart';

class OrderList extends StatefulWidget {
  BuildContext context;
  int index;
  List<OrderData>? orderDataList;

  OrderList(
      {super.key,
      required this.context,
      required this.index,
      required this.orderDataList});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  var isVisible = false;
  var totalQty = 0;
  var totalAmount = 0.0;

  GetOrderDataController orderData = Get.put(GetOrderDataController());
  SetOrderDataController setOrderDataController =
      Get.put(SetOrderDataController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i in widget.orderDataList![widget.index].orderDetailMaster!) {
      totalQty = totalQty + i.qty!.toInt();
      totalAmount = totalAmount + i.mrp!.toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    // var inputFormat = DateFormat('MM/dd/yyyy HH:mm:ss a');
    var inputDate = DateFormat('MM/dd/yyyy HH:mm:ss a')
        .parse(widget.orderDataList![widget.index].orderdate as String);
    var outputFormat = DateFormat('yMMMd');
    var outputDate = outputFormat.format(inputDate);
    print(outputDate);

    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "SAP Order Number#: ${widget.orderDataList![widget.index].sAPordernumber.toString()}",
                      maxLines: 2,
                      style: TextStyle(
                          color: blackTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  InkWell(
                      onTap: () async {
                        var orderDate = widget
                            .orderDataList![widget.index].orderdate
                            .toString()
                            .split(" ");
                        var orderNumber = widget
                            .orderDataList![widget.index].ordernumber
                            .toString();
                        var totalAmount = widget
                            .orderDataList![widget.index].orderTotalDPL
                            .toString();
                        var totalQty = widget
                            .orderDataList![widget.index].orderTotalQty!
                            .toInt();
                        var sapOrderNo = widget
                            .orderDataList![widget.index].sAPordernumber
                            .toString();

                        Share.share(
                            "Order Number: $orderNumber, Order Date: ${orderDate[0]}, Total Amount: $totalAmount, Total Qty: $totalQty, SAP Order Number: $sapOrderNo");
                        // final result = await Share.shareXFiles(
                        //     [XFile('SAP Order Number#')],
                        //     text: 'Great picture');

                        // if (result.status == ShareResultStatus.success) {
                        //   print('Thank you for sharing the picture!');
                        // }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(60)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset(
                              Images.productShare,
                              color: Colors.white,
                            ),
                          )))
                  // IconButton(onPressed: () {}, icon: Icon(Icons.share))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order#: ",
                        maxLines: 2,
                        style: TextStyle(
                            color: blackTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Flexible(
                      child: Text(
                          "${widget.orderDataList![widget.index].ordernumber.toString()}",
                          maxLines: 2,
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(outputDate,
                        // "${widget.orderDataList![widget.index].orderdate}",
                        // DateFormat('M/dd/yyyy').format(
                        //     DateTime.parse(widget.orderDataList![widget.index]
                        //         .orderdate as String)),
                        style: TextStyle(
                            color: blackTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${widget.orderDataList![widget.index].customername.toString()} (${widget.orderDataList![widget.index].customercode.toString()})",
                maxLines: 2,
                style: TextStyle(
                    color: blackTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Qty: ${totalQty.toInt()}",
                      style: TextStyle(
                          color: blackTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  Text("Total Amount: ${totalAmount.toStringAsFixed(2)}",
                      style: TextStyle(
                          color: blackTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.orderDataList![widget.index].sAPordernumber == null &&
                          widget.orderDataList![widget.index].sAPordernumber ==
                              ""
                      ? SizedBox()
                      : SizedBox(
                          height: 30,
                          child: OutlinedButton(
                            onPressed: () {
                              GetAvailableStockDataController stockController =
                                  Get.put(GetAvailableStockDataController());
                              stockController.myList.clear();
                              setOrderDataController.orderEditTag = "Edit";
                              setOrderDataController.total = 0.0;
                              Get.to(MyCartPage(
                                  tag: "Edit",
                                  orderNumber: widget
                                      .orderDataList![widget.index]
                                      .ordernumber!,
                                  orderRemark: widget
                                      .orderDataList![widget.index].remarks!,
                                  productList: widget
                                      .orderDataList![widget.index]
                                      .orderDetailMaster));
                            },
                            child: Text(
                              "Edit",
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(Icons.arrow_drop_down)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                  visible: isVisible,
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: widget.orderDataList![widget.index]
                          .orderDetailMaster!.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: primaryColor),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Product Name: ${widget.orderDataList![widget.index].orderDetailMaster![i].productdesc}"),
                                Text(
                                    "Qty: ${widget.orderDataList![widget.index].orderDetailMaster![i].qty!.toInt()}"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "Price: ${widget.orderDataList![widget.index].orderDetailMaster![i].dpl!.toStringAsFixed(2)}"),
                                    Text(
                                        "Totoal Price: ${widget.orderDataList![widget.index].orderDetailMaster![i].mrp!.toStringAsFixed(2)}"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "Remark: ${widget.orderDataList![widget.index].sAPRemark}",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.green,
                        )),
                    child: Text(
                      widget.orderDataList![widget.index].orderStatus
                          .toString(),
                      // widget.orderDataList![widget.index].sAPordernumber ==
                      //             null ||
                      //         widget.orderDataList![widget.index]
                      //                 .sAPordernumber ==
                      //             ""
                      //     ? "Pending"
                      //     : "Close",
                      //  "${widget.orderDataList![widget.index].orderStatus.toString()}",
                      maxLines: 2,
                      style: TextStyle(
                          color:
                              widget.orderDataList![widget.index].orderStatus ==
                                      "pending"
                                  ? Colors.green
                                  : widget.orderDataList![widget.index]
                                              .orderStatus ==
                                          "close"
                                      ? primaryColor
                                      : Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}

// Widget OrderList(
//     {required BuildContext context,
//     required int index,
//     List<OrderData>? orderDataList}) {
//   var isVisible = false;
//   return Card(
//     child: Container(
//       padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               width: 10,
//             ),
//             Text(
//               "Status: ${orderDataList![index].orderStatus.toString()}",
//               maxLines: 2,
//               style: TextStyle(
//                   color: orderDataList![index].orderStatus == "pending"
//                       ? Colors.green
//                       : orderDataList![index].orderStatus == "close"
//                           ? primaryColor
//                           : Colors.green,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold),
//               textAlign: TextAlign.start,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("${orderDataList![index].ordernumber.toString()}",
//                       maxLines: 2,
//                       style: TextStyle(
//                           color: blackTextColor,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold)),
//                   Text("${orderDataList![index].orderdate}",
//                       // DateFormat('M/dd/yyyy hh:mm:ss a').format(DateTime.parse(
//                       //     orderDataList![index].orderdate as String)),
//                       style: TextStyle(
//                           color: blackTextColor,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               "${orderDataList![index].customername.toString()} (${orderDataList![index].customercode.toString()})",
//               maxLines: 2,
//               style: TextStyle(
//                   color: blackTextColor,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400),
//               textAlign: TextAlign.start,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Total Qty: 0",
//                     style: TextStyle(
//                         color: blackTextColor,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400)),
//                 Text("Total Amount: 0.00",
//                     style: TextStyle(
//                         color: blackTextColor,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400)),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 orderDataList![index].sAPordernumber == null
//                     ? SizedBox()
//                     : SizedBox(
//                         height: 30,
//                         child: OutlinedButton(
//                           onPressed: () {},
//                           child: Text(
//                             "Edit",
//                             maxLines: 2,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.start,
//                           ),
//                         ),
//                       ),
//                 IconButton(
//                     onPressed: () {
                      
//                       isVisible = true;
//                     },
//                     icon: Icon(Icons.arrow_drop_down)),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Visibility(
//                 visible: isVisible,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Product Name:"),
//                     Text("Qty:"),
//                     Text("Amount:"),
//                   ],
//                 ))
//           ]),
//     ),
//   );
// }
