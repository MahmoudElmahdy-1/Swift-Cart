import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/view/screen/cart_sc.dart';
import 'package:ecommerceapp/view/screen/searchscreen_sc.dart';
import 'package:ecommerceapp/view/widget/favoriteitems_wd.dart';
import 'package:ecommerceapp/core/shared/mysearch_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesView extends GetView<FavoriteController> {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          children: [
            MySearch(
              myontroller: controller.searchController!,
              onChanged: (val) {
                controller.checkSearch(val);
              },
              onTapSearch: () {
                controller.onSearchPress();
              },
              cartOnPressed: () {
                Get.to(() => const Cart(), transition: Transition.upToDown);
              },
            ),
            GetBuilder<FavoriteController>(builder: (favoriteController) {
              return HandlingStatusRequests(
                statusRequest: favoriteController.statusRequest,
                child: controller.isSearchActive
                    ? SearchScreen(
                        listItemsInSearch: controller.listItemsInSearch,
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: favoriteController.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.715),
                        itemBuilder: (BuildContext context, int i) {
                          return FavoriteItemsWidget(
                            favoritesModel: favoriteController.data[i],
                          );
                        },
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
