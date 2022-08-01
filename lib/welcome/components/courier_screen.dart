import 'package:flutter/material.dart';

class CourierScreen extends StatelessWidget {
  const CourierScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Container(margin: EdgeInsets.only(left: 10), child: Text("Anything you need, delivered", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),)),
              SizedBox(height: 10,),
              Container(
            height: 140,
            width: MediaQuery.of(context).size.width * 1.0,
            margin: EdgeInsets.only(left: 10, right: MediaQuery.of(context).size.width * 0.05, top: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Color(0xFF386AB5)),
            child: Container(
              margin: EdgeInsets.only(left: 16, top: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(width: MediaQuery.of(context).size.width * 0.5, child: Text("We will back soon", maxLines: 3, style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),)),
                    SizedBox(height: 10,),
                    Container(width: MediaQuery.of(context).size.width * 0.45, child: Text("We’ll resume fulfilling orders in your area soon", maxLines: 3, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.normal))),
                    // SizedBox(height: 10,),
                  ]),
                  
                  Image.asset("Assets/Images/horn.png", height: 120, width: MediaQuery.of(context).size.width * 0.25,),
                ],
              ),
            ),
          ),
          SizedBox(height: 40,),
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width * 1.0,
            margin: EdgeInsets.only(left: 10, right: MediaQuery.of(context).size.width * 0.05, top: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.white, border: Border.all(color: Color(0xFFC4C4C4), width: 1)),
            child: Container(
              margin: EdgeInsets.only(left: 16, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(width: MediaQuery.of(context).size.width * 0.6, child: Text("Pickup or Drop any items", maxLines: 3, style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),)),
                SizedBox(height: 16,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Container(height: 34, width: MediaQuery.of(context).size.width * 0.4, decoration: BoxDecoration(color: Color(0xFF134DA5), borderRadius: BorderRadius.circular(10)), child: Center(child: Text("Temporarily Unavailable", style: TextStyle(fontSize: 16.0, color: Colors.white),)))
                  // ElevatedButton(onPressed: (){
                                    
                  //                   // Navigator.pop(context);
                  //                 }, child: Text("Temporarily Unavailable", style: TextStyle(fontSize: 16.0),), style: ElevatedButton.styleFrom(primary: Color(0xFF134DA5)),),
                )
              ]),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
          Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Container(height: 40, width: MediaQuery.of(context).size.width * 0.4, decoration: BoxDecoration(color: Color(0xFF134DA5), borderRadius: BorderRadius.circular(10)), child: Center(child: Text("Confirm Order", style: TextStyle(fontSize: 16.0, color: Colors.white),)))
                  // ElevatedButton(onPressed: (){
                                    
                  //                   // Navigator.pop(context);
                  //                 }, child: Text("Confirm Order", style: TextStyle(fontSize: 16.0),), style: ElevatedButton.styleFrom(primary: Color(0xFF134DA5)),),
                )
            ],
          ),
        ),
      )
      // Image.asset("Assets/Images/courierScreen.png", height: MediaQuery.of(context).size.height * 1.0, width:  MediaQuery.of(context).size.width * 1.0, fit: BoxFit.fill,),
    );
  }
}