class OrdersModel {
  int? ordersId;
  int? ordersUsersid;
  int? ordersDeliverytype;
  int? ordersAddress;
  int? ordersDeliveryprice;
  String? ordersPrice;
  String? ordersTotalprice;
  int? ordersCoupon;
  int? ordersPaymentmethod;
  int? ordersStatus;
  int? ordersRating;
  String? ordersCommentrating;
  String? ordersDatetime;
  int? addressId;
  int? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressBuilding;
  double? addressLatitude;
  double? addressLongitude;
  String? couponName;
  int? couponPercentage;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersDeliverytype,
      this.ordersAddress,
      this.ordersDeliveryprice,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.ordersRating,
      this.ordersCommentrating,
      this.ordersDatetime,
      this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressBuilding,
      this.addressLatitude,
      this.addressLongitude,
      this.couponName,
      this.couponPercentage});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersDeliverytype = json['orders_deliverytype'];
    ordersAddress = json['orders_address'];
    ordersDeliveryprice = json['orders_deliveryprice'];
    ordersPrice = json['orders_price']?.toString();
    ordersTotalprice = json['orders_totalprice']?.toString();
    ordersCoupon = json['orders_coupon'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersRating = json['orders_rating'];
    ordersCommentrating = json['orders_commentrating'];
    ordersDatetime = json['orders_datetime'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressBuilding = json['address_building'];
    addressLatitude = json['address_latitude'];
    addressLongitude = json['address_longitude'];
    couponName = json['coupon_name'];
    couponPercentage = json['coupon_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_deliverytype'] = this.ordersDeliverytype;
    data['orders_address'] = this.ordersAddress;
    data['orders_deliveryprice'] = this.ordersDeliveryprice;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_status'] = this.ordersStatus;
    data['orders_rating'] = this.ordersRating;
    data['orders_commentrating'] = this.ordersCommentrating;
    data['orders_datetime'] = this.ordersDatetime;
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_building'] = this.addressBuilding;
    data['address_latitude'] = this.addressLatitude;
    data['address_longitude'] = this.addressLongitude;
    data['coupon_name'] = this.couponName;
    data['coupon_percentage'] = this.couponPercentage;
    return data;
  }
}
