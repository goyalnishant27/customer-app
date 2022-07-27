import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/check_user_login_controller.dart';
import '../../views/auth/change_phone_number.dart';

class AppDrawer extends StatefulWidget {
  var checkUserController = Get.find<CheckUserController>();
  AppDrawer({ Key? key }) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(child: Text("User Name")),
        ListTile(
          title: GestureDetector(onTap: () async {
            final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                sharedPreferences.clear();
                                widget.checkUserController.checkUser(false);
          }, child: Text("Log Out")),
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
          }, child: Text("Change Number")),)
      ]),
    );
  }
}