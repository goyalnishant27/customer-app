import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrackOrderStatusItem extends StatelessWidget {
  TrackOrderStatusItem(
      {Key? key,
      required this.text,
      this.text2,
      required this.image,
      this.text3,
      this.textColor})
      : super(key: key);
  String text;
  String? text2;
  String? text3;
  String image;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          Row(children: [
            Image.asset(
              image,
              width: 60,
            ),
            SizedBox(
              width: 18.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: textColor ?? const Color(0xffC4C4C4),
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    fontFamily: "Proxima Nova Font",
                  ),
                ),
                if (text3 != null)
                  Text(
                    text3!,
                    style: TextStyle(
                      color: const Color(0xffC4C4C4),
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      fontFamily: "Proxima Nova Font",
                    ),
                  ),
              ],
            ),
            const Spacer(),
            if (text2 != null)
              Container(
                height: Get.height * 0.03,
                width: Get.width * 0.20,
                color: const Color(0xff4CAF50),
                child: Center(
                  child: Center(
                    child: Text(
                      text2!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        fontFamily: "Proxima Nova Font",
                      ),
                    ),
                  ),
                ),
              ),
          ]),
        ],
      ),
    );
  }
}
