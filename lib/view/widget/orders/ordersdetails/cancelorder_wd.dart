import 'package:ecommerceapp/controller/orders/orderdetails_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/core/shared/animated_confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelOrder extends StatelessWidget {
  const CancelOrder({super.key});

  @override
  Widget build(BuildContext context) {
    OrderdetailsController orderdetailsController = Get.find();

    return InkWell(
      onTap: () {
        showCustomDialog(
          context: context,
          title: '176'.tr,
          message: '177'.tr,
          confirmButtonText: '178'.tr,
          cancelButtonText: '179'.tr,
          cancelButtonColor: MyColors.darkRedColor,
          cancelButtonTextColor: MyColors.whiteColor,
          confirmButtonColor: MyColors.greenColor,
          confirmButtonTextColor: MyColors.whiteColor,
          onCancel: () {
            Get.back();
          },
          onConfirm: () {
            orderdetailsController
                .cancelOrders("${orderdetailsController.ordersModel.ordersId}");
          },
          isFlip: true,
        );
      },
      child: Card(
        child: Container(
          color: MyColors.darkRedColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Text(
              "180".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: MyColors.whiteColor,
                fontFamily:
                    fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
