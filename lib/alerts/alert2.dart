// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Alert2 extends StatelessWidget {
  const Alert2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 80.h,
            width: 320.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFEEF7FF),
              // image: DecorationImage(
              //   image: AssetImage("Assets/Images/Info.png"),
              // ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("Assets/Images/Info.png"),
                  alignment: Alignment.center,
                  height: 50,
                  width: 45,
                  fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 290,
                    child: Text("The order amount will be credited in your account after 2 day of delivery ",
                    style: TextStyle(
                      color: Color(0xFF134DA5),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    maxLines: 2,
                    // overflow: TextOverflow.fade,
                    ),
                  ),
              ],
            ),
            // child: ,
          ),
        ],
      ),
    );
  }
}