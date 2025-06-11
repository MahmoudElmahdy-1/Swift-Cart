import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesInItemsPage extends StatelessWidget {
  const CategoriesInItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp itemsControllerImp = Get.find();

    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: itemsControllerImp.categories.length,
        separatorBuilder: (context, i) => const SizedBox(width: 3),
        itemBuilder: (context, i) {
          return Categoriesinitems(
            i: i,
            categoriesModel:
                CategoriesModel.fromJson(itemsControllerImp.categories[i]),
          );
        },
      ),
    );
  }
}

class Categoriesinitems extends StatelessWidget {
  const Categoriesinitems(
      {super.key, required this.categoriesModel, required this.i});
  final CategoriesModel categoriesModel;
  final int i;

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp itemsControllerImp = Get.find();

    return InkWell(
      onTap: () {
        itemsControllerImp.changeCategory(i, "${categoriesModel.categoriesId}");
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (itemsControllerImp) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: itemsControllerImp.selectedCategory == i
                  ? BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.circular(9))
                  : null,
              child: Text(
                translateDatabase('${categoriesModel.categoriesNameAr}',
                    '${categoriesModel.categoriesNameEn}'),
                style: TextStyle(
                  color: itemsControllerImp.selectedCategory == i
                      ? MyColors.whiteColor
                      : MyColors.primaryColor,
                  fontSize: fontSize(18, 17),
                  fontFamily: fontFamily(
                      MyFonts.cairoRegular, MyFonts.montserratMedium),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
