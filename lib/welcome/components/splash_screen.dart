import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vyavsay/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 3),
  //         ()=>Navigator.pushReplacement(context,
  //                                       MaterialPageRoute(builder:
  //                                                         (context) => 
  //                                                         MyApp()
  //                                                        )
  //                                      )
  //        );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
      ),
    );
  }
}