import 'package:get/get.dart';

import '../models/category_service_model.dart';
import '../services/home_services/store_service.dart';

class CityController extends GetxController {

  var cityList = <CategoryService>[];
  StoreServices storeServices = StoreServices();
  var cityString = "";
  var isCitySelected = false;

  getCity(city) async {
    var stores = await storeServices.getCities(city);
    cityString = city;
    cityList = stores;
    update();
  } 

  updateCity(val){
    isCitySelected = val;
    update();
  }

}