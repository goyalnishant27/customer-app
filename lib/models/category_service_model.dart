class CategoryService {

  var id;
  var name;
  String? businessName;
  var mobileNumber;
  var otp;
  var businessCategory;
  var qrcode;
  var walletAmount;
  var subscriptionValidDate;
  var storeImage;
  var storeLink;
  var email;
  var storeAddress;
  var city;
  var pincode;
  var pancard;
  var refferalCode;
  var refferalBy;
  var status;
  var storeStatus;
  var deliveryStatus;
  var pickUpStatus;
  var paymentStatus;
  var lastLoginDate;
  var lastUpdateDate;
  var signUpDate;

  CategoryService({this.id, this.name, this.businessName, this.mobileNumber, this.otp, this.businessCategory, this.qrcode, this.walletAmount, this.subscriptionValidDate, this.storeImage, this.storeLink, this.email, this.storeAddress, this.city, this.pincode, this.pancard, this.refferalCode, this.refferalBy, this.storeStatus, this.deliveryStatus, this.pickUpStatus, this.paymentStatus, this.lastLoginDate, this.lastUpdateDate, this.signUpDate, this.status});

  factory CategoryService.fromJSON(Map map){
    return CategoryService(id: map['id'] != null ? map['id'] : "", name: map['name'] != null ? map['name'] : "", businessName: map['business_name'] != null ? map['business_name'] : "", mobileNumber: map['mobile_number'] != null ? map['mobile_number'] : "", otp: map['otp'] != null ? map['otp'] : "", businessCategory: map['business_category_id'] != null ? map['business_category_id'] : "", qrcode: map['qrcode'] != null ? map['qrcode'] : "", walletAmount: map['wallet_amount'] != null ? map['wallet_amount'] : "", subscriptionValidDate: map['subscriptionvalid_date'] != null ? map['subscriptionvalid_date'] : "", storeImage: map['store_image'] != null ? map['store_image'] : "", storeLink: map['store_link'] != null ? map['store_link']: "", email: map['email'] != null ? map['email'] : "", storeAddress: map['store_address'] != null ? map['store_address'] : "", city: map['city'] != null ? map['city'] : "", pincode: map['pincode'] != null ? map['pincode'] : "", pancard: map['pancard'] != null ? map['pancard'] : "", refferalCode: map['refferal_code'] != null ? map['refferal_code'] : "", refferalBy: map['refferal_by'], status: map['status'] != null ? map['status'] : "", storeStatus: map['store_status'] != null ? map['store_status'] : "", deliveryStatus: map['delivery_status'] != null ? map['delivery_status'] : "", pickUpStatus: map['pickup_status'] != null ? map['pickup_status'] : null, paymentStatus: map['payment_status'] != null ? map['payment_status'] : "", lastLoginDate: map['last_login_date'] != null ? map['last_login_date'] : "", lastUpdateDate: map['last_update_date'] != null ? map['last_update_date'] : "", signUpDate: map['signup_date'] != null ? map['signup_date'] : "");
  }

}