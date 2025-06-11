import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/static/static.dart';
import 'package:ecommerceapp/view/screen/auth/login_sc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  nextPage();
  onSliderChange(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;

  MyServices myservices = Get.find<MyServices>();

  @override
  nextPage() {
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
      myservices.sharedPreferences.setString("step", "onBoardingFinished");
      Get.offAll(() => const LogIn(), transition: Transition.upToDown);
    } else {
      pageController.animateToPage(currentPage,
          duration: (const Duration(milliseconds: 500)), curve: Curves.easeInOut);
    }
  }

  @override
  onSliderChange(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
