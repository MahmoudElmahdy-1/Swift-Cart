// ignore: unused_import
import 'dart:developer';
import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/class/crud.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addCart(String usersid, int itemsid) async {
    var response = await crud
        .postData(ApiLinks.cartAdd, {"usersid": usersid, "itemsid": itemsid});
    // log("From CartData Add $response");
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String usersid, int itemsid) async {
    var response = await crud.postData(
        ApiLinks.cartRemove, {"usersid": usersid, "itemsid": itemsid});
    // log("From CartData Remove $response");
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, int itemsid) async {
    var response = await crud.postData(
        ApiLinks.cartGetCount, {"usersid": usersid, "itemsid": itemsid});
    // log("From CartData Remove $response");
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(ApiLinks.cartView, {"usersid": usersid});
    // log("From CartData viewCart $response");
    return response.fold((l) => l, (r) => r);
  }

  deleteItem(String usersid, int itemsid) async {
    var response = await crud.postData(
        ApiLinks.deleteItem, {"usersid": usersid, "itemsid": itemsid});

    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response =
        await crud.postData(ApiLinks.checkCoupon, {"couponname": couponname});

    return response.fold((l) => l, (r) => r);
  }
}
