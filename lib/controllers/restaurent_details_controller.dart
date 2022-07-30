import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/restaurent_model.dart';

class RestaurentDetailsController extends GetxController {
  
  var restaurentDetails;
  var deliveryType = 1;
  var couponControllerText = "";

  @override
  void onInit() {
    super.onInit();
    getRestaurentDetails();
  }

  getRestaurentDetails() async {
    var path = Uri.parse("https://myvyavsay.com/merchant_detail/shope");
    var header = {
    'Client-Service': 'digistore',
    'Auth-Key': '12022022'
    };
    try{
    var jsonData = await http.get(
        path,
      );
    var jsonResult = jsonDecode(jsonData.body);
    var descodedData = jsonResult['data'];
    var allItemsList = RestaurentModel.fromJSON(descodedData);
    restaurentDetails = allItemsList;
    // isLoading = false;
    update();
    }catch(error){
      
    }
  }

  updateDeliveryType(val){
    deliveryType = val;
    update();
  }

  updateCouponText(data){
    couponControllerText = data;
    update();
  }


}