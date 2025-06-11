import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOnBoardingButton extends StatelessWidget {
  const CustomOnBoardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingControllerImp onBoardingControllerImp = Get.find();

    return ElevatedButton(
        onPressed: () {
          onBoardingControllerImp.nextPage();
        },
        style: ElevatedButton.styleFrom(
          elevation: 3,
          shadowColor: MyColors.shadowColor,
          fixedSize: const Size(320, 46),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: MyColors.primaryColor,
          foregroundColor: MyColors.whiteColor,
        ),
        child: GetBuilder<OnBoardingControllerImp>(
          builder: (controller) => Text(
            controller.currentPage == onBoardingList.length - 1
                ? '10'.tr
                : '11'.tr,
            style: TextStyle(
              fontSize: fontSize(17, 16),
              fontFamily: fontFamily(MyFonts.cairoBold, MyFonts.montserratBold),
            ),
          ),
        ));
  }
}
