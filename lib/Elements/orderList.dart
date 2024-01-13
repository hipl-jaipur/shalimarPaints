import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalimar/Controller/get_order_data_controller.dart';
import 'package:shalimar/Home_Screen/CheckIn_Module/cart_screen.dart';
import 'package:shalimar/Model/get_order_data_model.dart';
import 'package:shalimar/utils/colors.dart';

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

  GetOrderDataController orderData = Get.put(GetOrderDataController());

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Status: ${widget.orderDataList![widget.index].orderStatus.toString()}",
                maxLines: 2,
                style: TextStyle(
                    color: widget.orderDataList![widget.index].orderStatus ==
                            "pending"
                        ? Colors.green
                        : widget.orderDataList![widget.index].orderStatus ==
                                "close"
                            ? primaryColor
                            : Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "${widget.orderDataList![widget.index].ordernumber.toString()}",
                        maxLines: 2,
                        style: TextStyle(
                            color: blackTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(
                        "${widget.orderDataList![widget.index].orderdate}",
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
                  Text("Total Qty: 0",
                      style: TextStyle(
                          color: blackTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  Text("Total Amount: 0.00",
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
                  widget.orderDataList![widget.index].sAPordernumber == null
                      ? SizedBox()
                      : SizedBox(
                          height: 30,
                          child: OutlinedButton(
                            onPressed: () {
                              Get.off(MyCartPage());
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
                          isVisible = true;
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
                      itemCount: 1,
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
                                    "Qty: ${widget.orderDataList![widget.index].orderDetailMaster![i].qty}"),
                                Text(
                                    "Amount: ${widget.orderDataList![widget.index].orderDetailMaster![i].dpl}"),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ))
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
