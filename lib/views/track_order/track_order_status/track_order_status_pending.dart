import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyavsay/controllers/check_order_summary_controller.dart';

import 'track_order_status_item.dart';


class TrackOrderStatusPending extends StatelessWidget {
  TrackOrderStatusPending({Key? key}) : super(key: key);
//   final controller = Get.put(TrackOrderController());
// final storeDetailController = Get.put(StoreDetailsController());
// var restaurentDetailsController = Get.find<RestaurentDetailsController>();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return GetBuilder<CheckOrderSummaryController>(
      builder: (snapshot) {
        return Column(
          children: [
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric( vertical: 10.h),
    
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("Assets/Images/orderAccepted.png"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Pending',
                        style: TextStyle(
                            color: const Color(0xffFD8618),
    
                            fontWeight: FontWeight.w600,
                            fontSize: 16,),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          'Your order is successful and seller will \nconfirm your order shortly. ',
                          style: TextStyle(
                              color: const Color(0xffC4C4C4),
    
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp),
                        ),
                      ),
                      SizedBox(height: Get.height*0.012),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 2, color:  Color(0xffFF3D00)),
                        ),
                        onPressed: () {
                          // controller.cancelOrder();
                          // controller.loadOrderDetail();
                        },
                        child: Text(
                          'Cancel order',
                          style: TextStyle(
                              color: const Color(0xffFF3D00),
    
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
           snapshot.ordeDetails.deliveryType == 2?
                Container():
            TrackOrderStatusItem(
                text: 'To be shipped',
                image: 'Assets/Images/orderShipped.png',),
                snapshot.ordeDetails.deliveryType == 2?
            TrackOrderStatusItem(
              text: 'To be Picked',
              image: 'Assets/Images/orderDelivered.png',):
            TrackOrderStatusItem(
                text: 'To be Delivered',
                image: 'Assets/Images/orderDelivered.png',),
          ],
        );
      }
    );
  }
}
