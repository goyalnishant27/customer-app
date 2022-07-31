import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vyavsay/all_screens.dart';
import 'package:vyavsay/layout_home.dart';
import 'package:vyavsay/splash_page.dart';
import 'package:vyavsay/welcome/name_page.dart';
import 'package:vyavsay/welcome/otp_page.dart';
import 'package:vyavsay/welcome/welcome.dart';

import 'controllers/check_user_login_controller.dart';
// import 'package:vyavsay/sridhar.dart';
// import 'package:vyavsay/sridhar1.dart';
// import 'package:vyavsay/welcome/name_page.dart';
// import 'package:vyavsay/welcome/otp_page.dart';
// import 'package:vyavsay/welcome/welcome.dart';
// import 'package:vyavsay/qr/digital_india.dart';
// import 'package:vyavsay/alerts/alert5.dart';
// import 'package:vyavsay/alerts/alert6.dart';
// import 'package:vyavsay/alerts/alert7.dart';
// import 'package:vyavsay/qr/contactless_pay.dart';
// import 'package:vyavsay/qr/online_apnao.dart';
// import 'package:vyavsay/alerts/alert1.dart';
// import 'package:vyavsay/alerts/alert2.dart';
// import 'package:vyavsay/alerts/alert3.dart';
// import 'package:vyavsay/alerts/alert4.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  var checkUserController = Get.put(CheckUserController());
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  var isLoading = true;

  @override
  void initState(){
    super.initState();
    getUser();
  }

  getUser() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userId = sharedPreferences.getString('userId');
    if(userId != null){
      widget.checkUserController.checkUser(true);
    }else{
      widget.checkUserController.checkUser(false);
    }
    Timer(Duration(seconds: 3), () => setState(() {
      isLoading = false;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home:  const Alert1(),
      home: isLoading == true ? SplashScreen() : GetBuilder<CheckUserController>(
        builder: (snapshot) {
          return snapshot.isUserLoggedIn == true ? AllScreens() : Welcome();
        }
      ),
    );
  }
}

