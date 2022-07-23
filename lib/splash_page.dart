//ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:vyavsay/welcome/welcome.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 200,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("Assets/Images/Vyavsay logo.png",),
                fit: BoxFit.fill,
                height: 70,
                width: 85,
              ),
              const Text("Vyavsay", style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),),
            ],
          ),
          const SizedBox(height: 180,),
          const Text("Made In India", style: TextStyle(fontSize:16, fontWeight: FontWeight.bold,),),
          const SizedBox(height: 48,),
          const Image(
            image: AssetImage("Assets/Images/india-gate-vector-illustration 1.png"),
            width: 420,
            height: 280,
            fit: BoxFit.fill,
          ),
        ],
      ),
      nextScreen: const Welcome(),
      backgroundColor: Colors.white,
      duration: 3000,
      splashTransition: SplashTransition.slideTransition,
      splashIconSize: 800,
      centered: true,
    );
  }
}
