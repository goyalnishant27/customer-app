import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackOrderStatusPaymentFailed extends StatelessWidget {
  TrackOrderStatusPaymentFailed({Key? key}) : super(key: key);
  // final controller = Get.put(TrackOrderController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Color(0xffC4C4C4)),
          bottom: BorderSide(width: 1.0, color: Color(0xffC4C4C4)),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.cancel,
            size: 70,
            color: Colors.orange,
          ),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Cancelled',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.orange,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Today 8:21 AM',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.4),
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
