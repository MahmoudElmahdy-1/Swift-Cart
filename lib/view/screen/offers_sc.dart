import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/controller/offers_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/view/screen/cart_sc.dart';
import 'package:ecommerceapp/view/screen/searchscreen_sc.dart';
import 'package:ecommerceapp/core/shared/mysearch_wd.dart';
import 'package:ecommerceapp/view/widget/offers_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offers extends GetView<OffersController> {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.find();

    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          children: [
            MySearch(
              myontroller: controller.searchController!,
              onChanged: (val) {
                controller.checkSearch(val);
              },
              cartOnPressed: () {
                Get.to(() => const Cart(), transition: Transition.upToDown);
              },
              onTapSearch: () {
                controller.onSearchPress();
              },
            ),
            GetBuilder<OffersController>(builder: (offersController) {
              return HandlingStatusRequests(
                statusRequest: offersController.statusRequest,
                child: controller.isSearchActive
                    ? SearchScreen(
                        listItemsInSearch: controller.listItemsInSearch,
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:offersController.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.715),
                        itemBuilder: (BuildContext context, int i) {
                          favoriteController.isFavorite[offersController.data[i]
                              .itemsId] = offersController.data[i].favorite;
                          return OffersWidget(
                            itemsModel: offersController.data[i],
                          );
                        },
                      ),
              );
            })
          ],
        ),
      ),
    );
  }
}
