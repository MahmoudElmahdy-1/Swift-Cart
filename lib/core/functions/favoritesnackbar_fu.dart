import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

addFavoriteSnackBar() {
  Get.snackbar(
    duration: const Duration(seconds: 2),
    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    icon: Icon(
      Icons.favorite,
      color: MyColors.whiteColor,
      size: 35,
    ),
    titleText: Text(
      '75'.tr,
      style: TextStyle(
          color: MyColors.whiteColor,
          fontSize: fontSize(20, 20),
          fontFamily:
              fontFamily(MyFonts.cairoSemiBold, MyFonts.montserratBold)),
    ),
    messageText: Text('76'.tr,
        style: TextStyle(
            color: MyColors.whiteColor,
            fontSize: fontSize(15, 15),
            fontFamily:
                fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium))),
    "",
    "",
    snackPosition: SnackPosition.TOP,
    backgroundColor: MyColors.primaryColor,
    colorText: Colors.white,
  );
}

removeFavoriteSnackBar() {
  Get.snackbar(
    duration: const Duration(seconds: 2),
    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    icon: Icon(
      Icons.heart_broken,
      color: MyColors.whiteColor,
      size: 35,
    ),
    titleText: Text(
      '77'.tr,
      style: TextStyle(
          color: MyColors.whiteColor,
          fontSize: fontSize(20, 20),
          fontFamily:
              fontFamily(MyFonts.cairoSemiBold, MyFonts.montserratBold)),
    ),
    messageText: Text('78'.tr,
        style: TextStyle(
            color: MyColors.whiteColor,
            fontSize: fontSize(15, 15),
            fontFamily:
                fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium))),
    "",
    "",
    snackPosition: SnackPosition.TOP,
    backgroundColor: MyColors.primaryColor,
    colorText: Colors.white,
  );
}
