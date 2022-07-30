class RestaurentModel{

  String? restaurentName;
  String? restaurentArea;
  String? restaurentDistrict;
  String? restaurentState;
  String? restaurentPincode;
  var id;
  var couponCode;
  var couponAt;
  var couponDisct;
  var couponDiscntType;
  var delivery_status;
  var bannerImg;
  var couponMinAmt;
  var deliverCharge;
  var freeDeliverAbove;
  var discountType;

  RestaurentModel({this.restaurentName, this.restaurentArea, this.restaurentDistrict, this.restaurentState, this.restaurentPincode, this.id, this.couponCode, this.couponAt, this.couponDisct, this.couponDiscntType, this.delivery_status, this.bannerImg, this.couponMinAmt, this.deliverCharge, this.freeDeliverAbove, this.discountType});

  factory RestaurentModel.fromJSON(Map map){
    return RestaurentModel(restaurentName: map['business_name'] != null ? map['business_name'] : "NA", restaurentArea: map['store_address'] != null ? map['store_address'] : "NA", restaurentDistrict: map['district'] != null ? map['district'] : "NA", restaurentState: map['State'] != null ? map['State'] : "NA", restaurentPincode: map['pincode'] != null ? map['pincode'] : "NA", id: map['id'] != null ? map['id'] : "", couponCode: map['coupon_code'] != null ? map['coupon_code'] : "", couponAt: map['coupon_minmum_amt'] != null ? map['coupon_minmum_amt'] : "", couponDisct: map['coupon_discount'] != null ? map['coupon_discount'] : "", couponDiscntType: map['discount_type'] != null ? map['discount_type'] : "", delivery_status: map['delivery_status'] != null ? map['delivery_status'] : "", bannerImg: map['banner_img'] != null ? List.from(map['banner_img'].toString().split(",").map((e) => e)) : [], couponMinAmt: map['coupon_minmum_amt'] != null ? map['coupon_minmum_amt'] : "NA", deliverCharge: map['deliveryCharges'] != null ? map['deliveryCharges'] : "NA", freeDeliverAbove: map['freeDeliverAbove'] != null ? map['freeDeliverAbove'] : "NA", discountType: map['discount_type'] != null ? map['discount_type'] : "NA");
  }

  getBannerImages(map){
    var bannerList = map['banner_img'].toString().split(",");
    List banners = [];
    for(var index = 0; index < bannerList.length; index++){
      banners.add(bannerList[index]);
    }
    return banners;
  }

}