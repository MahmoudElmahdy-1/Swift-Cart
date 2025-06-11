import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackBar(
  String title,
  double titleArSize,
  double titleEnSize,
  String message,
  double messageArSize,
  double messageEnSize,
  SnackPosition? position,
  Color? backgroundColor,
  Color? titleColor,
  Color? messageColor,
) {
  Get.snackbar(
    margin: const EdgeInsets.all(15),
    // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    titleText: Text(
      title,
      style: TextStyle(
        color: titleColor,
        fontSize: fontSize(titleArSize, titleEnSize),
        fontFamily: fontFamily(MyFonts.cairoSemiBold, MyFonts.montserratBold),
      ),
    ),
    messageText: Text(
      message,
      style: TextStyle(
        color: messageColor,
        fontSize: fontSize(messageArSize, messageEnSize),
        fontFamily: fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
      ),
    ),
    "",
    "",
    snackPosition: position,
    backgroundColor: backgroundColor,
  );
}
