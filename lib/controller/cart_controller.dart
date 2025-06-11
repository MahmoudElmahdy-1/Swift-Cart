// ignore: unused_import
import 'dart:developer';
import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/mypages.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/core/shared/customsnackbar_fu.dart';
import 'package:ecommerceapp/core/shared/customsnackbarwithicon_fu.dart';
import 'package:ecommerceapp/data/datasource/remote/cart_data.dart';
import 'package:ecommerceapp/data/model/cart_model.dart';
import 'package:ecommerceapp/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find<Crud>());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  TextEditingController? couponController;
  CouponModel? couponModel;

  int? couponPercentage = 0;
  String? couponName;
  int? couponId;

  List<CartModel> data = [];
  double orderPrice = 0.0;
  int totlaItemsCount = 0;

  addCart(int itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    // log("From CartController Add $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // addCartSnackBar();
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  removeCart(int itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    // log("From CartController Remove $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // removeCartSnackBar();
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  deleteItem(int itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteItem(
        myServices.sharedPreferences.getString("id")!, itemsid);
    // log("From CartController Remove $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // removeCartSnackBar();
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  resetCartVariabls() {
    orderPrice = 0.0;
    totlaItemsCount = 0;
    data.clear();
  }

  refreshPage() {
    resetCartVariabls();
    viewCart();
  }

  viewCart() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    // log("From CartController viewCart $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == "success") {
          List responsedata = response['datacart']['data'];
          Map responsedataTotalCountAndPrice =
              response['datatotalcountandprice'];
          data.clear();
          data.addAll(
              responsedata.map((element) => CartModel.fromJson(element)));
          orderPrice = double.parse(
              responsedataTotalCountAndPrice['totalprice'].toString());
          totlaItemsCount = int.parse(
              responsedataTotalCountAndPrice['totalitems'].toString());

          log("orderPrice: $orderPrice");
          log("itemsCount: $totlaItemsCount");
        }
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(couponController!.text);
    // log("From CartController viewCart $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Map<String, dynamic> responsedata = response['data'];
        couponModel = CouponModel.fromJson(responsedata);
        couponPercentage = couponModel!.couponPercentage;
        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId;
        customSnackBar('118'.tr, 17, 17, '119'.tr, 16, 16, null,
            MyColors.greenColor, MyColors.whiteColor, MyColors.whiteColor);
      } else {
        couponPercentage = 0;
        couponName = null;
        couponId = null;
        customSnackBarWithIcon(
            '119.1'.tr, 17, 17, '119.2'.tr, 16, 16, null, MyColors.redColor);
      }
    }
    update();
  }

  getTotalPriceAfterDiscount() {
    return (orderPrice - orderPrice * couponPercentage! / 100);
  }

  goToCheckout() {
    if (data.isEmpty) {
      return customSnackBarWithIcon(
          '123'.tr, 19, 19, '124'.tr, 16, 16, null, MyColors.redColor);
    }
    Get.toNamed(MyPages.checkout, arguments: {
      "couponid": couponId ?? 0,
      "orderprice": orderPrice,
      "couponpercentage": couponPercentage.toString(),
    });
  }

  @override
  void onInit() {
    couponController = TextEditingController();
    viewCart();
    super.onInit();
  }
}
