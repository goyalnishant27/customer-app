
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../models/check_order_summary_model.dart';

class CheckOrderSummaryController extends GetxController {

  var ordeDetails;

  getOrderDetails(userId, orderId) async {
     var path = Uri.parse("https://myvyavsay.com/userapi/userorder_detail");
    var header = {
    'Client-Service': 'digistore',
    'Auth-Key': '12022022'
    };
    var jsonData = await http.post(
        path,
        headers: header,
        body: {
          'user_id': userId,
          'order_id': "$orderId"
        },
      );
    var jsonResult = jsonDecode(jsonData.body);
    var descodedData = jsonResult['data'];
    var allItemsList = CheckOrderSummaryModel.fromJSON(descodedData);
    ordeDetails = allItemsList;
    update();
  }

}