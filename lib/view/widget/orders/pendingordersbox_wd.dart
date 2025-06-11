import 'package:ecommerceapp/controller/orders/pendingorders_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/constant/mypages.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/data/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PendingOrdersBox extends StatelessWidget {
  const PendingOrdersBox({super.key, required this.ordersModel});

  final OrdersModel ordersModel;

  @override
  Widget build(BuildContext context) {
    PendingOrdersController pendingOrdersController = Get.find();
    return InkWell(
      onTap: () {
        Get.toNamed(MyPages.orderDetails,
            arguments: {"ordersmodel": ordersModel});
      },
      child: Container(
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
                      pendingOrdersController
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
                      "${pendingOrdersController.getDeliveryType("${ordersModel.ordersDeliverytype}")}",
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
                      "${pendingOrdersController.getPaymentMethod("${ordersModel.ordersPaymentmethod}")}",
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
                      "${pendingOrdersController.getOrdersStatus("${ordersModel.ordersStatus}")}",
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      text: NumberFormat.currency(
                              decimalDigits: 2, symbol: '\$')
                          .format(double.parse(ordersModel.ordersTotalprice!)),
                      // text: "${ordersModel.ordersTotalprice}\$",
                      style: TextStyle(
                        color: MyColors.redColor,
                        fontSize: fontSize(16, 15),
                        fontFamily: MyFonts.montserratMedium,
                      ),
                    ),
                  ])),
                  if (ordersModel.ordersStatus == 3)
                    InkWell(
                      onTap: () {
                        pendingOrdersController.goToTrackingOrder(ordersModel);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 15),
                        decoration: BoxDecoration(
                          color: MyColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '151'.tr,
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
          )),
    );
  }
}
