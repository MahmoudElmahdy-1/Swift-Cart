import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/data/datasource/remote/homepage_data.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchMixController extends GetxController {
  TextEditingController? searchController;
  bool isSearchActive = false;
  late StatusRequest statusRequest;
  HomePageData homePageData = HomePageData(Get.find<Crud>());
  List<ItemsModel> listItemsInSearch = [];

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homePageData.searchData(searchController!.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        listItemsInSearch.clear();
        List responsedata = [];
        responsedata = response['data'];
        listItemsInSearch.addAll(
            responsedata.map((element) => ItemsModel.fromJson(element)));
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  checkSearch(val) {
    if (val == "") {
      isSearchActive = false;
      statusRequest = StatusRequest.none;
    } else {
      // isSearchActive = true; // if you want the search to work when you start typing
      // searchData(); // if you want the search to work when you start typing
    }
    update();
  }

  // === if i want to search when i press the search icon - put this function in the icon onPressed function === //
  onSearchPress() {
    isSearchActive = true;
    searchData();
    update();
  }
}
