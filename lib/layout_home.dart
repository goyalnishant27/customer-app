// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vyavsay/controllers/category_service_controller.dart';
import 'package:vyavsay/controllers/city_controller.dart';
import 'package:vyavsay/controllers/search_store_controller.dart';
import 'package:vyavsay/previous_order.dart';
import 'package:vyavsay/web_View_flutter.dart';
import 'package:vyavsay/welcome/components/app_drawer.dart';

import 'layout_groceries.dart';

class LayoutHome extends StatefulWidget {
  var categoryServiceController = Get.put(CategoryServiceController());
  var storeController = Get.put(SearchStoreController());
  var cityController = Get.put(CityController());
  LayoutHome({Key? key}) : super(key: key);

  @override
  State<LayoutHome> createState() => _LayoutHomeState();
}

class _LayoutHomeState extends State<LayoutHome> {

  var categoryList = [
    {
      'categoryName': "Restaurent",
      'categoryParam': 'res'
    },
    {
      'categoryName': "Grocery",
      'categoryParam': 'grocery'
    },
    {
      'categoryName': "Laundary",
      'categoryParam': 'laundary'
    },
    {
      'categoryName': "Restaurent",
      'categoryParam': 'res'
    },
    {
      'categoryName': "Restaurent",
      'categoryParam': 'res'
    },
    {
      'categoryName': "Restaurent",
      'categoryParam': 'res'
    },
  ];
  TextEditingController searchStoreController = TextEditingController();

  @override
  void initState(){
    super.initState();
    // widget.categoryServiceController.getCategoryData();
  }

  onTapOfOrders(){

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        endDrawer: AppDrawer(),
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 75,
          backgroundColor: const Color(0xff134DA5).withOpacity(0.93),
          leading: Row(
            children: [
              SizedBox(
                width: 3,
              ),
              Icon(
                Icons.location_pin,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: (){
                  widget.storeController.updateCity(true);
                },
                child: Text(
                  "Delhi",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          // actions: <Widget>[
          //   IconButton(onPressed: (){
          //     Scaffold.of(context).openDrawer();
          //   }, icon: Image.asset("Assets/Images/Account.png"))
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // GetBuilder<CategoryServiceController>(
              //   builder: (snapshot) {
              //     return Text("${snapshot.categoriesList[0].id}");
              //   }
              // ),
              Container(
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xff134DA5).withOpacity(0.93),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.91,
                      margin: EdgeInsets.only(
                        bottom: 15,
                        left: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
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
                            child: GetBuilder<SearchStoreController>(
                              builder: (cityCont) {
                                return TextField(
                                  controller: searchStoreController,
                                  decoration: InputDecoration(
                                    hintText: "Search for Store",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  onChanged: (val){
                                    if(cityCont.isCitySelected == false){
                                      widget.storeController.getStores(val);
                                    }else{
                                      widget.storeController.getCity(val);
                                    }
                                  },
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 40,
              // ),
              GetBuilder<SearchStoreController>(
            
            builder: (snapshot) {
                    return snapshot.storeString != "" && snapshot.storeList.length >= 1 ? Container(
                      margin: EdgeInsets.only(top: 10),
                      height: snapshot.storeList.length >= 1 ? 200 : 0,
                      child: ListView.builder(itemCount: snapshot.storeList.length, scrollDirection: Axis.vertical, itemBuilder: (BuildContext context, int itemIndex){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              WebViewFlutter(snapshot.storeList[itemIndex].storeLink)));
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                
                                          SizedBox(width: 14,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 18,),
                                    Text(snapshot.storeList[itemIndex].businessName.toString()),
                                    // SizedBox(height: 18,),
                                    // Text("${snapshot.storeList[itemIndex].businessName}rs", style: TextStyle(decoration: TextDecoration.lineThrough,)),
                                  ],
                                ),
                                // SizedBox(width: 14,),
                                // Column(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     SizedBox(height: 18,),
                                //     // Text(snapshot.searchedItems[itemIndex].itemName),
                                //     SizedBox(height: 32,),
                                //     Text("${snapshot.storeList[itemIndex].businessName}rs"),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ) : SizedBox();
                  }
                ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.45,
                child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                           maxCrossAxisExtent: 120,
                  childAspectRatio: 0.66,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
                      itemCount: categoryList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                            onTap: (){
                              widget.categoryServiceController.updateCategoryType('${categoryList[index]['categoryParam']}');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              Groceries(categoryList[index]['categoryName'])));
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 147,
                                  width: 114,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(4, 4),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                      "Assets/welcomeScreens/Google.png"),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${categoryList[index]['categoryName']}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                }),
              ),
              // SizedBox(
              //   height: 390,
              //   child: ListView(
              //     physics: NeverScrollableScrollPhysics(),
              //     children: [
              //       ListTile(
              //         title: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: [
              //             GestureDetector(
              //               onTap: (){
              //                 widget.categoryServiceController.updateCategoryType('res');
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder:
              //                             (context) =>
              //                                 Groceries()));
              //               },
              //               child: Column(
              //                 children: [
              //                   Container(
              //                     height: 157,
              //                     width: 114,
              //                     decoration: BoxDecoration(
              //                       color: Colors.white,
              //                       borderRadius: BorderRadius.circular(10),
              //                       boxShadow: [
              //                         BoxShadow(
              //                           color: Colors.grey,
              //                           offset: Offset(4, 4),
              //                           blurRadius: 10,
              //                         ),
              //                       ],
              //                     ),
              //                     child: Image.asset(
              //                         "Assets/welcomeScreens/Google.png"),
              //                   ),
              //                   SizedBox(
              //                     height: 5,
              //                   ),
              //                   Text(
              //                     "Restaurant",
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Column(
              //               children: [
              //                 Container(
              //                   height: 157,
              //                   width: 119,
              //                   decoration: BoxDecoration(
              //                     color: Colors.white,
              //                     borderRadius: BorderRadius.circular(10),
              //                     boxShadow: [
              //                       BoxShadow(
              //                         color: Colors.grey,
              //                         offset: Offset(4, 4),
              //                         blurRadius: 10,
              //                       ),
              //                     ],
              //                   ),
              //                   child: Image.asset(
              //                       "Assets/welcomeScreens/Google.png"),
              //                 ),
              //                 SizedBox(
              //                   height: 5,
              //                 ),
              //                 Text(
              //                   "Restaurant",
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Column(
              //               children: [
              //                 Container(
              //                   height: 157,
              //                   width: 114,
              //                   decoration: BoxDecoration(
              //                     color: Colors.white,
              //                     borderRadius: BorderRadius.circular(10),
              //                     boxShadow: [
              //                       BoxShadow(
              //                         color: Colors.grey,
              //                         offset: Offset(4, 4),
              //                         blurRadius: 10,
              //                       ),
              //                     ],
              //                   ),
              //                   child: Image.asset(
              //                       "Assets/welcomeScreens/Google.png"),
              //                 ),
              //                 SizedBox(
              //                   height: 5,
              //                 ),
              //                 Text(
              //                   "Grocery",
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //       ListTile(
              //         title: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: [
              //             Column(
              //               children: [
              //                 Container(
              //                   height: 157,
              //                   width: 114,
              //                   decoration: BoxDecoration(
              //                     color: Colors.white,
              //                     borderRadius: BorderRadius.circular(10),
              //                     boxShadow: [
              //                       BoxShadow(
              //                         color: Colors.grey,
              //                         offset: Offset(4, 4),
              //                         blurRadius: 10,
              //                       ),
              //                     ],
              //                   ),
              //                   child: Image.asset(
              //                       "Assets/welcomeScreens/Google.png"),
              //                 ),
              //                 SizedBox(
              //                   height: 5,
              //                 ),
              //                 Text(
              //                   "Stationary",
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Column(
              //               children: [
              //                 Container(
              //                   height: 157,
              //                   width: 119,
              //                   decoration: BoxDecoration(
              //                     color: Colors.white,
              //                     borderRadius: BorderRadius.circular(10),
              //                     boxShadow: [
              //                       BoxShadow(
              //                         color: Colors.grey,
              //                         offset: Offset(4, 4),
              //                         blurRadius: 10,
              //                       ),
              //                     ],
              //                   ),
              //                   child: Image.asset(
              //                       "Assets/welcomeScreens/Google.png"),
              //                 ),
              //                 SizedBox(
              //                   height: 5,
              //                 ),
              //                 Text(
              //                   "Laundry",
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Column(
              //               children: [
              //                 Container(
              //                   height: 157,
              //                   width: 114,
              //                   decoration: BoxDecoration(
              //                     color: Colors.white,
              //                     borderRadius: BorderRadius.circular(10),
              //                     boxShadow: [
              //                       BoxShadow(
              //                         color: Colors.grey,
              //                         offset: Offset(4, 4),
              //                         blurRadius: 10,
              //                       ),
              //                     ],
              //                   ),
              //                   child: Image.asset(
              //                       "Assets/welcomeScreens/Google.png"),
              //                 ),
              //                 SizedBox(
              //                   height: 5,
              //                 ),
              //                 Text(
              //                   "Restaurant",
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 215,
                width: 414,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 7,
                      offset: Offset(4, 4),
                    ),
                  ],
                  border: Border.all(
                    width: 1.65,
                    color: Colors.grey,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(width: MediaQuery.of(context).size.width * 0.97, height: 191, child: Image.asset("Assets/Images/holdOn.png")),
                            // SizedBox(
                            //   height: 7,
                            // ),
    
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Top Picks For You",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: 500,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 500,
                      child: Row(
                        children: [
                          Container(
                            height: 145,
                            width: 240,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(2, 4),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 145,
                            width: 240,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(2, 4),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
    
                  Container(width: MediaQuery.of(context).size.width * 1.0, height: 250, child: Image.asset("Assets/Images/resume.png", fit: BoxFit.fill,)),
    
    
                ],
              ),
    
              Container(
                height: 82,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 242, 242),
                  border: Border.all(
                    width: 1.2,
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Store",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: (){
                         Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              PreviousOrder()));
                      },
                      child: Text(
                        "Orders",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
