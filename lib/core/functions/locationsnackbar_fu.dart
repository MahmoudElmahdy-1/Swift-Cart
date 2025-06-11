import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

locationPermissionSnackBar(String message) {
  Get.snackbar(
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    icon: Icon(
      Icons.info,
      color: MyColors.whiteColor,
      size: 35,
    ),
    titleText: Text(
      '100'.tr,
      style: TextStyle(
          color: MyColors.whiteColor,
          fontSize: fontSize(20, 20),
          fontFamily:
              fontFamily(MyFonts.cairoSemiBold, MyFonts.montserratBold)),
    ),
    messageText: Text(message,
        style: TextStyle(
            color: MyColors.whiteColor,
            fontSize: fontSize(15, 15),
            fontFamily:
                fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium))),
    "",
    "",
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: MyColors.primaryColor,
    colorText: Colors.white,
  );
}
