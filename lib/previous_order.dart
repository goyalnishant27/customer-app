import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vyavsay/views/track_order/track_order.dart';
import 'package:vyavsay/welcome/welcome.dart';

import 'controllers/check_user_login_controller.dart';
import 'controllers/previous_orders_controller.dart';

class PreviousOrder extends StatefulWidget {
  var previousOrdersController = Get.put(PreviousOrdersController());
  var checkUserController = Get.find<CheckUserController>();
  PreviousOrder({Key? key}) : super(key: key);

  @override
  State<PreviousOrder> createState() => _PreviousOrderState();
}

class _PreviousOrderState extends State<PreviousOrder> {

  @override
  void initState(){
    super.initState();
    getOrderDetails();
  }

  getOrderDetails() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userId = sharedPreferences.getString('userId');
    var orderId = sharedPreferences.getString('orderId');
    if(userId != null){
      widget.checkUserController.checkUser(true);
    }else{
      widget.checkUserController.checkUser(false);
    }
    widget.previousOrdersController..getPreviousOrders(userId);
  }

  // final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return GetBuilder<CheckUserController>(
      builder: (userCont) {
        return Container(
            // appBar: AppBar(
    
            //     leading: IconButton(
            //       icon: const Icon(
            //         Icons.chevron_left,
            //         color: Colors.white,
            //       ),
            //       onPressed: () => Get.back(),
            //     ),
            //     title: const Text(
            //       'Previous Orders',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontFamily: "Proxima Nova Font",
            //       ),
            //     ),
            //     backgroundColor: Colors.blue),
            child: 
            // Loader(
            //   show: snapshot.previousOrders.isNotEmpty,
            //   child: controller.previousOrderList.value == null
            //       ? Container()
            //       : RefreshIndicator(
            //           onRefresh: () async {
            //             await controller.loadPreviousOrder();
            //           },
                      // child:
                       userCont.isUserLoggedIn == true ? GetBuilder<PreviousOrdersController>(
      builder: (snapshot) {
                           return ListView(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            physics: const BouncingScrollPhysics(),
                            children: [
                              for (var i in snapshot.previousOrders)
                                InkWell(
                                    onTap: () async {
                                      // trackOrderController.loadPreviousOrderDetail(i);
                                      // Get.to(TrackOrder());
                                      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                      sharedPreferences.setString('orderId', i.id.toString());
                                      var ind = snapshot.previousOrders.indexWhere((element) => element.id == i.id);
                                      Navigator.push(
                                           context,
                                           MaterialPageRoute(
                            builder:
                                (context) =>
                                TrackOrder(ind)));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10.h, horizontal: 6.w),
                                      child: Container(
                                        height: Get.height * 0.18,
                                        width: Get.width * 0.85,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.h, vertical: 10.w),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1.0, color: Colors.grey),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Column(children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Order-ID: ${i.id!}",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Proxima Nova Font",
                                                    fontSize: 21.sp),
                                              ),
                                              const Spacer(),
                                              CircleAvatar(
                                                radius: 8,
                                                backgroundColor:
                                                    i.status == '1' ? Color.fromARGB(255, 248, 230, 72) : i.status == '2' ? Colors.green : i.status == '3' ? Colors.blue : i.status == '4' ? Colors.blue : i.status == '5' ? Colors.green : i.status == '6' ? Colors.red : Colors.red,
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                i.status == "1" ? "Pending" : i.status == "2" ? "Accepted" : i.status == "3" ? "In Transit" : i.status == "4" ? "Out of Delivery" : i.status == "5" ? "Delivered" : i.status == "6" ? "Cancel" : "Payment Failed",
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontFamily: "Proxima Nova Font",
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 40),
                                          Row(
                                            children: [
                           
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                   Row(
                                                    children: [
                                                      Text(
                                                        "Total Amount :",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                            fontFamily:
                                                                "Proxima Nova Font",
                                                            fontSize: 16.sp),
                                                      ),
                                                      Text(
                                                        i.total_amount,
                                                        style: TextStyle(
                                                            color: Colors.black54,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily:
                                                                "Proxima Nova Font",
                                                            fontSize: 16.sp),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * 0.008,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "No of item :",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                                fontWeight: FontWeight.bold,
                                                            fontFamily: "Proxima Nova Font",
                                                            fontSize: 16.sp),
                                                      ),
                                                      Text(
                                                        " ${i.no_of_item!}",
                                                        style: TextStyle(
                                                            color: Colors.black54,
                                                                fontWeight: FontWeight.w600,
                                                            fontFamily: "Proxima Nova Font",
                                                            fontSize: 16.sp),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Column(
                                                children: [
                                                 
                                                  // SizedBox(
                                                  //   height: Get.height * 0.008,
                                                  // ),
                                                  // Center(
                                                  //   child: Text(
                                                  //     i.order_datetime,
                                                  //     style: TextStyle(
                                                  //         color: Colors.black54,
                                                  //         fontWeight: FontWeight.w300,
                                                  //         fontFamily:
                                                  //             "Proxima Nova Font",
                                                  //         fontSize: 16.sp),
                                                  //   ),
                                                  // ),
                                                  // SizedBox(
                                                  //   height: Get.height * 0.008,
                                                  // ),
                                                  if (i.order_datetime != null)
                                                    Center(
                                                      child: Text(
                                                        i.order_datetime,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w300,
                                                            fontFamily:
                                                                "Proxima Nova Font",
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ]),
                                      ),
                                    )),
                            ],
                                             // ),
                                           );
                         }
                       ) : Container(
        child: Center(child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
                    
                  }, child: Text("Login Now", style: TextStyle(color: Color.fromRGBO(43, 99, 175, 1)),), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                  )),)),
      ));

          //   ),
          // );
      }
    );
  }
}
