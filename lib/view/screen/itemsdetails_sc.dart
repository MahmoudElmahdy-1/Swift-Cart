import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/controller/itemsdetails_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/view/screen/cart_sc.dart';
import 'package:ecommerceapp/view/widget/itemsdetails/bottomnavbar_wd.dart';
import 'package:ecommerceapp/view/widget/itemsdetails/image_wd.dart';
import 'package:ecommerceapp/view/widget/itemsdetails/itemdescriptionwidget_wd.dart';
import 'package:ecommerceapp/view/widget/itemsdetails/itemnamewidget_wd.dart';
import 'package:ecommerceapp/view/widget/itemsdetails/pricewidget_wd.dart';
import 'package:ecommerceapp/view/widget/itemsdetails/ratingwidget_wd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      bottomNavigationBar: const SafeArea(child: BottomNavBar()),
      appBar: AppBar(
        foregroundColor: MyColors.primaryColor,
        backgroundColor: MyColors.textFieldBackground,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  cartController.refreshPage();
                  Get.to(() => const Cart(), transition: Transition.upToDown);
                },
                icon: const Icon(CupertinoIcons.bag))
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const ImageWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(28)),
                  ),
                  child: GetBuilder<ItemsdetailsControllerImp>(
                      builder: (itemsdetailsControllerImp) =>
                          HandlingStatusRequests(
                            statusRequest:
                                itemsdetailsControllerImp.statusRequest,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NameInItemDetails(),
                                SizedBox(height: 10),
                                PriceWidget(),
                                SizedBox(height: 10),
                                RatingWidget(),
                                SizedBox(height: 10),
                                DescriptionInItemDetails(),
                                SizedBox(height: 10),
                                // ColorWidget(),
                              ],
                            ),
                          ))),
            ),
          ],
        ),
      ),
    );
  }
}
