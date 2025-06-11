import 'dart:developer';
import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/cart_data.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsdetailsController extends GetxController {
  initialData();
}

class ItemsdetailsControllerImp extends ItemsdetailsController {
  CartData cartData = CartData(Get.find<Crud>());

  late ItemsModel itemsModel;
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  int countItems = 0;
  String? lang;

  List items = [
    {"name": "red", "id": "1", "active": "0"},
    {"name": "yellow", "id": "2", "active": "1"},
    {"name": "green", "id": "3", "active": "0"},
  ];

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    lang = myServices.sharedPreferences.getString('lang');
    itemsModel = Get.arguments['itemsModel'];
    countItems = await getCountCart(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

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

  getCountCart(int itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    // log("From CartController Remove $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        int? countItems = 0;
        countItems = response['data'];
        log("countItems: $countItems");
        return countItems;
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
  }

  add() {
    addCart(itemsModel.itemsId!);
    countItems++;
    update();
  }

  remove() {
    if (countItems > 0) {
      removeCart(itemsModel.itemsId!);
      countItems--;
      update();
    }
  }
}
