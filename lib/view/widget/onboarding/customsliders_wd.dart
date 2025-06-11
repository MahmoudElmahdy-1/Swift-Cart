import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSlidersOnBoarding extends StatelessWidget {
  const CustomSlidersOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingControllerImp onBoardingImpController = Get.find();

    return PageView.builder(
      controller: onBoardingImpController.pageController,
      onPageChanged: (val) {
        onBoardingImpController.onSliderChange(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Image.asset(
            onBoardingList[i].image!,
          ),
          const SizedBox(height: 4),
          Text(
            onBoardingList[i].title!,
            style: TextStyle(
                fontSize: fontSize(25, 23),
                fontFamily:
                    fontFamily(MyFonts.cairoBold, MyFonts.montserratBold)),
          ),
          const SizedBox(height: 10),
          Text(
            onBoardingList[i].body!,
            style: TextStyle(
              fontSize: fontSize(15, 14.5),
              fontFamily: fontFamily(MyFonts.cairoBold, MyFonts.montserratBold),
              height: 1.8,
              color: MyColors.bodyColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
