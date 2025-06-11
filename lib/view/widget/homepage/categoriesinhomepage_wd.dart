import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesInHomePage extends StatelessWidget {
  const CategoriesInHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp = Get.find();

    bool isLoading =
        homePageControllerImp.statusRequest == StatusRequest.loading;

    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: isLoading ? 6 : homePageControllerImp.categories.length,
        separatorBuilder: (context, i) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          return Categories(
            i: i,
            categoriesModel: isLoading
                ? null
                : CategoriesModel.fromJson(homePageControllerImp.categories[i]),
            
          );
        },
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
    bool isLoading =
        homePageControllerImp.statusRequest == StatusRequest.loading;

    return InkWell(
      onTap: isLoading
          ? null // Disable onTap when loading = true
          : () {
              homePageControllerImp.goToItemsPage(
                  homePageControllerImp.categories,
                  i!,
                  "${categoriesModel!.categoriesId}");
            },
      child: Column(
        children: [
          Skeletonizer(
            enabled: isLoading,
            child: Container(
              height: 75,
              width: 75,
              padding:
                  isLoading ? null : const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: MyColors.textFieldBackground,
                borderRadius: BorderRadius.circular(13),
              ),
              clipBehavior: Clip.hardEdge,
              child: isLoading
                  ? Container(
                      color: MyColors.textFieldBackground,
                      height: 75,
                      width: 75,
                    )
                  : SvgPicture.network(
                      "${ApiLinks.imageCategories}/${categoriesModel!.categoriesImage}",
                    ),
            ),
          ),
          const SizedBox(height: 5),
          Skeletonizer(
            enabled: isLoading,
            child: Text(
              isLoading
                  ? "Loading..."
                  : translateDatabase(
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
          ),
        ],
      ),
    );
  }
}
