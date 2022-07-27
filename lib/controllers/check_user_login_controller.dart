import 'package:get/get.dart';

class CheckUserController extends GetxController{

  var isUserLoggedIn = false;

  checkUser(val){
    isUserLoggedIn = val;
    update();
  }

}