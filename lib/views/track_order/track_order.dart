
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/check_order_summary_controller.dart';
import '../../controllers/previous_orders_controller.dart';
import 'track_order_status/track_order_status_accepted.dart';
import 'track_order_status/track_order_status_cancelled.dart';
import 'track_order_status/track_order_status_delivered.dart';
import 'track_order_status/track_order_status_intransit.dart';
import 'track_order_status/track_order_status_out_of_delivery.dart';
import 'track_order_status/track_order_status_payment_failed.dart';
import 'track_order_status/track_order_status_pending.dart';

class TrackOrder extends StatefulWidget {
  var orderDetailsController = Get.put(CheckOrderSummaryController());
  int index;
  TrackOrder(this.index);

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {

  // var userAddressController = Get.find<UserAddressController>();

  @override
  void initState(){
    super.initState();
    getOrderDetails();
  }

  getOrderDetails() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userId = sharedPreferences.getString('userId');
    var orderId = sharedPreferences.getString('orderId');
    widget.orderDetailsController.getOrderDetails(userId, orderId);
  }

  getDateTimeFromString(data){
    var parsedDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(data);
    return "${parsedDate.day}-${parsedDate.month}-${parsedDate.year} ${parsedDate.hour}:${parsedDate.minute}";
  }


  getDotWidget() {
    var dotWidget = Row(
      children: [
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: Color(0xFF78787840),
        ),
        SizedBox(
          width: 2.5,
        ),
      ],
    );
    // Column(
    //   children: [
    //     SizedBox(height: 10, width: 20,child: Text("l", style: TextStyle(fontSize: 12.0, color: Colors.grey,))),
    //     Text("l", style: TextStyle(fontSize: 2.0, color: Colors.grey,)),
    //     Text("l", style: TextStyle(fontSize: 2.0, color: Colors.grey,)),
    //     Text("l", style: TextStyle(fontSize: 2.0, color: Colors.grey,)),
    //     Text("l", style: TextStyle(fontSize: 2.0, color: Colors.grey,))
    //   ]
    // );
    return dotWidget;
  }

  Widget getDashLine(color){
    return Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      height: 2,
                      child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: 100, itemBuilder:  (context, index) {
                        return Row(
                          children: [
                            DottedLine(
          direction: Axis.horizontal,
          lineLength: 3.0,
          lineThickness: 3.0,
          dashLength: 3.0,
          dashColor: color,
        ),
        SizedBox(
          width: 2.5,
        ),
                          ],
                        );
                      }),
                    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<PreviousOrdersController>(
               
               builder: (snapshot) {
            return Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                  GestureDetector(
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios_outlined, size: 22,),
                        SizedBox(width: 6,),
                        GetBuilder<CheckOrderSummaryController>(
                 
                 builder: (snapshot) {
                            return Text("Order Id : ${snapshot.ordeDetails.orderedId}", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),);
                          }
                        )
                      ],
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                 SizedBox(height: 15,),
                  //   SizedBox(height: 30,),
                  // Text("Thank you for your Order", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),),
                  // SizedBox(height: 30,),
                  // Text("Order Placed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.black),),
                  // SizedBox(height: 30,),
                  // Text("Status", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),),
                  // SizedBox(height: 10,),
                  snapshot.previousOrders[widget.index].status == "1" ? 
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     SizedBox(height: 10,),
                  //     Text("Order Pending", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.red),),
                  //     SizedBox(height: 20,),
                  //     Text("Pending for confirm order", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0, color: Colors.red),),
                  //   ],
                  //)
                  TrackOrderStatusPending() : snapshot.previousOrders[widget.index].status == "2" ? TrackOrderStatusAccepted() :snapshot.previousOrders[widget.index].status == "3" ? TrackOrderStatusIntransit() : snapshot.previousOrders[widget.index].status == "4" ? TrackOrderStatusOutOfDelivery() : snapshot.previousOrders[widget.index].status == "5" ? TrackOrderStatusDelivered() : snapshot.previousOrders[widget.index].status == "6" ? TrackOrderStatusCancelled()  
                  : snapshot.previousOrders[widget.index].status == "7" ? TrackOrderStatusPaymentFailed() : SizedBox(),

                  Container( child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  // GestureDetector(
                  //   child: Row(
                  //     children: [
                  //       Icon(Icons.arrow_back_ios_outlined, size: 22,),
                  //       SizedBox(width: 6,),
                  //       Text("Order Id : ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                        
                  //     ],
                  //   ),
                  //   onTap: (){
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  SizedBox(height: 15,),
                  Text("Order Id :"),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(boxShadow: [BoxShadow(offset: Offset(0, 2), blurRadius: 1, spreadRadius: 1, color: Colors.white)]),
                    // margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("Your Receipt", style: TextStyle(fontWeight: FontWeight.bold),),
                        GetBuilder<CheckOrderSummaryController>(builder: (snapshot) {
                            return Text("${getDateTimeFromString(snapshot.ordeDetails.order_datetime)}", style: TextStyle(fontWeight: FontWeight.bold),);
                          }
                        )
                      ],),
                      SizedBox(height: 10,),
                      getDashLine(Color(0xFF78787840)),
                      Container(
            height: 25,
            child: Row(children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.47,
                padding: EdgeInsets.only(left: 10),
                child: Text("Description", style: TextStyle(color: Colors.grey),),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.15,
                child: Text("Quantity", style: TextStyle(color: Colors.grey),),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.26,
                child: Center(child: Text("Amount", style: TextStyle(color: Colors.grey),)),
              )
            ],),
          ),
          getDashLine(Colors.black45),
          SizedBox(height: 10,),
           GetBuilder<CheckOrderSummaryController>(builder: (snapshot) {
              return Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 1.0,
                        child: ListView.builder(itemCount: snapshot.ordeDetails.item.length, itemBuilder: ((context, index) {
                          return Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width * 0.47,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${snapshot.ordeDetails.item[index]['product_name']}")
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.15,
                                child: Center(child: Text("${snapshot.ordeDetails.item[index]['qty']}")),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.24,
                                child: Center(child: Text("${snapshot.ordeDetails.item[index]['price']}")),
                              )
                            ]),
                          );
                        })),
                      );
            }
          ),
                  SizedBox(height: 10,),
                  getDashLine(Color(0xFF78787840)),
                  SizedBox(height: 6,),
                  GetBuilder<CheckOrderSummaryController>(builder: (snapshot) {
                      return Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            Text("Item Total"),
                            Container(margin: EdgeInsets.only(right: 10), child: Text("${snapshot.ordeDetails.total_product_amount}"))
                      ],),
                      SizedBox(height: 6,),
                      Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            Text("Discount"),
                            Container(margin: EdgeInsets.only(right: 10), child: Text("${snapshot.ordeDetails.discount_amount}"))
                      ],),
                      SizedBox(height: 6,),
                      Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            Text("Delivery Charges"),
                            Container(margin: EdgeInsets.only(right: 10), child: Text("${snapshot.ordeDetails.delivery_charge}"))
                      ],),
                          ],
                        ));
                    }
                  ),
                  SizedBox(height: 6,),
                    getDashLine(Color(0xFF78787840)),
                    GetBuilder<CheckOrderSummaryController>(builder: (snapshot) {
                        return Container(
                          height: 100,
                          decoration: BoxDecoration(color: Colors.grey[200]),
                          padding: EdgeInsets.only(left: 10, right: 10, top: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text("Total Amount:", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                            Text("${snapshot.ordeDetails.total_amount}", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),)
                          ],),
                        );
                      }
                    ),
                    getDashLine(Color(0xFF78787840)),
                    ]),
                  ),
                  
          ],
              ),)
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Container(decoration: BoxDecoration(border: Border.all(color: Colors.green, width: 1.0), borderRadius: BorderRadius.circular(20.0)), height: 25, width: 25, child: Transform.scale(scale: 1.3, child: Checkbox(fillColor: MaterialStateProperty.all(Colors.white), value: true, onChanged: (val){}, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),), checkColor: Colors.green, side: BorderSide(color: Colors.green, width: 1.0), ))),
                  //     Container(
                  //               height: 25,
                  //               width: 90,
                  //               child: getDotWidget(),
                  //             ),
                  //             Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1.0), borderRadius: BorderRadius.circular(20.0)), height: 25, width: 25, child: Transform.scale(scale: 1.3, child: Checkbox(fillColor: MaterialStateProperty.all(Colors.white), value: false, onChanged: (val){}, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),), checkColor: Colors.grey, side: BorderSide(color: Colors.grey, width: 1.0), ))),
                  //             Container(
                  //               height: 25,
                  //               width: 90,
                  //               child: getDotWidget(),
                  //             ),
                  //             Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1.0), borderRadius: BorderRadius.circular(20.0)), height: 25, width: 25, child: Transform.scale(scale: 1.3, child: Checkbox(fillColor: MaterialStateProperty.all(Colors.white), value: false, onChanged: (val){}, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),), checkColor: Colors.grey, side: BorderSide(color: Colors.grey, width: 1.0), ))),
                  //   ],
                  // ) : Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text("Order Failed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.red),),
                  //     SizedBox(height: 10,),
                  //     Text("Payment Failed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0, color: Colors.red),),
                  //   ],
                  // ),
                  // SizedBox(height: 10,),
                  // snapshot.previousOrders[widget.index].status == "1" ? SizedBox() : snapshot.previousOrders[widget.index].status != "7" ? Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text("Order Accepted", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.black),),
                  //      SizedBox(width: 35,),
                  //     Text("Order Shipping", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.black),),
                  //      SizedBox(width: 35,),
                  //     Text("Delievered", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.black),),
                  //   ],
                  // ) : SizedBox(),
                  // SizedBox(height: 30,),
                //  GetBuilder<PreviousOrdersController>(
                   
                //    builder: (snapshot) {
                //      return Container(
                //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0), color: Colors.white, border: Border.all(color: Color.fromRGBO(43, 99, 175, 1), width: 1.0),),
                //                 width: Get.width * 0.8,
                //                 height: 180,
                //                 child: Container(
                //                   margin: EdgeInsets.only(left: 20, right: 25, top: 4),
                //                   child: Column(
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     children: [
                //           //           Image.asset(
                //           //   "images/Delivery.png",
                //           //   height: 122,
                //           //   width: 100,
                //           // ),
                //           // SizedBox(width: 10),
                //           SizedBox(height: 10,),
                //                       Text("Ordered id : ${snapshot.previousOrders[widget.index].orderedId}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Color.fromRGBO(43, 99, 175, 1)),),
                //                       SizedBox(height: 10,),
                //                       Text("Ordered Time : ${snapshot.previousOrders[widget.index].order_datetime}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Color.fromRGBO(43, 99, 175, 1)),),
                //                       SizedBox(height: 10,),
                //                       Text("Total Amount: ${snapshot.previousOrders[widget.index].total_amount}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Color.fromRGBO(43, 99, 175, 1))),
                //                       SizedBox(height: 10,),
                //                       Text("Deliver Address: ${snapshot.previousOrders[widget.index].address},${snapshot.previousOrders[widget.index].city},${snapshot.previousOrders[widget.index].state}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Color.fromRGBO(43, 99, 175, 1))),
                //                       SizedBox(height: 10,),
                //                       // Text("${snapshot.userAddress['pincode']}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.white)),
                //                     ],
                //                   ),
                //                 ),
                //               );
                //    }
                //  )
                        
                      
                ]),
              ),
            );
          }
        ),
      ),
    );
  }
}