import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/view/widget/onboarding/custombuttononboard_wd.dart';
import 'package:ecommerceapp/view/widget/onboarding/customdots_wd.dart';
import 'package:ecommerceapp/view/widget/onboarding/customsliders_wd.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: CustomSlidersOnBoarding(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotsOnBoarding(),
                  Spacer(flex: 4),
                  CustomOnBoardingButton(),
                  Spacer(flex: 1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
