// ignore: unused_import
import 'dart:developer';
import 'package:ecommerceapp/controller/searchmix_controller.dart';
import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mypages.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/items_data.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SearchMixController {
  initialData();
  changeCategory(int index, String categoryindex);
  getItems(String categoryid);
  goToItemDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCategory;
  List<ItemsModel> data = [];
  String? categoryid;
  late StatusRequest statusRequest;
  ItemsData itemsData = ItemsData(Get.find<Crud>());
  MyServices myServices = Get.find();

  @override
  void onInit() {
    searchController = TextEditingController();
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCategory = Get.arguments['selectedcategory'];
    categoryid = Get.arguments['categoryid'];
    getItems(categoryid!);
  }

  @override
  changeCategory(index, categoryindex) {
    selectedCategory = index;
    categoryid = categoryindex;
    getItems(categoryid!);
    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
      categoryid,
      myServices.sharedPreferences.getString("id")!,
    );
    // log("responseFromItemsController : $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  @override
  goToItemDetails(itemsModel) {
    Get.toNamed(MyPages.itemsDetails, arguments: {"itemsModel": itemsModel});
  }
}
