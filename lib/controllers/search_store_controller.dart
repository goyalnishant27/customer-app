import 'package:get/get.dart';

import '../models/category_service_model.dart';
import '../services/home_services/store_service.dart';

class SearchStoreController extends GetxController {

  var storeList = <CategoryService>[];
  StoreServices storeServices = StoreServices();
  var storeString = "";

  var cityList = <CategoryService>[];
  var cityString = "";
  var isCitySelected = false;

  getCity(city) async {
    var stores = await storeServices.getCities(city);
    storeString = city;
    storeList = stores;
    update();
  } 

  updateCity(val){
    isCitySelected = val;
    update();
  }


  getStores(store) async {
    var stores = await storeServices.getStores(store);
    storeString = store;
    storeList = stores;
    update();
  } 

}