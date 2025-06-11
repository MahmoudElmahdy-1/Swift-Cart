import 'dart:developer';

import 'package:ecommerceapp/controller/orders/completedorders_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/view/widget/rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ratingDialog(BuildContext context, int ordersid) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 0,
      // your app's name?
      title: Text(
        '185'.tr,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily:
              fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        '186'.tr,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          fontFamily:
              fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
        ),
      ),
      // your app's logo?
      image: Image.asset(
        MyImages.mainLogo,
        // scale: 5,
        height: 85,
        width: 85,
      ),
            commentHint: '187'.tr,
      commentHintTextStyle: TextStyle(
        fontFamily: fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
      ),
      submitButtonText: '188'.tr,
      submitButtonTextStyle: TextStyle(
        color: MyColors.primaryColor,
        fontSize: 17,
        fontFamily: fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
        fontWeight: FontWeight.bold,
      ),


      onCancelled: () => log('cancelled'),
      onSubmitted: (response) {
        CompletedOrdersController completedOrdersController = Get.find();

        completedOrdersController.submitRating(
            ordersid, response.rating, response.comment);

        log('rating: ${response.rating}, comment: ${response.comment}');
      },
    ),
  );
}
