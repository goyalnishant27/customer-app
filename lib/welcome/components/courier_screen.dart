import 'package:flutter/material.dart';

class CourierScreen extends StatelessWidget {
  const CourierScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("Assets/Images/courierScreen.png", height: MediaQuery.of(context).size.height * 1.0, width:  MediaQuery.of(context).size.width * 1.0, fit: BoxFit.fill,),
    );
  }
}