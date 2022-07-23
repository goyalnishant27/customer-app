import 'package:Order_Direct/controllers/home_controller.dart';
import 'package:Order_Direct/controllers/track_order_controller.dart';
import 'package:Order_Direct/views/track_order/track_order.dart';

import 'package:Order_Direct/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../controllers/bag_controller.dart';
import '../../helper/colours.dart';

class PreviousOrder extends StatelessWidget {
  PreviousOrder({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());
  final trackOrderController = Get.put(TrackOrderController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return Obx(
      () => Scaffold(
        appBar: AppBar(

            leading: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
              onPressed: () => Get.back(),
            ),
            title: const Text(
              'Previous Orders',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Proxima Nova Font",
              ),
            ),
            backgroundColor: Colours.blue),
        body: Loader(
          show: controller.previousOrderList.value == null,
          child: controller.previousOrderList.value == null
              ? Container()
              : RefreshIndicator(
                  onRefresh: () async {
                    await controller.loadPreviousOrder();
                  },
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      for (var i in controller.previousOrderList.value!.data!)
                        InkWell(
                            onTap: () {
                              trackOrderController.loadPreviousOrderDetail(i);
                              Get.to(TrackOrder());
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 10.w),
                              child: Container(
                                height: Get.height * 0.20,
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
                                        "Name: ${i.name!}",
                                        style: TextStyle(
                                            color: Colours.blue,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Proxima Nova Font",
                                            fontSize: 21.sp),
                                      ),
                                      const Spacer(),
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor:
                                            HomeController.orderStatusColors[
                                                int.parse(i.status!)],
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        HomeController.orderStatusTitles[
                                            int.parse(i.status!)],
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: "Proxima Nova Font",
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [

                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Order-ID: ",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontFamily: 'Nunito',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.sp),
                                              ),
                                              Text(
                                                i.orderId!,
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
                                          Text(
                                            "No of item : ${i.noOfItem!}",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Proxima Nova Font",
                                                fontSize: 16.sp),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Total Amount :",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        "Proxima Nova Font",
                                                    fontSize: 16.sp),
                                              ),
                                              Text(
                                                i.totalAmount!,
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
                                          Center(
                                            child: Text(
                                              i.orderDatetime!,
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily:
                                                      "Proxima Nova Font",
                                                  fontSize: 16.sp),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.008,
                                          ),
                                          if (i.orderDateg != null)
                                            Center(
                                              child: Text(
                                                i.orderDateg!,
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
                  ),
                ),
        ),
      ),
    );
  }
}
