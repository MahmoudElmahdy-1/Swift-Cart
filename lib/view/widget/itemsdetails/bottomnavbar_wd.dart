import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/controller/itemsdetails_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/cartsnackbar_fu.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsdetailsControllerImp itemsdetailsControllerImp = Get.find();
    final favoriteService = Get.find<FavoriteService>();

    return Container(
      margin: const EdgeInsets.only(bottom: 8, top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            spacing: 10,
            children: [
              Obx(() {
                final isFavorite = favoriteService
                    .isFavorite(itemsdetailsControllerImp.itemsModel.itemsId!);
                return Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: MyColors.redColor),
                    color: MyColors.whiteColor,
                  ),
                  child: IconButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      iconColor: WidgetStateProperty.all(MyColors.redColor),
                    ),
                    onPressed: () {
                      final favoriteController = Get.find<FavoriteController>();
                      final itemId =
                          itemsdetailsControllerImp.itemsModel.itemsId!;
                      if (isFavorite) {
                        favoriteController.removeFavorite(itemId);
                      } else {
                        favoriteController.addFavorite(itemId);
                      }
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_outline,
                      size: 28,
                    ),
                  ),
                );
              }),
              // GetBuilder<FavoriteController>(
              //   builder: (favoriteController) => Container(
              //     height: 60,
              //     width: 60,

              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(13),
              //       border: Border.all(color: MyColors.redColor),
              //       color: MyColors.whiteColor,
              //     ),
              //     // child:Icon(Icons.favorite_outline),
              //     child: IconButton(
              //       style: ButtonStyle(
              //         shape: WidgetStateProperty.all(
              //           RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(13),
              //           ),
              //         ),
              //         iconColor: WidgetStateProperty.all(MyColors.redColor),
              //       ),
              //       onPressed: () {
              //         final id = itemsdetailsControllerImp.itemsModel.itemsId;
              //         if (favoriteController.isFavorite[id] == 1) {
              //           favoriteController.changeFavorite(id, 0);
              //           favoriteController.removeFavorite(id!);
              //         } else {
              //           favoriteController.changeFavorite(id, 1);
              //           favoriteController.addFavorite(id!);
              //         }
              //       },
              //       icon: favoriteController.isFavorite[
              //                   itemsdetailsControllerImp.itemsModel.itemsId] ==
              //               1
              //           ? const Icon(
              //               Icons.favorite,
              //               size: 28,
              //             )
              //           : const Icon(
              //               Icons.favorite_outline,
              //               size: 28,
              //             ),
              //     ),
              //   ),
              // ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  clipBehavior: Clip.antiAlias,
                  height: 60,
                  child: MaterialButton(
                      color: MyColors.primaryColor,
                      onPressed: () {
                        itemsdetailsControllerImp.add();
                        addCartSnackBar();
                      },
                      child: Text('88'.tr,
                          style: TextStyle(
                              color: MyColors.whiteColor,
                              fontSize: 16,
                              fontFamily: fontFamily(
                                  MyFonts.cairoBold, MyFonts.montserratBold)))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
