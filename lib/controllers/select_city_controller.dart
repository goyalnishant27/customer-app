import 'package:get/get.dart';

class SelectCityController extends GetxController {

  var cityName = "Delhi";

  updateCityName(city){
    cityName = city;
    update();
  }

}