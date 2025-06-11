import 'package:ecommerceapp/controller/orders/orderdetails_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ThirdTable extends StatelessWidget {
  const ThirdTable({super.key});

  @override
  Widget build(BuildContext context) {
    OrderdetailsController orderdetailsController = Get.find();

    return Card(
      child:
          Table(border: TableBorder.all(color: MyColors.greyColor), children: [
        TableRow(
            decoration: BoxDecoration(color: MyColors.greyColor2),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '172'.tr,
                        style: TextStyle(
                          fontSize: fontSize(14, 13),
                          fontWeight: FontWeight.bold,
                          fontFamily: fontFamily(
                              MyFonts.cairoRegular, MyFonts.montserratMedium),
                        ),
                      ),
                      TextSpan(
                        text: '#${orderdetailsController.ordersModel.ordersId}',
                        style: TextStyle(
                            fontSize: fontSize(14, 13),
                            fontWeight: FontWeight.bold,
                            fontFamily: MyFonts.montserratMedium),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '173'.tr,
                        style: TextStyle(
                          fontSize: fontSize(14, 13),
                          fontWeight: FontWeight.bold,
                          fontFamily: fontFamily(
                              MyFonts.cairoRegular, MyFonts.montserratMedium),
                        ),
                      ),
                      TextSpan(
                        text: NumberFormat.currency(
                                decimalDigits: 2, symbol: '\$')
                            .format(double.parse(orderdetailsController
                                .ordersModel.ordersTotalprice!)),
                        style: TextStyle(
                            fontSize: fontSize(14, 13),
                            fontWeight: FontWeight.bold,
                            fontFamily: MyFonts.montserratMedium),
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
