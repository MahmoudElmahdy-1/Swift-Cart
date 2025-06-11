import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/view/screen/cart_sc.dart';
import 'package:ecommerceapp/view/screen/searchscreen_sc.dart';
import 'package:ecommerceapp/view/widget/homepage/categoriesinhomepage_wd.dart';
import 'package:ecommerceapp/view/widget/homepage/topselling_wd.dart';
import 'package:ecommerceapp/view/widget/homepage/itemsdiscount_wd.dart';
import 'package:ecommerceapp/core/shared/mysearch_wd.dart';
import 'package:ecommerceapp/view/widget/homepage/offerimage_wd.dart';
import 'package:ecommerceapp/view/widget/homepage/title_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomePageControllerImp>(
        builder: (homePageControllerImp) => ListView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            children: [
              MySearch(
                myontroller: homePageControllerImp.searchController!,
                onChanged: (val) {
                  homePageControllerImp.checkSearch(val);
                },
                onTapSearch: () {
                  homePageControllerImp.onSearchPress();
                },
                cartOnPressed: () {
                  Get.to(() => const Cart(), transition: Transition.upToDown);
                },
              ),
              HandlingStatusRequests(
                statusRequest: homePageControllerImp.statusRequest,
                child: homePageControllerImp.isSearchActive
                    ? SearchScreen(
                        listItemsInSearch:
                            homePageControllerImp.listItemsInSearch,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const OfferImage(),
                          const SizedBox(height: 20),
                          MyTitle(
                            title: '72'.tr,
                          ),
                          const CategoriesInHomePage(),
                          const SizedBox(height: 25),
                          if (homePageControllerImp.itemsdiscount.isNotEmpty)
                            MyTitle(
                              title: '73'.tr,
                            ),
                          if (homePageControllerImp.itemsdiscount.isNotEmpty)
                            const ItemsDiscountWidget(),
                          const SizedBox(height: 15),
                          if (homePageControllerImp.topSellingItems.isNotEmpty)
                            MyTitle(
                              title: '74'.tr,
                            ),
                          if (homePageControllerImp.topSellingItems.isNotEmpty)
                            const TopSellingWidget(),
                        ],
                      ),
              ),
            ]),
      ),
    );
  }
}
