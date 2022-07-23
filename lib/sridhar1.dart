// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileUIPage extends StatelessWidget {
  const ProfileUIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 800.h,
            width: 350.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.orange.withOpacity(0.73),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 88.0),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Container(
                          height: 80.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 5,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Image(
                            image: AssetImage("Assets/Images/India.png"),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 49.h,
                        left: 50.w,
                        child: Container(
                          height: 32.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                            color: Colors.red[400],
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add_a_photo_rounded, size: 16),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      height: 100.h,
                      width: 350.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Text(
                            "John Richard",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "18 E-Books",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 80.h,
                          ),
                          Container(
                            width: 300.w,
                            height: 65.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 20.w,),
                                Icon(
                                  Icons.credit_card,
                                  size: 40,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                Text(
                                  "Payment Methods",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            width: 300.w,
                            height: 65.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 20.w,),
                                Icon(
                                  Icons.notifications,
                                  size: 40,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                Text(
                                  "Notifications",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            width: 300.w,
                            height: 65.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 20.w,),
                                Icon(
                                  Icons.lock,
                                  size: 40,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                Text(
                                  "Change Password",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            width: 300.w,
                            height: 65.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 20.w,),
                                Icon(
                                  Icons.logout_outlined,
                                  size: 40,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                Text(
                                  "Log Out",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
