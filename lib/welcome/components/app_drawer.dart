import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vyavsay/welcome/components/address.dart';

import '../../controllers/check_user_login_controller.dart';
import '../../views/auth/change_phone_number.dart';

class AppDrawer extends StatefulWidget {
  var checkUserController = Get.find<CheckUserController>();
  AppDrawer({ Key? key }) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  var mobileNo;

  @override
  void initState(){
    super.initState();
    getUserMobileNo();
  }

  getUserMobileNo() async {
     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userType = sharedPreferences.getInt('userType');
    var mobileno = sharedPreferences.getString('mobileNo');
    setState(() {
      mobileNo = mobileno;
    });
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(onTap: () {}, child: child),
      );
      
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Container(
           height: 150,
          child: DrawerHeader(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              Text("Hey there!", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.phone, size: 15,),
                  SizedBox(width: 10,),
                  Text("$mobileNo"),
                ],
              )
            ],
          )),
        ),
       
        ListTile(
          title: GestureDetector(onTap: () async {
            showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30))),
                    builder: (context) => ChangeNumberDialog());
          }, child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("Assets/Images/changeNumber.png", height: 25, width: 25,),
              SizedBox(width: 20,),
              Text("Change Number", style: TextStyle(fontSize: 18),),
            ],
          )),),
          // ListTile(
          // title: GestureDetector(onTap: (){
          //             launch("https://myvyavsay.com/");
          //           }, child: Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Image.asset("Assets/Images/refer.png", height: 25, width: 25,),
          //     SizedBox(width: 20,),
          //     Text("Refer & Earn", style: TextStyle(fontSize: 18),),
          //   ],
          // )),),
          ListTile(
          title: GestureDetector(onTap: (){
            showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30))),
                    builder: (context) => AddressScreen());
          }, child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("Assets/Images/addressIcon.png", height: 25, width: 25,),
              SizedBox(width: 20,),
              Text("Address", style: TextStyle(fontSize: 18),),
            ],
          )),),
          ListTile(
          title: GestureDetector(onTap: (){
                      // launch("https://myvyavsay.com/");

                    showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      
                      Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: 30,
                        child: GestureDetector(onTap: (){
                          Navigator.pop(context);
                        }, child: Container(alignment: Alignment.centerRight, height: 30, width: 30, child: Icon(Icons.close,), color: Colors.white,)),
                      ),
                      Image.asset("Assets/Images/support.jpeg"),
                    ],
                  );
                });



                    }, child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("Assets/Images/help.png", height: 25, width: 25,),
              SizedBox(width: 20,),
              Text("Help & Support", style: TextStyle(fontSize: 18),),
            ],
          )),),
          ListTile(
          title: GestureDetector(onTap: (){
                      launch("https://myvyavsay.com/");
                    }, child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("Assets/Images/about.png", height: 25, width: 25,),
              SizedBox(width: 20,),
              Text("About Us", style: TextStyle(fontSize: 18),),
            ],
          )),),
          SizedBox(height: MediaQuery.of(context).size.height * 0.3,),
           Container(
             margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.28),
             child: ListTile(
                     title: GestureDetector(onTap: () async {
              final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                  sharedPreferences.clear();
                                  widget.checkUserController.checkUser(false);
                     }, child: Row(
              children: [
                // Icon(Icons.logout),
                // SizedBox(width: 20,),
                Text("Log out", style: TextStyle(fontSize: 18, color: Color(0xFFFF3D00)),),
              ],
                     )),
                   ),
           ),
      ]),
    );
  }
}