// ignore: unused_import
import 'dart:developer';
import 'package:ecommerceapp/controller/searchmix_controller.dart';
import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mypages.dart';
import 'package:ecommerceapp/core/functions/favoritesnackbar_fu.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/favorite_data.dart';
import 'package:ecommerceapp/data/model/favorites_model.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends SearchMixController {
   final FavoriteService favoriteService = Get.find();
  Map isFavorite = {};
  List<FavoritesModel> data = [];
  late StatusRequest statusRequest;
  FavoriteData favoriteData = FavoriteData(Get.find<Crud>());
  MyServices myServices = Get.find();

  changeFavorite(id, value) {
    isFavorite[id] = value;
    update();
  }

  // addFavorite(int itemsid) {
  //   data.clear();
  //   favoriteData.addFavorite(
  //       myServices.sharedPreferences.getString("id")!, itemsid);
  //   addFavoriteSnackBar();
  // }

  // removeFavorite(int itemsid) {
  //   data.clear();
  //   favoriteData.removeFavorite(
  //       myServices.sharedPreferences.getString("id")!, itemsid);
  //   removeFavoriteSnackBar();
  // }

  addFavorite(int itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    log("From favoriteController $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
       favoriteService.toggleFavorite(itemsid); // Sync with service
        addFavoriteSnackBar();
        getItems(); // Refresh favorites list
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
  }

  removeFavorite(int itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    log("From favoriteController$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        favoriteService.toggleFavorite(itemsid); // Sync with service
        removeFavoriteSnackBar();
        getItems(); // Refresh favorites list
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
  }

  getItems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.getitems(
      myServices.sharedPreferences.getString("id")!,
    );
    // log("responseFromItemsController : $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(
            responsedata.map((element) => FavoritesModel.fromJson(element)));
              final favoriteStatus = {
          for (var item in data) 
            item.itemsId!: true
        };
        favoriteService.initializeFavorites(favoriteStatus);
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  removeFromFavritePage(int favoriteid) {
    // ignore: unused_local_variable
    var response = favoriteData.removeFromFavritePage(favoriteid);
    // log("From removeFromFavritePage $response");
    data.removeWhere((element) => element.favoriteId == favoriteid);
    update();
  }

  void goToItemDetails(FavoritesModel fav) {
    ItemsModel itemsModel = ItemsModel(
      itemsId: fav.itemsId,
      itemsNameEn: fav.itemsNameEn,
      itemsNameAr: fav.itemsNameAr,
      itemsDescriptionEn: fav.itemsDescriptionEn,
      itemsDescriptionAr: fav.itemsDescriptionAr,
      itemsImage: fav.itemsImage,
      itemsPrice: fav.itemsPrice,
      itemsDiscount: fav.itemsDiscount,
      itemsCategories: fav.itemsCategories,
      priceafterdiscount: fav.priceAfterDiscount,
    );
    Get.toNamed(MyPages.itemsDetails, arguments: {"itemsModel": itemsModel});
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    getItems();
    super.onInit();
  }
}
