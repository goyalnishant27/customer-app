import 'package:flutter/material.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width * 1.0,
          margin: EdgeInsets.only(left: 10, right: MediaQuery.of(context).size.width * 0.1, top: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Color(0xFFCADFFF)),
          child: Container(
            margin: EdgeInsets.only(left: 16, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(width: MediaQuery.of(context).size.width * 0.6, child: Text("We are working hard to get you best offers directly from store.", maxLines: 3, style: TextStyle(color: Color(0xFF134DA5), fontSize: 18.0, fontWeight: FontWeight.bold),)),
              SizedBox(height: 10,),
              Container(width: MediaQuery.of(context).size.width * 0.5, child: Text("You can still order directly from the stores and check ongoing coupons", maxLines: 3, style: TextStyle(color: Color(0xFF134DA5), fontSize: 16.0, fontWeight: FontWeight.normal))),
              SizedBox(height: 10,),
              Container(height: 30, width: MediaQuery.of(context).size.width * 0.4, decoration: BoxDecoration(color: Color(0xFF134DA5), borderRadius: BorderRadius.circular(10)), child: Center(child: Text("See Local Stores", style: TextStyle(fontSize: 16.0, color: Colors.white),)))
            ]),
          ),
        )
      ]),
    );
  }
}