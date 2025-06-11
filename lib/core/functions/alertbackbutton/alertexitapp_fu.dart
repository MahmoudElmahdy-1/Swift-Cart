import 'dart:io';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExitApp() {
  return AlertDialog(
    title: Text('49'.tr),
    content: Text('50'.tr),
    titleTextStyle: TextStyle(
      color: MyColors.primaryColor,
      fontSize: fontSize(22, 22),
      fontFamily: fontFamily(MyFonts.cairoSemiBold, MyFonts.montserratBold),
    ),
    contentTextStyle: TextStyle(
      color: MyColors.bodyColor,
      fontSize: fontSize(16, 15),
      fontFamily: fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
    ),
    actions: [
      TextButton(
        child: Text('51'.tr,
            style: TextStyle(
              color: MyColors.primaryColor,
              fontSize: fontSize(17, 15),
              fontFamily:
                  fontFamily(MyFonts.cairoSemiBold, MyFonts.montserratMedium),
              fontWeight: FontWeight.bold,
            )),
        onPressed: () {
          Get.back();
        },
      ),
      TextButton(
        child: Text('52'.tr,
            style: TextStyle(
              color: MyColors.primaryColor,
              fontSize: fontSize(17, 15),
              fontFamily:
                  fontFamily(MyFonts.cairoSemiBold, MyFonts.montserratMedium),
              fontWeight: FontWeight.bold,
            )),
        onPressed: () {
          exit(0);
        },
      ),
    ],
  );
}
