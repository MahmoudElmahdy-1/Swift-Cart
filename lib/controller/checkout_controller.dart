import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/core/shared/customsnackbarwithicon_fu.dart';
import 'package:ecommerceapp/core/shared/smilefacesnackbar_fu.dart';
import 'package:ecommerceapp/data/datasource/remote/address_data.dart';
import 'package:ecommerceapp/data/datasource/remote/checkout_data.dart';
import 'package:ecommerceapp/data/model/address_model.dart';
import 'package:ecommerceapp/view/screen/homescreenwithnavbar_sc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find<Crud>());
  CheckoutData checkoutData = CheckoutData(Get.find<Crud>());
  MyServices myServices = Get.find();
  List<AddressModel> listAddressData = [];

  String? paymentMethod;
  String? deliveryType;
  int addressId = 0;
  late int couponId;
  late double orderPrice;
  late String couponPercentage;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseAddress(int val) {
    addressId = val;
    update();
  }

  getAddressBook() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.viewAddress(
      myServices.sharedPreferences.getString("id")!,
    );
    // log("responseFromViewAddressController : $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        listAddressData
            .addAll(responsedata.map((e) => AddressModel.fromJson(e)));
        // addressId = listAddressData[0].addressId!; // to make the first addres as default
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkout(BuildContext context) async {
    if (paymentMethod == null) {
      return customSnackBarWithIcon(
          '128'.tr, 19, 19, '129'.tr, 16, 16, null, MyColors.redColor);
    }
    if (deliveryType == null) {
      return customSnackBarWithIcon(
          '130'.tr, 19, 19, '131'.tr, 16, 16, null, MyColors.redColor);
    }
    if (deliveryType == "0" && addressId == 0) {
      return customSnackBarWithIcon(
          '132'.tr, 19, 19, '133'.tr, 16, 16, null, MyColors.redColor);
    }

    statusRequest = StatusRequest.loading;
    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id")!,
      "addressid": addressId,
      "deliverytype": deliveryType.toString(),
      "deliveryprice": '10',
      "ordersprice": orderPrice,
      "couponid": couponId,
      "couponpercentage": couponPercentage.toString(),
      "paymentmethod": paymentMethod.toString(),
    };

    var response = await checkoutData.checkout(data);
    // log("responseFromViewAddressController : $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAll(() => const HomeScreenWithNavBar(),
            transition: Transition.upToDown);
        // ignore: use_build_context_synchronously
        smileFaceSnackBar(context, '125'.tr);
      } else {
        statusRequest = StatusRequest.none;
        customSnackBarWithIcon(
            '126'.tr, 19, 19, '127'.tr, 16, 16, null, MyColors.redColor);
      }
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponid'];
    orderPrice = Get.arguments['orderprice'];
    couponPercentage = Get.arguments['couponpercentage'].toString();
    getAddressBook();
    super.onInit();
  }
}
