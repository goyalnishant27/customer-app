// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Alert7 extends StatelessWidget {
  const Alert7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return Scaffold(
      body: Center(
        child: Container(
          // alignment: Alignment.centerRight,
          height: 50.h,
          width: double.infinity,
          color: const Color(0xFF4CAF50),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 232.4.w,
                height: 50.h,
                alignment: Alignment.center,
                child: Text(
                  "Request online payment",
                  style: TextStyle(
                    fontSize: 22,
                    wordSpacing: 2,
                    color: Colors.white,
                  ),
                ),
              ),
              
              Container(
                // alignment: Alignment.centerRight,
                width: 127.6.w,
                height: 50.h,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 9,
                      child: Transform.rotate(
                        angle: 20.43,
                        child: ClipPath(
                          clipper: TriangleClipper(),
                          child: Container(
                            // padding: EdgeInsets.only(left: 180,),
                            color: Colors.white,
                            height: 40.h,
                            width: 45.w,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: 50.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Container(
                          // padding: EdgeInsets.all(4),
                          height: 15,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF4CAF50),
                              width: 2,
                            ),
                          ),
                          child: Text(
                            "Request",
                            style: TextStyle(
                              color: const Color(0xFF4CAF50),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
