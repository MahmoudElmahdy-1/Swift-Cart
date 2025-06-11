import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TopSellingWidget extends StatelessWidget {
  const TopSellingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp = Get.find();
    bool isLoading =
        homePageControllerImp.statusRequest == StatusRequest.loading;

    return Skeletonizer(
      enabled: isLoading,
      child: SizedBox(
        height: 200,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, i) => const SizedBox(width: 10),
          itemCount:
              isLoading ? 4 : homePageControllerImp.topSellingItems.length,
          itemBuilder: (context, i) {
            return ItemsForYou(
              itemsModel: isLoading
                  ? null
                  : ItemsModel.fromJson(
                      homePageControllerImp.topSellingItems[i]),
            );
          },
        ),
      ),
    );
  }
}

class ItemsForYou extends StatelessWidget {
  const ItemsForYou({super.key, required this.itemsModel});
  final ItemsModel? itemsModel;

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp = Get.find();
    bool isLoading =
        homePageControllerImp.statusRequest == StatusRequest.loading;
    return InkWell(
      onTap: isLoading
          ? null
          : () {
              homePageControllerImp.goToItemDetails(itemsModel);
            },
      child: Stack(children: [
        Container(
          padding: isLoading ? null : const EdgeInsets.all(10),
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            color: MyColors.textFieldBackground,
            borderRadius: BorderRadius.circular(13),
          ),
          clipBehavior: Clip.hardEdge,
          child: isLoading
              ? Container()
              : CachedNetworkImage(
                  imageUrl: "${ApiLinks.imageItems}/${itemsModel!.itemsImage}"),
        ),
        Positioned(
          left: 8,
          top: 8,
          child: isLoading
              ? Container(
                  color: MyColors.textFieldBackground,
                  height: 200,
                  width: 300,
                )
              : Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Text(
                    isLoading
                        ? "Loading..."
                        : translateDatabase("${itemsModel!.itemsNameAr}",
                            "${itemsModel!.itemsNameEn}"),
                    style: TextStyle(
                        color: MyColors.whiteColor,
                        fontSize: fontSize(17, 17),
                        fontFamily: fontFamily(
                            MyFonts.cairoSemiBold, MyFonts.montserratMedium)),
                  ),
                ),
        ),
      ]),
    );
  }
}
