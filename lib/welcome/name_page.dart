// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyavsay/welcome/components/welcome_button.dart';

class NamePage extends StatelessWidget {
  const NamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                ),
              ],
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          backgroundColor: const Color(0xFF134DA5),
          centerTitle: true,
          title: const Text("Enter Business Details"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20..h,
          ),
          Row(
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
                      width: 270,
                      child: Text(
                        "Please add business name which will be your store link. For e.g if your business name is gupta burgers then your store link will be https://myvyavsay.com/m/guptaburgers ",
                        style: TextStyle(
                          color: Color(0xFF134DA5),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                        textDirection: TextDirection.ltr,
                        maxLines: 4,
                        // overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
                // child: ,
              ),
            ],
          ),
          SizedBox(
            height: 80.h,
          ),
          SizedBox(
            width: 300.w,
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.black,
                hintText: "Business Name", 
                hintStyle: TextStyle(
                  wordSpacing: 1.5,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          SizedBox(
            width: 300.w,
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.black,
                hintText: "Business Category", 
                hintStyle: TextStyle(
                  wordSpacing: 1.5,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 320.h,
          ),
          SizedBox(
            height: 50.h,
            width: 330.w,
            child: WelcomeButton(
              onPressed: () {},
              text: "Finish",
            ),
          ),
        ],
      ),
    );
  }
}
