import 'dart:io';
import 'package:ecommerceapp/controller/homescreenwithnavbar_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/shared/animated_confirm_dialog.dart';
import 'package:ecommerceapp/view/widget/customnavigationbar_wd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreenWithNavBar extends StatelessWidget {
  const HomeScreenWithNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenWithNavBarControllerImp>(
        builder: (homeScreenWithNavBarControllerImp) => PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                showCustomDialog(
                  context: context,
                  title: '49'.tr,
                  message: '50'.tr,
                  cancelButtonText: '51'.tr,
                  confirmButtonText: '52'.tr,
                  cancelButtonColor: MyColors.darkRedColor,
                  cancelButtonTextColor: MyColors.whiteColor,
                  confirmButtonColor: MyColors.greenColor,
                  confirmButtonTextColor: MyColors.whiteColor,
                  onCancel: () {
                    Get.back();
                  },
                  onConfirm: () {
                    exit(0);
                  },
                  isFlip: true,
                );
              },
              child: Scaffold(
                backgroundColor: MyColors.whiteColor,
                bottomNavigationBar: CustomNavigationBar(
                    items: [
                      CurvedNavigationBarItem(
                          icon: Icon(MdiIcons.saleOutline, size: 28),
                          label: "79".tr),
                      CurvedNavigationBarItem(
                          icon: Icon(MdiIcons.shapePlusOutline, size: 28),
                          label: "80".tr),
                      CurvedNavigationBarItem(
                          icon: const Icon(CupertinoIcons.home, size: 26),
                          label: "81".tr),
                      CurvedNavigationBarItem(
                          icon: const Icon(Icons.favorite_border, size: 28),
                          // icon: Icon(EvaIcons.heartOutline, size: 30),
                          label: "82".tr),
                      CurvedNavigationBarItem(
                          icon: const Icon(CupertinoIcons.person, size: 28),
                          // icon: Icon(EvaIcons.personOutline, size: 30),
                          label: "83".tr),
                    ],
                    index: homeScreenWithNavBarControllerImp.currentIndex,
                    onTap: (index) {
                      homeScreenWithNavBarControllerImp.changePage(index);
                    }),
                body: homeScreenWithNavBarControllerImp
                    .pages[homeScreenWithNavBarControllerImp.currentIndex],
              ),
            ));
  }
}
