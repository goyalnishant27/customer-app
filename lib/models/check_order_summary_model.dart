class CheckOrderSummaryModel {

  var id;
  var orderedId;
  var discount_amount;
  var delivery_charge;
  var total_product_amount;
  var total_amount;
  var total_paid_amount;
  var paid;
  var no_of_item;
  var name;
  var mobile_number;
  var address;
  var city;
  var state;
  var pincode;
  var lat;
  var long;
  var expected_delivery_time;
  var order_datetime;
  var insertdatetime;
  var updatetime;
  List? item;
  var status;
  var deliveryType;

  CheckOrderSummaryModel({this.id, this.discount_amount, this.delivery_charge, this.total_product_amount, this.total_amount, this.paid, this.total_paid_amount, this.no_of_item, this.address, this.mobile_number, this.name, this.city, this.state, this.pincode, this.lat, this.long, this.expected_delivery_time, this.order_datetime, this.insertdatetime, this.updatetime, this.item, this.orderedId, this.status, this.deliveryType});

  factory CheckOrderSummaryModel.fromJSON(Map map){
    return CheckOrderSummaryModel(id: map['id'], discount_amount: map['discount_amount'], delivery_charge: map['delivery_charge'], total_product_amount: map['total_product_amount'], total_amount: map['total_amount'], paid: map['paid'], total_paid_amount: map['total_paid_amount'], no_of_item: map['no_of_item'], address: map['address'], mobile_number: map['mobile_number'], name: map['name'], city: map['city'], state: map['state'], pincode: map['pincode'], lat: map['lat'], long: map['long'], expected_delivery_time: map['expected_delivery_time'], order_datetime: map['order_datetime'], insertdatetime: map['insertdatetime'], updatetime: map['updatetime'], item: map['item'], orderedId: map['order_id'] != null ? map['order_id'] : "NA", status: map['status'], deliveryType: map['delivery_type']);
  }
  
}