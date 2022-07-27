import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyavsay/controllers/check_order_summary_controller.dart';

import 'track_order_status_item.dart';

class TrackOrderStatusOutOfDelivery extends StatelessWidget {
  TrackOrderStatusOutOfDelivery({Key? key}) : super(key: key);
  // final controller = Get.put(TrackOrderController());
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
            Container():
            TrackOrderStatusItem(
              text: 'Out of delivery',
              textColor: Color(0xffFD8618),
              image: 'Assets/Images/orderDelivered.png',),
          ],
        );
      }
    );
  }
}
