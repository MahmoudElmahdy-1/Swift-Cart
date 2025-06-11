import 'package:ecommerceapp/controller/checkout_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:ecommerceapp/core/constant/mypages.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/core/shared/customappbar_wd.dart';
import 'package:ecommerceapp/view/widget/checkout/checkoutbottomnavbar_wd.dart';
import 'package:ecommerceapp/view/widget/checkout/chooseaddress_wd.dart';
import 'package:ecommerceapp/view/widget/checkout/deliverytype_wd.dart';
import 'package:ecommerceapp/view/widget/checkout/paymentmethod_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.whiteColor,
        appBar: CustomAppBar(text: '134'.tr),
        bottomNavigationBar: const CheckoutBottomNavBar(),
        body: GetBuilder<CheckoutController>(
            builder: (checkoutController) => HandlingStatusRequests(
                  statusRequest: checkoutController.statusRequest,
                  child: SafeArea(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          child: Text(
                            '135'.tr,
                            style: TextStyle(
                              color: MyColors.blackColor,
                              fontSize: fontSize(20, 18),
                              fontFamily: fontFamily(MyFonts.cairoRegular,
                                  MyFonts.montserratMedium),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        PaymentMethod(
                          onTap: () {
                            checkoutController
                                .choosePaymentMethod("0"); // 0 => cash
                          },
                          title: "136".tr,
                          isActive: checkoutController.paymentMethod ==
                                  "0" // 0 => cash
                              ? true
                              : false,
                        ),
                        PaymentMethod(
                          onTap: () {
                            checkoutController
                                .choosePaymentMethod("1"); // 1 => online
                          },
                          title: "137".tr,
                          isActive: checkoutController.paymentMethod ==
                                  "1" // 1 => online
                              ? true
                              : false,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          child: Text(
                            '138'.tr,
                            style: TextStyle(
                              color: MyColors.blackColor,
                              fontSize: fontSize(20, 18),
                              fontFamily: fontFamily(MyFonts.cairoRegular,
                                  MyFonts.montserratMedium),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 12,
                          children: [
                            DeliveryType(
                              onTap: () {
                                checkoutController
                                    .chooseDeliveryType('0'); // 0 => delivery
                              },
                              title: '139'.tr,
                              myImage: MyImages.delivery,
                              isActive: checkoutController.deliveryType ==
                                      '0' // 0 => delivery
                                  ? true
                                  : false,
                            ),
                            DeliveryType(
                              onTap: () {
                                checkoutController
                                    .chooseDeliveryType('1'); // 1 => store
                              },
                              title: '140'.tr,
                              myImage: MyImages.store,
                              isActive: checkoutController.deliveryType ==
                                      '1' // 1 => store
                                  ? true
                                  : false,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        if (checkoutController.deliveryType == '0')
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (checkoutController.listAddressData.isNotEmpty)
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: Text(
                                    '141'.tr,
                                    style: TextStyle(
                                      color: MyColors.blackColor,
                                      fontSize: fontSize(20, 18),
                                      fontFamily: fontFamily(
                                          MyFonts.cairoRegular,
                                          MyFonts.montserratMedium),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              if (checkoutController.listAddressData.isNotEmpty)
                                ...List.generate(
                                  checkoutController.listAddressData.length,
                                  (i) => ChooseAddress(
                                    name: checkoutController
                                        .listAddressData[i].addressName!,
                                    body:
                                        '${checkoutController.listAddressData[i].addressCity!} - ${checkoutController.listAddressData[i].addressStreet!} - ${checkoutController.listAddressData[i].addressBuilding!}',
                                    onTap: () {
                                      checkoutController.chooseAddress(
                                          checkoutController
                                              .listAddressData[i].addressId!);
                                    },
                                    isActive: checkoutController.addressId ==
                                            checkoutController
                                                .listAddressData[i].addressId
                                        ? true
                                        : false,
                                  ),
                                ),
                              const SizedBox(height: 30),
                              if (checkoutController.listAddressData.isEmpty)
                                Center(
                                  child: PaymentMethod(
                                      isActive: false,
                                      title: '142.5'.tr,
                                      onTap: () {
                                        Get.toNamed(MyPages.locationAdd);
                                      }),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                )));
  }
}
