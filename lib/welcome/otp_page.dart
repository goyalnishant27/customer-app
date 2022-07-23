// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code

import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyavsay/layout_home.dart';
import 'package:vyavsay/welcome/components/welcome_button.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  int start = 30;
  bool wait = false;
  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String buttonName = "Resend in $start Sec";

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
          title: const Text("OTP Verification"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.h,
          ),
          Text(
            "We have sent a verification code to ",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "+919982914051",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: PinCodeTextField(
              keyboardType: TextInputType.number,
              length: 6,
              appContext: context,
              onChanged: (value) {},
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(15),
                inactiveColor: Colors.black.withOpacity(0.20),
                fieldHeight: 50.h,
                fieldWidth: 40.w,
                activeFillColor: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
          InkWell(
            onTap: wait
                ? null
                : () {
                    startTimer();
                    setState(() {
                      start = 30;
                      wait = true;
                      buttonName = "Resend in $start Sec";
                    });
                  },
            child: Container(
              height: 45.h,
              width: 150.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: wait ? Colors.red:Colors.black.withOpacity(0.17),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  buttonName,
                  style: TextStyle(
                    color: wait ? Colors.red:Colors.black.withOpacity(0.47),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 280.h,
          ),
          SizedBox(
            height: 50.h,
            width: 330.w,
            child: WelcomeButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:
                            (context) =>
                            LayoutHome()));
              },
              text: "Continue",
            ),
          ),
        ],
      ),
    );
  }
}
