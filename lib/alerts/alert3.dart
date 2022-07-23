// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyavsay/alerts/Components/button_fill.dart';
import 'package:vyavsay/alerts/Components/button_unfill.dart';

class Alert3 extends StatelessWidget {
  const Alert3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return Scaffold(
      body: Center(
        child: Container(
          height: 240,
          width: 325,
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("Assets/Images/Delivery.png"),
                    height: 72,
                    width: 92,
                  ),
                  Text(
                    "Set up Delivery",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 18.w,
                  top: 16.h,
                ),
                child: Text(
                  "You need to set up Vyavsay Delivery first to use delivery service",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF000000).withOpacity(0.49),
                  ),
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  MyButtonFill(onPressed: () {}, text: "Add now"),
                  MyButtonUnfill(onPressed: () {}, text: "Not now"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
