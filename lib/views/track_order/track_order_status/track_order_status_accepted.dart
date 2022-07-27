import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyavsay/controllers/check_order_summary_controller.dart';
import 'track_order_status_item.dart';

class TrackOrderStatusAccepted extends StatelessWidget {
  TrackOrderStatusAccepted({Key? key}) : super(key: key);
  // final controller = Get.put(TrackOrderController());
  // final storeDetailController = Get.find<RestaurentDetailsController>();
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
                text3: ''),
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
