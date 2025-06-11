class CouponModel {
  int? couponId;
  String? couponName;
  int? couponPercentage;
  int? couponCount;
  String? couponExpirydate;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponPercentage,
      this.couponCount,
      this.couponExpirydate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponPercentage = json['coupon_percentage'];
    couponCount = json['coupon_count'];
    couponExpirydate = json['coupon_expirydate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_name'] = this.couponName;
    data['coupon_percentage'] = this.couponPercentage;
    data['coupon_count'] = this.couponCount;
    data['coupon_expirydate'] = this.couponExpirydate;
    return data;
  }
}