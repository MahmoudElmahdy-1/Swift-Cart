import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/view/screen/cart_sc.dart';
import 'package:ecommerceapp/view/screen/searchscreen_sc.dart';
import 'package:ecommerceapp/view/widget/items/categoriesinitemspage_wd.dart';
import 'package:ecommerceapp/view/widget/items/items_wd.dart';
import 'package:ecommerceapp/core/shared/mysearch_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsPage extends GetView<ItemsControllerImp> {
  const ItemsPage({super.key});

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
            Column(
              children: [
                const SizedBox(height: 10),
                const CategoriesInItemsPage(),
                const SizedBox(height: 20),
                // getbuilder here so when the status changes(loading,failure,nodata etc) the effect only appear in the items not the whole page
                GetBuilder<ItemsControllerImp>(builder: (itemsControllerImp) {
                  bool isLoading =
                      itemsControllerImp.statusRequest == StatusRequest.loading;
                  return HandlingStatusRequests(
                    statusRequest: itemsControllerImp.statusRequest,
                    child: controller.isSearchActive
                        ? SearchScreen(
                            listItemsInSearch: controller.listItemsInSearch,
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                isLoading ? 6 : itemsControllerImp.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.715),
                            itemBuilder: (BuildContext context, int i) {
                              if (!isLoading) {
                                favoriteController.isFavorite[
                                        itemsControllerImp.data[i].itemsId] =
                                    itemsControllerImp.data[i].favorite;
                              }
                              return ItemsWidget(
                                itemsModel: isLoading
                                    ? null
                                    : itemsControllerImp.data[i],
                                isLoading: isLoading,
                              );
                            },
                          ),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
