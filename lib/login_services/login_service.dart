import 'dart:convert';
import 'package:http/http.dart' as http;

class LogInService {

  Future signup(
  {required String name, required String phone}) async {
    var path = Uri.parse("https://myvyavsay.com/userapi/user_signup");
    var header = {
    'Client-Service': 'digistore',
    'Auth-Key': '12022022'
    };
    var jsonData = await http.post(
        path,
        headers: header,
        body: {
          "name": name,
          "mobile_number": phone,
          "refferal_code": "b5VZ7A"
        },
      );
     var jsonResult = jsonDecode(jsonData.body);
    if (jsonData.statusCode == 200) {
       return jsonResult;
    }else{
      return "";
    }
  }

  Future confirm(
      {required String phone, required String otp, required String userType}) async {
    var path = Uri.parse("https://myvyavsay.com/userapi/user_signup_otpverify");
    var header = {
    'Client-Service': 'digistore',
    'Auth-Key': '12022022'
    };
    var jsonData = await http.post(
        path,
        headers: header,
        body: {
          "mobile_number": phone,
          "otp": otp,
          "user_type": userType
        },
      );
     var jsonResult = jsonDecode(jsonData.body);
    if (jsonData.statusCode == 200) {
      return jsonResult;
    }else{
      return "";
    }
  }

}