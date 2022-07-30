import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserAddressController extends GetxController {

  var userAddress = {};

  @override
  void onInit() {
    super.onInit();
    getUserAddress();
  }

  addUserAddress(street, area, city, pincode, state, userId) async {
    var path = Uri.parse("https://myvyavsay.com/userapi/add_address");
    var header = {
    'Client-Service': 'digistore',
    'Auth-Key': '12022022'
    };
    var jsonData = await http.post(
        path,
        headers: header,
        body: {
          'user_id': userId,
          'address1': street,
          'address2': area,
          'city': city,
          'pincode': pincode,
          'state': "Talangana",
        },
      );
    var jsonResult = jsonDecode(jsonData.body);
  }

  getUserAddress() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var areaName = sharedPreferences.getString("areaName");
    var districtName = sharedPreferences.getString("districtName");
    var stateName = sharedPreferences.getString("stateName");
    var pincode = sharedPreferences.getString("pincode");
    userAddress = {
      'area': areaName,
      'district': districtName,
      'state': stateName,
      'pincode': pincode
    };
    update();
  }

}