class ItemsModel {
  int? itemsId;
  String? itemsNameEn;
  String? itemsNameAr;
  String? itemsDescriptionEn;
  String? itemsDescriptionAr;
  String? itemsImage;
  int? itemsQuantity;
  int? itemsActive;
  String? itemsPrice;
  String? priceafterdiscount;
  int? itemsDiscount;
  String? itemsDatetime;
  int? itemsCategories;
  int? categoriesId;
  String? categoriesNameEn;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  int? favorite;

  ItemsModel({
    this.itemsId,
    this.itemsNameEn,
    this.itemsNameAr,
    this.itemsDescriptionEn,
    this.itemsDescriptionAr,
    this.itemsImage,
    this.itemsQuantity,
    this.itemsActive,
    this.itemsPrice,
    this.priceafterdiscount,
    this.itemsDiscount,
    this.itemsDatetime,
    this.itemsCategories,
    this.categoriesId,
    this.categoriesNameEn,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesDatetime,
    this.favorite,
  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsNameEn = json['items_name_en'];
    itemsNameAr = json['items_name_ar'];
    itemsDescriptionEn = json['items_description_en'];
    itemsDescriptionAr = json['items_description_ar'];
    itemsImage = json['items_image'];
    itemsQuantity = json['items_quantity'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price']?.toString();
    priceafterdiscount = json['priceafterdiscount']?.toString();
    itemsDiscount = json['items_discount'];
    itemsDatetime = json['items_datetime'];
    itemsCategories = json['items_categories'];
    categoriesId = json['categories_id'];
    categoriesNameEn = json['categories_name_en'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['categories_id'] = this.categoriesId;
    data['categories_name_en'] = this.categoriesNameEn;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    data['favorite'] = this.favorite;
    data['priceafterdiscount'] = this.priceafterdiscount;
    return data;
  }
}
