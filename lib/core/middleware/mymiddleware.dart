import 'package:ecommerceapp/core/constant/mypages.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myservices = Get.find<MyServices>();

  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedPreferences.getString("step") == "loginFinished") {
      return RouteSettings(name: MyPages.homeScreenWithNavBar);
    }
    if (myservices.sharedPreferences.getString("step") ==
        "onBoardingFinished") {
      return RouteSettings(name: MyPages.login);
    }
    return null;
  }
}
