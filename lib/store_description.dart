import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vyavsay/web_View_flutter.dart';

import 'controllers/search_store_controller.dart';

class StoreDescription extends StatelessWidget {
  const StoreDescription({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: GetBuilder<SearchStoreController>(
        builder: (snapshot) {
          return SingleChildScrollView(
            child: Container(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
                    margin: EdgeInsets.only(left: 20, top: 15),
                    child: Row(
                      children: [
                        GestureDetector(onTap: (){
                          Navigator.pop(context);
                        }, child: Icon(Icons.arrow_back_ios)),
                        SizedBox(width: 10,),
                        //  Text("${snapshot.categoryDescription!.businessName}", style: TextStyle(fontSize: 16.0),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 0.4,
                    // color: Colors.green[800],
                    child: Image.network("https://myvyavsay.com/upload/store/${snapshot.categoryDescription!.storeImage}"),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Center(child: Text("${snapshot.categoryDescription!.businessName}", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width * 0.9, child: Text("${snapshot.categoryDescription!.storeAddress}", maxLines: 4,)),
                        SizedBox(height: 10,),
                        Text("${snapshot.categoryDescription!.city}"),
                        SizedBox(height: 10,),
                        Text("${snapshot.categoryDescription!.pincode}"),
                        SizedBox(height: 10,),
                        // Text("Pincode"),
                        // SizedBox(height: 10,),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  Container(
                    child: Center(child: SizedBox(width: MediaQuery.of(context).size.width * 0.8, child: ElevatedButton(onPressed: (){
                      Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              WebViewFlutter(snapshot.categoryDescription!.storeLink)));
                    }, child: Text("Checkout Store"),))),
                  )
            ]),),
          );
        }
      )),
    );
  }
}