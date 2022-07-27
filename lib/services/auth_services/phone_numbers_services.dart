import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PhoneNumberServices {

  Future changeNumber(
      {required String phone}) async {
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userId = sharedPreferences.getString('userId');
        var path = Uri.parse("https://myvyavsay.com/userapi/change_number");
        var header = {
        'Client-Service': 'digistore',
        'Auth-Key': '12022022'
        };
        var response = await  http.post(
        path,
        headers: header,
        body: {
          'user_id': "$userId",
          "mobile_number": phone
        },
      );
    // var res = await NetworkHelper.post(
    //     service: 'Change number',
    //     url: Urls.changeNumber,
    //     body: {
    //       "user_id": Storage.getUser()!.id,
    //       "mobile_number": phone
    //     }, showResponse: true);
    if (response != null && response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
       return decodedData['user_id'].toString();
    }
    return null;
  }

  verifyNumberChange({required String phone, required String otp,}) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userId = sharedPreferences.getString('userId');
    var path = Uri.parse("https://myvyavsay.com/userapi/verify_number");
        var header = {
        'Client-Service': 'digistore',
        'Auth-Key': '12022022'
        };
        var response = await  http.post(
        path,
        headers: header,
        body: {
          'user_id': "$userId",
          "mobile_number": phone,
          "otp": otp
        },
      );
      if (response != null && response.statusCode == 200) {
      print(response.body);
    }
  }

}