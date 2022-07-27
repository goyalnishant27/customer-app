import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyavsay/controllers/check_order_summary_controller.dart';
import 'package:vyavsay/views/track_order/track_order_status/track_order_status_item.dart';

class TrackOrderStatusDelivered extends StatelessWidget {
  TrackOrderStatusDelivered({Key? key}) : super(key: key);
  // final controller = Get.put(TrackOrderController());
  //  final storeDetailController = Get.find<RestaurentDetailsController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOrderSummaryController>(
     builder: (snapshot) {
        return Column(
          children: [
            TrackOrderStatusItem(
                text: 'Order Accepted',
                text2: 'Done',
                image: 'Assets/Images/orderAccepted.png',
                text3: 'Today at 8:21 AM'),
            snapshot.ordeDetails.deliveryType == 2?
            Container():
            TrackOrderStatusItem(
                text: 'Order Shipped',
                textColor: Color(0xffFD8618),
                text2: 'Done',
                image: 'Assets/Images/orderShipped.png',
                text3: 'Today at 8:21 AM'),
            snapshot.ordeDetails.deliveryType == 2?
            TrackOrderStatusItem(
                text: 'Order Picked',
                text2: 'Done',
                image: 'Assets/Images/orderDelivered.png',
                text3: 'Today at 8:21 AM'):
            TrackOrderStatusItem(
                text: 'Order Delivered',
                text2: 'Done',
                image: 'Assets/Images/orderDelivered.png',
                text3: 'Today at 8:21 AM'),
          ],
        );
      }
    );
  }
}
