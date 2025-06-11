import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackBarWithIcon(
  String title,
  double titleArSize,
  double titleEnSize,
  String message,
  double messageArSize,
  double messageEnSize,
  SnackPosition? position,
  Color? backgroundColor,
) {
  Get.snackbar(
    margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    icon: Icon(
      Icons.warning_rounded,
      color: MyColors.whiteColor,
      size: 35,
    ),
    titleText: Text(
      title,
      style: TextStyle(
          color: MyColors.whiteColor,
          fontSize: fontSize(titleArSize, titleEnSize),
          fontFamily:
              fontFamily(MyFonts.cairoSemiBold, MyFonts.montserratBold)),
    ),
    messageText: Text(message,
        style: TextStyle(
            color: MyColors.whiteColor,
            fontSize: fontSize(messageArSize, messageEnSize),
            fontFamily:
                fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium))),
    "",
    "",
    snackPosition: position,
    backgroundColor: backgroundColor,
    colorText: Colors.white,
  );
}
