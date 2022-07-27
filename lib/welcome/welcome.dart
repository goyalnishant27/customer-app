// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vyavsay/login_services/login_service.dart';
import 'package:vyavsay/welcome/components/welcome_button.dart';
import 'package:vyavsay/welcome/otp_page.dart';

class Welcome extends StatefulWidget {
//   final maskFormatter =  MaskTextInputFormatter(
//   mask: '+## #####-#####',
// );

  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  TextEditingController mobileNoController = TextEditingController();
  LogInService logInService = LogInService();

  onClickOfLogIn() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var logInResult = await logInService.signup(name: "Sridhar", phone: mobileNoController.text);
    if(logInResult != ""){
      sharedPreferences.setString('mobileNo', logInResult['mobile_number']);
      sharedPreferences.setInt('userType', logInResult['user_type']);
      Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:
                            (context) =>
                            OTPPage(mobileNoController.text)));
    }else{
      Get.snackbar("Login Failed", "Something went wrong", snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("Assets/Images/Vyavsay logo.png"),
                  height: 60.h,
                  width: 65.w,
                  fit: BoxFit.cover,
                ),
                Text(
                  " Vyavsay",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Trusted by ",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "1 lakh ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Businesses",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 250.h,
              width: 360.w,
              child: Image(
                image: AssetImage("Assets/welcomeScreens/Online Food Store.png"),
              ),
            ),
            Column(
              children: [
                Text(
                  "Grow your Business",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Everything that you can sell Online",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.63),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Image(
                  image: AssetImage("Assets/welcomeScreens/Line 65.png"),
                  height: 1.5.h,
                  width: 120.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Login or signup",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.50),
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Image(
                  image: AssetImage("Assets/welcomeScreens/Line 65.png"),
                  height: 1.5.h,
                  width: 120.w,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.20),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image(
                    image: AssetImage("Assets/welcomeScreens/India (1).png"),
                  ),
                ),
                // SizedBox(
                //   width: 25.h,
                // ),
                Container(
                  height: 40.h,
                  width: 230.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.20),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      controller: mobileNoController,
                      enableSuggestions: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixText: "+91",
                        prefixStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40.h,
              width: 250.w,
              child: WelcomeButton(onPressed: () {
                onClickOfLogIn();
              }, text: "Continue"),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Image(
                  image: AssetImage("Assets/welcomeScreens/Line 65.png"),
                  height: 1.5.h,
                  width: 150.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  " or ",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.50),
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Image(
                  image: AssetImage("Assets/welcomeScreens/Line 65.png"),
                  height: 1.5.h,
                  width: 150.w,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.20),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image(
                    image: AssetImage("Assets/welcomeScreens/Vector.png"),
                  ),
                ),
                Container(
                  height: 40.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.20),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image(
                    image: AssetImage("Assets/welcomeScreens/Google.png"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            Column(
              children: [
                Text(
                  "By continuing, you agree to our ",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Image(
                  image: AssetImage(
                    "Assets/welcomeScreens/Terms & Conditions Privacy Policies.png",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
