import 'package:ecommerceapp/controller/orders/orderdetails_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondTable extends StatelessWidget {
  const SecondTable({super.key});

  @override
  Widget build(BuildContext context) {
    OrderdetailsController orderdetailsController = Get.find();

    return Card(
      child: Table(
        border: TableBorder.all(color: MyColors.greyColor),
        // columnWidths: const {
        //   0: FlexColumnWidth(1), // Left column size
        //   1: FlexColumnWidth(2), // Right column size
        // },
        children: [
          TableRow(
            children: [
              ColoredBox(
                color: MyColors.greyColor2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(
                    '168'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSize(14, 13.5),
                      fontWeight: FontWeight.bold,
                      fontFamily: fontFamily(
                          MyFonts.cairoRegular, MyFonts.montserratMedium),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  orderdetailsController.ordersModel.ordersDeliveryprice! > 0 ||
                          orderdetailsController
                                  .ordersModel.ordersDeliveryprice !=
                              null
                      ? '\$${orderdetailsController.ordersModel.ordersDeliveryprice}'
                      : "\$0",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: MyFonts.montserratMedium),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              ColoredBox(
                color: MyColors.greyColor2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(
                    '169'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSize(14, 13.5),
                      fontWeight: FontWeight.bold,
                      fontFamily: fontFamily(
                          MyFonts.cairoRegular, MyFonts.montserratMedium),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  orderdetailsController.ordersModel.couponName != null
                      ? '${orderdetailsController.ordersModel.couponName}'
                      : "---",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: MyFonts.montserratMedium),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              ColoredBox(
                color: MyColors.greyColor2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(
                    '170'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSize(14, 13.5),
                      fontWeight: FontWeight.bold,
                      fontFamily: fontFamily(
                          MyFonts.cairoRegular, MyFonts.montserratMedium),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  orderdetailsController.ordersModel.couponPercentage != null
                      ? '${orderdetailsController.ordersModel.couponPercentage}%'
                      : "---",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: MyFonts.montserratMedium,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              ColoredBox(
                color: MyColors.greyColor2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(
                    '171'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSize(14, 13.5),
                      fontWeight: FontWeight.bold,
                      fontFamily: fontFamily(
                          MyFonts.cairoRegular, MyFonts.montserratMedium),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  '${orderdetailsController.getPaymentMethod("${orderdetailsController.ordersModel.ordersPaymentmethod}")}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize(14, 13),
                    fontFamily: fontFamily(
                        MyFonts.cairoSemiBold, MyFonts.montserratMedium),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
