class FavoritesModel {
  int? favoriteId;
  int? favoriteUsersid;
  int? favoriteItemsid;
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
  int? usersId;
  String? priceAfterDiscount;

  FavoritesModel({
    this.favoriteId,
    this.favoriteUsersid,
    this.favoriteItemsid,
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
    this.itemsCategories,
    this.usersId,
    this.priceAfterDiscount,
  });

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteItemsid = json['favorite_itemsid'];
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
    usersId = json['users_id'];
    priceAfterDiscount = json['priceafterdiscount']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['favorite_itemsid'] = this.favoriteItemsid;
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
    data['users_id'] = this.usersId;
    data['priceafterdiscount'] = this.priceAfterDiscount;
    return data;
  }
}
