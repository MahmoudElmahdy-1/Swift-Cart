import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/controller/categories_controller.dart';
import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/data/model/categories_model.dart';
import 'package:ecommerceapp/view/screen/cart_sc.dart';
import 'package:ecommerceapp/view/screen/searchscreen_sc.dart';
import 'package:ecommerceapp/core/shared/mysearch_wd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesController categoriesController = Get.find();
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          children: [
            MySearch(
              myontroller: categoriesController.searchController!,
              onChanged: (val) {
                categoriesController.checkSearch(val);
              },
              onTapSearch: () {
                categoriesController.onSearchPress();
              },
              cartOnPressed: () {
                Get.to(() => const Cart(), transition: Transition.upToDown);
              },
            ),
            GetBuilder<CategoriesController>(builder: (categoriesController) {
              return HandlingStatusRequests(
                statusRequest: categoriesController.statusRequest,
                child: categoriesController.isSearchActive
                    ? SearchScreen(
                        listItemsInSearch:
                            categoriesController.listItemsInSearch,
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categoriesController.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, childAspectRatio: 0.88),
                        itemBuilder: (BuildContext context, int i) {
                          return Categories(
                            i: i,
                            categoriesModel: categoriesController.data[i],
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

class Categories extends StatelessWidget {
  const Categories({super.key, required this.categoriesModel, required this.i});
  final CategoriesModel? categoriesModel;
  final int? i;

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp = Get.find();

    return InkWell(
      onTap: () {
        homePageControllerImp.goToItemsPage(homePageControllerImp.categories,
            i!, "${categoriesModel!.categoriesId}");
      },
      child: Column(
        children: [
          Container(
            height: 75,
            width: 75,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: MyColors.textFieldBackground,
              borderRadius: BorderRadius.circular(13),
            ),
            clipBehavior: Clip.hardEdge,
            child: SvgPicture.network(
              "${ApiLinks.imageCategories}/${categoriesModel!.categoriesImage}",
            ),
          ),
          const SizedBox(height: 5),
          Text(
            translateDatabase(
              '${categoriesModel!.categoriesNameAr}',
              '${categoriesModel!.categoriesNameEn}',
            ),
            style: TextStyle(
              color: MyColors.primaryColor,
              fontFamily: fontFamily(
                MyFonts.cairoRegular,
                MyFonts.montserratMedium,
              ),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
