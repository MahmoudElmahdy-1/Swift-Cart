import 'package:ecommerceapp/controller/checkout_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutBottomNavBar extends StatelessWidget {
  const CheckoutBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController checkoutController = Get.find();
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
        ),
        clipBehavior: Clip.antiAlias,
        height: 55,
        child: MaterialButton(
            color: MyColors.greenColor,
            onPressed: () {
              checkoutController.checkout(context);
            },
            child: Text('142'.tr,
                style: TextStyle(
                    color: MyColors.whiteColor,
                    fontSize: 16,
                    fontFamily: fontFamily(
                        MyFonts.cairoBold, MyFonts.montserratBold)))),
      ),
    );
  }
}
