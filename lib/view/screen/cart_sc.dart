import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/functions/cartsnackbar_fu.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/core/shared/customappbar_wd.dart';
import 'package:ecommerceapp/view/widget/cart/cartbottomnavbar_wd.dart';
import 'package:ecommerceapp/view/widget/cart/cartitembox_wd.dart';
import 'package:ecommerceapp/view/widget/cart/itemscount_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    // (LayoutBuilder) to make the bottom bar go up when the keyboard appears
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          padding:
              // (MediaQuery.of(context).viewInsets.bottom) to returns the height of the keyboard.
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: MyColors.whiteColor,
            bottomNavigationBar: GetBuilder<CartController>(
              builder: (cartController) => const CartBottomNavBar(),
            ),
            appBar: CustomAppBar(
              text: '90'.tr,
            ),
            body: GetBuilder<CartController>(
              builder: (cartController) => HandlingStatusRequests(
                statusRequest: cartController.statusRequest,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  children: [
                    const SizedBox(height: 15),
                    const ItemsCountWidget(),
                    const SizedBox(height: 20),
                    ...List.generate(
                      cartController.data.length,
                      (i) => CartItemBox(
                        name: translateDatabase(
                          '${cartController.data[i].itemsNameAr}',
                          '${cartController.data[i].itemsNameEn}',
                        ),
                        price: double.parse(
                                "${cartController.data[i].allitemsprice}")
                            .toStringAsFixed(2),
                        itemscount: '${cartController.data[i].allitemscount}',
                        imagename: '${cartController.data[i].itemsImage}',
                        onTapAdd: () async {
                          await cartController
                              .addCart(cartController.data[i].itemsId!);
                          cartController.refreshPage();
                        },
                        onTapRemove: () async {
                          await cartController
                              .removeCart(cartController.data[i].itemsId!);
                          cartController.refreshPage();
                        },
                        onTapDelete: () async {
                          deleteCartSnackBar();
                          await cartController
                              .deleteItem(cartController.data[i].itemsId!);
                          cartController.refreshPage();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
