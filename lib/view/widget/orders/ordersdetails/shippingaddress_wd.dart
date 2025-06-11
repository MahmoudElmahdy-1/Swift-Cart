import 'package:ecommerceapp/controller/orders/orderdetails_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    OrderdetailsController orderdetailsController = Get.find();

    return Card(
      child:
          Table(border: TableBorder.all(color: MyColors.greyColor), children: [
        TableRow(
            // decoration: BoxDecoration(color: MyColors.greyColor2),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                child: Text.rich(
                  // textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '174'.tr,
                        style: TextStyle(
                          fontSize: fontSize(16.5, 15.5),
                          fontWeight: FontWeight.bold,
                          fontFamily: fontFamily(
                              MyFonts.cairoRegular, MyFonts.montserratMedium),
                        ),
                      ),
                      TextSpan(
                        text: orderdetailsController
                                    .ordersModel.ordersDeliverytype ==
                                0
                            ? "\n${orderdetailsController.ordersModel.addressCity} - ${orderdetailsController.ordersModel.addressStreet} - ${orderdetailsController.ordersModel.addressBuilding}"
                            : "\n${'175'.tr}",
                        style: TextStyle(
                          color: MyColors.bodyColor,
                          fontSize: fontSize(16.5, 15.5),
                          fontFamily: fontFamily(
                              MyFonts.cairoRegular, MyFonts.montserratMedium),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ])
      ]),
    );
  }
}
