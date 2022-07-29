import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vyavsay/models/category_service_model.dart';

import '../../controllers/select_city_controller.dart';

class StoreServices{

  var selectCityController = Get.find<SelectCityController>(); 

  Future<List<CategoryService>> getCategory(category) async {
    try{
    var listdecodedData = [];
    var path = Uri.parse("https://myvyavsay.com/userapi/storelist");
    var header = {
    'Client-Service': 'digistore',
    'Auth-Key': '12022022'
    };
    var jsonData = await http.post(
        path,
        headers: header,
        body: {
          'category': category,
          'city': selectCityController.cityName
        },
      );
    var jsonResult = jsonDecode(jsonData.body);
    if(jsonData.statusCode == 200){
      var decodedData = jsonResult['data'];
      listdecodedData.addAll(decodedData);
      var orders = listdecodedData.map((e) => CategoryService.fromJSON(e)).toList();
      return orders;
    }else{
      return [];
    }
    }catch(error){
      throw Exception(error);
    }
  }

  Future<List<CategoryService>> getStores(store) async {
    try{
    var listdecodedData = [];
    var path = Uri.parse("https://myvyavsay.com/userapi/storelist");
    var header = {
    'Client-Service': 'digistore',
    'Auth-Key': '12022022'
    };
    var jsonData = await http.post(
        path,
        headers: header,
        body: {
          'storename': store,
          'city': selectCityController.cityName
        },
      );
    var jsonResult = jsonDecode(jsonData.body);
    if(jsonData.statusCode == 200){
      var decodedData = jsonResult['data'];
      listdecodedData.addAll(decodedData);
      var orders = listdecodedData.map((e) => CategoryService.fromJSON(e)).toList();
      return orders;
    }else{
      return [];
    }
    }catch(error){
      throw Exception(error);
    }
  }

  Future<List<CategoryService>> getCities(city) async {
    try{
    var listdecodedData = [];
    var path = Uri.parse("https://myvyavsay.com/userapi/storelist");
    var header = {
    'Client-Service': 'digistore',
    'Auth-Key': '12022022'
    };
    var jsonData = await http.post(
        path,
        headers: header,
        body: {
          'city': city,
        },
      );
    var jsonResult = jsonDecode(jsonData.body);
    if(jsonData.statusCode == 200){
      var decodedData = jsonResult['data'];
      listdecodedData.addAll(decodedData);
      var orders = listdecodedData.map((e) => CategoryService.fromJSON(e)).toList();
      return orders;
    }else{
      return [];
    }
    }catch(error){
      throw Exception(error);
    }
  }
}