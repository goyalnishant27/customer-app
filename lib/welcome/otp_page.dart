// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vyavsay/all_screens.dart';
import 'package:vyavsay/layout_home.dart';
import 'package:vyavsay/welcome/components/welcome_button.dart';

import '../login_services/login_service.dart';

class OTPPage extends StatefulWidget {
  var mobileNumber;
  OTPPage(this.mobileNumber);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {

  LogInService logInService = LogInService();
  TextEditingController otpController = TextEditingController();

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

  onConfirmOfOtp() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userType = sharedPreferences.getInt('userType');
    var mobileNo = sharedPreferences.getString('mobileNo');
    var otpConfirmResult =  await logInService.confirm(phone: mobileNo!, otp: otpController.text, userType: userType.toString());
    if(otpConfirmResult != ""){
      sharedPreferences.setString('userId', otpConfirmResult['data']['id']);
      Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:
                            (context) =>
                            AllScreens()));
    }else{
      Get.snackbar("Login Failed", "Entered Wrong Otp", snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
    }
  }

  @override
  Widget build(BuildContext context) {
    String buttonName = "Resend in $start Sec";

    ScreenUtil.init(context, designSize: const Size(360, 800));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
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
            "+91${widget.mobileNumber}",
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
              controller: otpController,
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
                onConfirmOfOtp();
              },
              text: "Continue",
            ),
          ),
        ],
      ),
    );
  }
}
