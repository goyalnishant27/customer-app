// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vyavsay/controllers/category_service_controller.dart';
import 'package:vyavsay/web_View_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Groceries extends StatefulWidget {
  var categoryServiceController = Get.find<CategoryServiceController>();
  var categoryName;
  Groceries(this.categoryName);

  @override
  State<Groceries> createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
  

  @override
  void initState(){
    super.initState();
    // widget.categoryServiceController.clearSearch();
    widget.categoryServiceController.getCategoryData();
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: const Icon(Icons.arrow_back),
      //   iconTheme: const IconThemeData(
      //     color: Colors.black,
      //   ),
      //   title: const Text(
      //     "Grocery",
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  GestureDetector(onTap: (){
                    Navigator.pop(context);
                  }, child: Icon(Icons.arrow_back)),
                  SizedBox(width: 10,),
                   Text("${widget.categoryName}", style: TextStyle(fontSize: 16.0),),
                ],
              ),
            ),
            Container(
              height: 80,
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.91,
                    margin: const EdgeInsets.only(
                      bottom: 15,
                      left: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffC4C4C4).withOpacity(.30),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 3),
                        SizedBox(
                          width: 30,
                          child: Icon(
                            Icons.search,
                            color: Colors.grey.withOpacity(.50),
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.79,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search for Store",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onChanged: (val){
                              widget.categoryServiceController.searchCategory(val);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // GetBuilder<CategoryServiceController>(
            
            // builder: (snapshot) {
            //         return snapshot.searchCategroryString != "" && snapshot.searchCategoryList.length >= 1 ? Container(
            //           margin: EdgeInsets.only(top: 10),
            //           height: snapshot.searchCategoryList.length >= 1 ? 200 : 0,
            //           child: ListView.builder(itemCount: snapshot.searchCategoryList.length, scrollDirection: Axis.vertical, itemBuilder: (BuildContext context, int itemIndex){
            //             return GestureDetector(
            //               onTap: (){
            //                 Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                           builder:
            //                               (context) =>
            //                                   WebViewFlutter(snapshot.searchCategoryList[itemIndex].storeLink)));
            //               },
            //               child: Container(
            //                 height: 50,
            //                 width: MediaQuery.of(context).size.width * 0.9,
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.start,
            //                   children: [
                                
            //                               SizedBox(width: 14,),
            //                     Column(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         SizedBox(height: 18,),
            //                         Text(snapshot.searchCategoryList[itemIndex].businessName.toString()),
            //                         // SizedBox(height: 18,),
            //                         // Text("${snapshot.storeList[itemIndex].businessName}rs", style: TextStyle(decoration: TextDecoration.lineThrough,)),
            //                       ],
            //                     ),
            //                     // SizedBox(width: 14,),
            //                     // Column(
            //                     //   mainAxisAlignment: MainAxisAlignment.center,
            //                     //   children: [
            //                     //     SizedBox(height: 18,),
            //                     //     // Text(snapshot.searchedItems[itemIndex].itemName),
            //                     //     SizedBox(height: 32,),
            //                     //     Text("${snapshot.storeList[itemIndex].businessName}rs"),
            //                     //   ],
            //                     // ),
            //                   ],
            //                 ),
            //               ),
            //             );
            //           }),
            //         ) : SizedBox();
            //         }
            //     ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.76,
              width: MediaQuery.of(context).size.width * 0.98,
              child: GetBuilder<CategoryServiceController>(
                builder: (snapshot) {
                  return ListView.builder(scrollDirection: Axis.vertical, itemCount: snapshot.searchCategroryString== "" && snapshot.searchCategoryList.isEmpty ? snapshot.categoriesList.length :  snapshot.searchCategoryList.length, itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: (){
                        var store_link = snapshot.categoriesList[index].businessName!.replaceAll(" ", "-");
                        var final_store_link = "https://myvyavsay.com/m/$store_link";
                        // Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder:
                        //                   (context) =>
                        //                       WebViewFlutter(final_store_link)));
                         launch("$final_store_link");
                      },
                      child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Container(
                          //   height: 104,
                          //   width: 90,
                          //   color: Color(0xffD9D9D9),
                          // ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network("https://myvyavsay.com/upload/store/${snapshot.categoriesList[index].storeImage}", width: 100, height: 100, fit: BoxFit.fill, errorBuilder:
                                                    (context, error, stacktrace) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: Container(
                                                      height: 100,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  );
                                                }),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.46,
                                child: Text(
                                  snapshot.searchCategroryString == "" && snapshot.searchCategoryList.isEmpty ? "${snapshot.categoriesList[index].businessName}" : "${snapshot.searchCategoryList[index].businessName}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  maxLines: 3,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text("1.1kms", style: TextStyle(
                                  //       fontSize: 13,
                                  //       color: Colors.grey,
                                  //     ),),
                                      SizedBox(width: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.20,
                                    child: Text(
                                      snapshot.searchCategroryString == "" && snapshot.searchCategoryList.length <= 0 ? "${snapshot.categoriesList[index].city}" : "${snapshot.searchCategoryList[index].city}",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              // Text(
                              //   "18mins",
                              //   style: TextStyle(
                              //     fontSize: 14,
                              //     color: Colors.black.withOpacity(0.5),
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          // Text(
                          //   "Open",
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //     color: Color(0xff4CAF50),
                          //   ),
                          // ),
                        ],
                      ),
                                      ),
                    );
                  });
                }
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
