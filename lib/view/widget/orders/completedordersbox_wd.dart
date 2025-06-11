import 'package:ecommerceapp/controller/orders/completedorders_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/data/model/orders_model.dart';
import 'package:ecommerceapp/core/functions/ratingorder_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CompletedOrdersBox extends StatelessWidget {
  const CompletedOrdersBox({super.key, required this.ordersModel});

  final OrdersModel ordersModel;

  @override
  Widget build(BuildContext context) {
    CompletedOrdersController completedOrdersController = Get.find();
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
            color: MyColors.whiteColor,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                color: MyColors.shadowColor,
                blurRadius: 10,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "144".tr,
                        style: TextStyle(
                          fontSize: fontSize(20, 17),
                          fontFamily: fontFamily(
                              MyFonts.cairoRegular, MyFonts.montserratMedium),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "#${ordersModel.ordersId}",
                        style: TextStyle(
                          fontSize: fontSize(20, 17),
                          fontFamily: MyFonts.montserratMedium,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Expanded(
                  child: Text(
                    completedOrdersController
                        .getOrdersTime(ordersModel.ordersDatetime!),
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: MyColors.primaryColor,
                      fontFamily: fontFamily(
                          MyFonts.cairoRegular, MyFonts.montserratMedium),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "145".tr,
                style: TextStyle(
                  fontSize: fontSize(16, 15),
                  fontFamily: fontFamily(
                      MyFonts.cairoRegular, MyFonts.montserratMedium),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    "${completedOrdersController.getDeliveryType("${ordersModel.ordersDeliverytype}")}",
                style: TextStyle(
                  fontSize: fontSize(16, 15),
                  fontFamily: fontFamily(
                      MyFonts.cairoRegular, MyFonts.montserratMedium),
                ),
              ),
            ])),
            const SizedBox(height: 5),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "146".tr,
                style: TextStyle(
                  fontSize: fontSize(16, 15),
                  fontFamily: fontFamily(
                      MyFonts.cairoRegular, MyFonts.montserratMedium),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: NumberFormat.currency(decimalDigits: 2, symbol: '\$')
                    .format(double.parse(ordersModel.ordersPrice!)),
                style: TextStyle(
                  fontSize: fontSize(16, 15),
                  fontFamily: MyFonts.montserratMedium,
                ),
              ),
            ])),
            const SizedBox(height: 5),
            if (ordersModel.couponPercentage != null)
              Column(
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "146.5".tr,
                      style: TextStyle(
                        fontSize: fontSize(16, 15),
                        fontFamily: fontFamily(
                            MyFonts.cairoRegular, MyFonts.montserratMedium),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "${ordersModel.couponPercentage}%",
                      style: TextStyle(
                        fontSize: fontSize(16, 15),
                        fontFamily: MyFonts.montserratMedium,
                      ),
                    ),
                  ])),
                  const SizedBox(height: 5),
                ],
              ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "147".tr,
                style: TextStyle(
                  fontSize: fontSize(16, 15),
                  fontFamily: fontFamily(
                      MyFonts.cairoRegular, MyFonts.montserratMedium),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "\$${ordersModel.ordersDeliveryprice}",
                style: TextStyle(
                  fontSize: fontSize(16, 15),
                  fontFamily: MyFonts.montserratMedium,
                ),
              ),
            ])),
            const SizedBox(height: 5),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "148".tr,
                style: TextStyle(
                  fontSize: fontSize(16, 15),
                  fontFamily: fontFamily(
                      MyFonts.cairoRegular, MyFonts.montserratMedium),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    "${completedOrdersController.getPaymentMethod("${ordersModel.ordersPaymentmethod}")}",
                style: TextStyle(
                  fontSize: fontSize(16, 15),
                  fontFamily: fontFamily(
                      MyFonts.cairoRegular, MyFonts.montserratMedium),
                ),
              ),
            ])),
            const SizedBox(height: 5),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "149".tr,
                style: TextStyle(
                  fontSize: fontSize(16, 15),
                  fontFamily: fontFamily(
                      MyFonts.cairoRegular, MyFonts.montserratMedium),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    "${completedOrdersController.getOrdersStatus("${ordersModel.ordersStatus}")}",
                style: TextStyle(
                  fontSize: fontSize(16, 15),
                  fontFamily: fontFamily(
                      MyFonts.cairoRegular, MyFonts.montserratMedium),
                ),
              ),
            ])),
            const SizedBox(height: 5),
            const Divider(),
            Row(
              mainAxisAlignment: (ordersModel.ordersStatus == 4 &&
                      ordersModel.ordersRating == 0)
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "150".tr,
                    style: TextStyle(
                      color: MyColors.redColor,
                      fontSize: fontSize(16, 15),
                      fontFamily: fontFamily(
                          MyFonts.cairoRegular, MyFonts.montserratMedium),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: NumberFormat.currency(decimalDigits: 2, symbol: '\$')
                        .format(double.parse(ordersModel.ordersTotalprice!)),
                    style: TextStyle(
                      color: MyColors.redColor,
                      fontSize: fontSize(16, 15),
                      fontFamily: MyFonts.montserratMedium,
                    ),
                  ),
                ])),
                if (ordersModel.ordersStatus == 4 &&
                    ordersModel.ordersRating == 0)
                  InkWell(
                    onTap: () {
                      ratingDialog(context, ordersModel.ordersId!);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      decoration: BoxDecoration(
                        color: MyColors.amberColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '184'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: MyColors.whiteColor,
                          fontSize: fontSize(15, 15),
                          fontFamily: fontFamily(
                              MyFonts.cairoBold, MyFonts.montserratBold),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ));
  }
}
