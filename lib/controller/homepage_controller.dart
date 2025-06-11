import 'package:ecommerceapp/controller/searchmix_controller.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mypages.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageController extends SearchMixController {
  initialData();
  getData();
  goToItemsPage(List categories, int selectedCategory, String categoryid);
}

class HomePageControllerImp extends HomePageController {
  MyServices myservices = Get.find();
  List categories = [];
  List topSellingItems = [];
  List itemsdiscount = [];
  String? username;

  @override
  void onInit() {
    searchController = TextEditingController();
    initialData();
    getData();
    super.onInit();
  }

  @override
  initialData() {
    username = myservices.sharedPreferences.getString("username");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homePageData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']['data']);
        topSellingItems.addAll(response['items']['data']);
        itemsdiscount.addAll(response['itemsdiscount']['data']);
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  @override
  goToItemsPage(categories, selectedCategory, categoryid) {
    Get.toNamed(MyPages.itemsPage, arguments: {
      "categories": categories,
      "selectedcategory": selectedCategory,
      "categoryid": categoryid
    });
  }

  goToItemDetails(itemsModel) {
    Get.toNamed(MyPages.itemsDetails, arguments: {"itemsModel": itemsModel});
  }
}
