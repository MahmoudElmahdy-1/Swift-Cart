import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/view/widget/cart/couponfield_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        builder: (cartController) => Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                color: MyColors.textFieldBackground,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 15),
                  cartController.couponName == null
                      ? CouponWidget(
                          myController: cartController.couponController!,
                          onApplyTap: () {
                            cartController.checkCoupon();
                          },
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(color: MyColors.primaryColor)),
                          child: Text(
                            "${"120".tr}  ${cartController.couponName!}",
                            style: TextStyle(
                                color: MyColors.primaryColor,
                                fontSize: fontSize(15, 15),
                                fontFamily: fontFamily(MyFonts.cairoRegular,
                                    MyFonts.montserratMedium)),
                          )),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '93'.tr,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: fontFamily(MyFonts.cairoRegular,
                                MyFonts.montserratMedium)),
                      ),
                      Text(
                        '${double.parse("${cartController.orderPrice}").toStringAsFixed(2)}\$',
                        style: TextStyle(
                            fontSize: 15, fontFamily: MyFonts.montserratMedium),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '94'.tr,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: fontFamily(MyFonts.cairoRegular,
                                MyFonts.montserratMedium)),
                      ),
                      Text(
                        '${cartController.couponPercentage}%',
                        style: TextStyle(
                            fontSize: 15, fontFamily: MyFonts.montserratMedium),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '95'.tr,
                        style: TextStyle(
                            fontSize: 21,
                            fontFamily: fontFamily(MyFonts.cairoRegular,
                                MyFonts.montserratMedium)),
                      ),
                      Text(
                        '${double.parse("${cartController.getTotalPriceAfterDiscount()}").toStringAsFixed(2)}\$',
                        style: TextStyle(
                            fontSize: 21, fontFamily: MyFonts.montserratMedium),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: MaterialButton(
                        color: MyColors.primaryColor,
                        onPressed: () {
                          cartController.goToCheckout();
                        },
                        child: Text('96'.tr,
                            style: TextStyle(
                                color: MyColors.whiteColor,
                                fontSize: 16,
                                fontFamily: fontFamily(MyFonts.cairoBold,
                                    MyFonts.montserratBold)))),
                  ),
                ],
              ),
            ));
    // Container(
    //   decoration: BoxDecoration(
    //     borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
    //     color: MyColors.textFieldBackground,
    //   ),
    //   padding: const EdgeInsets.symmetric(horizontal: 15),
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       const SizedBox(height: 15),
    //       GetBuilder<CartController>(
    //         builder: (cartController) => cartController.couponName == null
    //             ? CouponWidget(
    //                 myController: cartController.couponController!,
    //                 onApplyTap: () {
    //                   cartController.checkCoupon();
    //                 },
    //               )
    //             : Container(
    //                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(13),
    //                     border: Border.all(color: MyColors.primaryColor)),
    //                 child: Text(
    //                   "${"120".tr}  ${cartController.couponName!}",
    //                   style: TextStyle(
    //                       color: MyColors.primaryColor,
    //                       fontSize: fontSize(15, 15),
    //                       fontFamily: fontFamily(
    //                           MyFonts.cairoRegular, MyFonts.montserratMedium)),
    //                 )),
    //       ),
    //       const SizedBox(height: 10),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(
    //             '93'.tr,
    //             style: TextStyle(
    //                 fontSize: 15,
    //                 fontFamily: fontFamily(
    //                     MyFonts.cairoRegular, MyFonts.montserratMedium)),
    //           ),
    //           Text(
    //             '${double.parse("${cartController.orderPrice}").toStringAsFixed(2)}\$',
    //             style: TextStyle(
    //                 fontSize: 15, fontFamily: MyFonts.montserratMedium),
    //           ),
    //         ],
    //       ),
    //       const SizedBox(height: 2),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(
    //             '94'.tr,
    //             style: TextStyle(
    //                 fontSize: 15,
    //                 fontFamily: fontFamily(
    //                     MyFonts.cairoRegular, MyFonts.montserratMedium)),
    //           ),
    //           Text(
    //             '${cartController.couponPercentage}%',
    //             style: TextStyle(
    //                 fontSize: 15, fontFamily: MyFonts.montserratMedium),
    //           ),
    //         ],
    //       ),
    //       const Divider(),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(
    //             '95'.tr,
    //             style: TextStyle(
    //                 fontSize: 21,
    //                 fontFamily: fontFamily(
    //                     MyFonts.cairoRegular, MyFonts.montserratMedium)),
    //           ),
    //           Text(
    //             '${double.parse("${cartController.getTotalPriceAfterDiscount()}").toStringAsFixed(2)}\$',
    //             style: TextStyle(
    //                 fontSize: 21, fontFamily: MyFonts.montserratMedium),
    //           ),
    //         ],
    //       ),
    //       const SizedBox(height: 10),
    //       Container(
    //         width: double.infinity,
    //         height: 55,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(13),
    //         ),
    //         clipBehavior: Clip.antiAlias,
    //         margin: const EdgeInsets.only(bottom: 10),
    //         child: MaterialButton(
    //             color: MyColors.primaryColor,
    //             onPressed: () {
    //               cartController.goToCheckout();
    //             },
    //             child: Text('96'.tr,
    //                 style: TextStyle(
    //                     color: MyColors.whiteColor,
    //                     fontSize: 16,
    //                     fontFamily: fontFamily(
    //                         MyFonts.cairoBold, MyFonts.montserratBold)))),
    //       ),
    //     ],
    //   ),
    // );
  }
}
