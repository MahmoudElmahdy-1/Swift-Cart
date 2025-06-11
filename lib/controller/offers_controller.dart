// ignore: unused_import
import 'dart:developer';
import 'package:ecommerceapp/controller/searchmix_controller.dart';
import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mypages.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/offers_data.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find<Crud>());

  final FavoriteService favoriteService = Get.find();

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getItems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await offersData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    // log("responseFromItemsController : $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data = responsedata.map((e) => ItemsModel.fromJson(e)).toList(); 
        final favoriteStatus = {
          for (var item in data) 
            item.itemsId!: item.favorite == 1
        };
        favoriteService.initializeFavorites(favoriteStatus);
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  goToItemDetails(itemsModel) {
    Get.toNamed(MyPages.itemsDetails, arguments: {"itemsModel": itemsModel});
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    getItems();
    super.onInit();
  }
}
