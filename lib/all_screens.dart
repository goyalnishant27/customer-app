import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vyavsay/layout_home.dart';
import 'package:vyavsay/previous_order.dart';
import 'package:vyavsay/views/google_serach_cities.dart';
import 'package:vyavsay/welcome/components/courier_screen.dart';
import 'package:vyavsay/welcome/components/offers_screen.dart';
import '../controllers/restaurent_details_controller.dart';
import 'controllers/check_user_login_controller.dart';
import 'controllers/select_city_controller.dart';
import 'welcome/components/app_drawer.dart';


class AllScreens extends StatefulWidget {
  
  AllScreens({Key? key}) : super(key: key);

  @override
  State<AllScreens> createState() => _AllScreensState();
}

class _AllScreensState extends State<AllScreens> {
  var currentIndex = 0;
  var loggedInMobNo;
  List<Widget> screens = [];
  var selectCityController = Get.put(SelectCityController());
  var restaurentDetailsController = Get.put(RestaurentDetailsController());
  
  
  @override
  void initState(){
    super.initState();
    checkUserExist().whenComplete(() async {
      // Timer(Duration(seconds: 1), () => loggedInMobNo != null ? 
      //  checkUserController.checkUser(true)
      // : checkUserController.checkUser(false));
    });
  }

  Future checkUserExist() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var currentMobileNo = sharedPreferences.getString('mobileNo');
    setState(() {
      loggedInMobNo = currentMobileNo;
    });
    print(loggedInMobNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer(),
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 105,
          backgroundColor: const Color(0xff134DA5).withOpacity(0.93),
          leading: Row(
            children: [
              SizedBox(
                width: 3,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              GoogleSearchCities()));
                },
                child: Icon(
                  Icons.location_pin,
                  size: 25,
                ),
              ), 
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: (){
                  // widget.storeController.updateCity(true);
                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              GoogleSearchCities()));
                },
                child: GetBuilder<SelectCityController>(
                  builder: (snapshot) {
                    return Text(
                      "${snapshot.cityName}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
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
      body: SafeArea(
          child: GetBuilder<CheckUserController>(
           
            builder: (snapshot) {
              return IndexedStack(
                  index: currentIndex,
                  children: [LayoutHome(), CourierScreen(), OffersScreen(), PreviousOrder(),],
                );
            }
          )),
      bottomNavigationBar: GetBuilder<CheckUserController>(
       
        builder: (snapshot) {
          return ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              child: BottomNavigationBar(
                selectedLabelStyle: TextStyle(
                    fontFamily: 'BrandonMed',
                    fontSize: 14,
                    color: Color.fromARGB(255, 66, 155, 227)),
                unselectedLabelStyle:
                    TextStyle(fontFamily: 'BrandonReg', fontSize: 14),
                backgroundColor: Color(0xFFFFFFFF),
                //      backgroundColor: Colors.black,
                elevation: 5,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Color.fromRGBO(43, 99, 175, 1),
                currentIndex: currentIndex,
                unselectedItemColor: Color.fromRGBO(158, 158, 158, 1),
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                items: 
                // snapshot.isUserLoggedIn == true ? [
                //   BottomNavigationBarItem(
                //       icon: Container(
                //         height: 25,
                //         width: 25,
                //         child: Icon(Icons.home),
                //       ),
                //       label: "Home"),
                //       BottomNavigationBarItem(
                //       icon: Container(
                //         height: 25,
                //         width: 25,
                //         child: Icon(Icons.home),
                //       ),
                //       label: "Bag"),
                //       BottomNavigationBarItem(
                //       icon: Container(
                //         height: 25,
                //         width: 25,
                //         child: Icon(Icons.home),
                //       ),
                //       label: "Account")
                //] : 
                [
                  BottomNavigationBarItem(
                      icon:Image.asset("Assets/Images/storeImage.png", height: 20, width: 25,),
                      label: "Store"),
                      BottomNavigationBarItem(
                      icon: Image.asset("Assets/Images/courierIcon.png", height: 25, width: 25,),
                      label: "Courier"),
                      BottomNavigationBarItem(
                      icon: Image.asset("Assets/Images/offers.png", height: 25, width: 25,),
                      label: "Offers"),
                      BottomNavigationBarItem(
                      icon: Image.asset("Assets/Images/ordersImage.png", height: 20, width: 25,),
                      label: "Orders"),
                ],
              ));
        }
      ),
    );
  }
}
