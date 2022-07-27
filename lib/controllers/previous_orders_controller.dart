import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/check_order_summary_model.dart';

class PreviousOrdersController extends GetxController {

  var previousOrders = <CheckOrderSummaryModel>[];

  getPreviousOrders(userId) async {
    var listdecodedData = [];
    var path = Uri.parse("https://myvyavsay.com/userapi/user_orderlist");
    var header = {
    'Client-Service': 'digistore',
    'Auth-Key': '12022022'
    };
    var jsonData = await http.post(
        path,
        headers: header,
        body: {
          'user_id': userId,
          'type': "1"
        },
      );
    var jsonResult = jsonDecode(jsonData.body);
    var decodedData = jsonResult['data'];
    listdecodedData.addAll(decodedData);
    var orders = listdecodedData.map((e) => CheckOrderSummaryModel.fromJSON(e)).toList();
    previousOrders = orders;
    update();
  }

}