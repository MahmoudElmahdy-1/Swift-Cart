// ignore: unused_import
import 'dart:developer';
import 'package:ecommerceapp/controller/searchmix_controller.dart';
import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/data/datasource/remote/categories_data.dart';
import 'package:ecommerceapp/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesController extends SearchMixController {
  CategoriesData categoriesData = CategoriesData(Get.find<Crud>());
  List<CategoriesModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.viewCategories();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        // log("viewCategoriesContoller $response");
        List responseData = response['data'];
        data.addAll(responseData.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    getData();
    super.onInit();
  }
}
