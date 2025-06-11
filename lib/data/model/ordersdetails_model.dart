class OrdersDetailsModel {
  String? allitemsprice;
  String? allitemscount;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? cartOrders;
  int? itemsId;
  String? itemsNameEn;
  String? itemsNameAr;
  String? itemsDescriptionEn;
  String? itemsDescriptionAr;
  String? itemsImage;
  int? itemsQuantity;
  int? itemsActive;
  String? itemsPrice;
  int? itemsDiscount;
  String? itemsDatetime;
  int? itemsCategories;

  OrdersDetailsModel(
      {this.allitemsprice,
      this.allitemscount,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid,
      this.cartOrders,
      this.itemsId,
      this.itemsNameEn,
      this.itemsNameAr,
      this.itemsDescriptionEn,
      this.itemsDescriptionAr,
      this.itemsImage,
      this.itemsQuantity,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDatetime,
      this.itemsCategories});

  OrdersDetailsModel.fromJson(Map<String, dynamic> json) {
    allitemsprice = json['allitemsprice']?.toString();
    allitemscount = json['allitemscount']?.toString();
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    cartOrders = json['cart_orders'];
    itemsId = json['items_id'];
    itemsNameEn = json['items_name_en'];
    itemsNameAr = json['items_name_ar'];
    itemsDescriptionEn = json['items_description_en'];
    itemsDescriptionAr = json['items_description_ar'];
    itemsImage = json['items_image'];
    itemsQuantity = json['items_quantity'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price']?.toString();
    itemsDiscount = json['items_discount'];
    itemsDatetime = json['items_datetime'];
    itemsCategories = json['items_categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allitemsprice'] = this.allitemsprice;
    data['allitemscount'] = this.allitemscount;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['cart_orders'] = this.cartOrders;
    data['items_id'] = this.itemsId;
    data['items_name_en'] = this.itemsNameEn;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_description_en'] = this.itemsDescriptionEn;
    data['items_description_ar'] = this.itemsDescriptionAr;
    data['items_image'] = this.itemsImage;
    data['items_quantity'] = this.itemsQuantity;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_datetime'] = this.itemsDatetime;
    data['items_categories'] = this.itemsCategories;
    return data;
  }
}
