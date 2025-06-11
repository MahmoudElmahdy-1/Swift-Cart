import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/controller/offers_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:ecommerceapp/view/widget/items/priceline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({super.key, required this.itemsModel});
  final ItemsModel? itemsModel;

  @override
  Widget build(BuildContext context) {
    OffersController offersController = Get.find();
    final favoriteService = Get.find<FavoriteService>();
    return InkWell(
      onTap: () {
        offersController.goToItemDetails(itemsModel!);
      },
      child: Stack(
        children: [
          Card(
            color: MyColors.textFieldBackground,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 130,
                    child: Hero(
                      tag: "${itemsModel!.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl:
                            "${ApiLinks.imageItems}/${itemsModel!.itemsImage}",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    translateDatabase("${itemsModel!.itemsNameAr}",
                        "${itemsModel!.itemsNameEn}"),
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: fontFamily(
                          MyFonts.cairoRegular, MyFonts.montserratMedium),
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        5,
                        (i) => Icon(
                          Icons.star,
                          size: 18,
                          color: MyColors.amberColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontFamily: MyFonts.montserratMedium,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  itemsModel!.itemsDiscount! > 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Opacity(
                              opacity: 0.6,
                              child: Stack(
                                children: [
                                  Text(
                                    NumberFormat.currency(
                                            decimalDigits: 2, symbol: '\$')
                                        .format(double.parse(
                                            itemsModel!.itemsPrice!)),
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      fontFamily: MyFonts.montserratMedium,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: CustomPaint(
                                      size: const Size(70, 20),
                                      painter: DiagonalLinePainter(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              NumberFormat.currency(
                                      decimalDigits: 2, symbol: '\$')
                                  .format(double.parse(
                                      itemsModel!.priceafterdiscount!)),
                              style: TextStyle(
                                fontSize: 13.5,
                                fontFamily: MyFonts.montserratMedium,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          NumberFormat.currency(decimalDigits: 2, symbol: '\$')
                              .format(double.parse(
                                  itemsModel!.priceafterdiscount!)),
                          style: TextStyle(
                            fontSize: 13.5,
                            fontFamily: MyFonts.montserratMedium,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                ],
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Obx(() {
              final isFavorite =
                  favoriteService.isFavorite(itemsModel!.itemsId!);
              return IconButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  shadowColor: WidgetStateProperty.all(MyColors.shadowColor),
                  elevation: WidgetStateProperty.all(3),
                  backgroundColor:
                      WidgetStateProperty.all(MyColors.textFieldBackground),
                  iconColor: WidgetStateProperty.all(MyColors.redColor),
                ),
                onPressed: () {
                  final favoriteController = Get.find<FavoriteController>();
                  if (isFavorite) {
                    favoriteController.removeFavorite(itemsModel!.itemsId!);
                  } else {
                    favoriteController.addFavorite(itemsModel!.itemsId!);
                  }
                },
                icon:
                    Icon(isFavorite ? Icons.favorite : Icons.favorite_outline),
              );
            }),
          ),
          // if (!isLoading && itemsModel != null)
          //   GetBuilder<FavoriteController>(
          //     builder: (favoriteController) => Positioned(
          //       top: 12,
          //       right: 12,
          //       child: IconButton(
          //         style: ButtonStyle(
          //           shape: WidgetStateProperty.all(
          //             RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(13),
          //             ),
          //           ),
          //           shadowColor:
          //               WidgetStateProperty.all(MyColors.shadowColor),
          //           elevation: WidgetStateProperty.all(3),
          //           backgroundColor:
          //               WidgetStateProperty.all(MyColors.textFieldBackground),
          //           iconColor: WidgetStateProperty.all(MyColors.redColor),
          //         ),
          //         onPressed: () {
          //           final id = itemsModel!.itemsId;
          //           if (favoriteController.isFavorite[id] == 1) {
          //             favoriteController.changeFavorite(id, 0);
          //             favoriteController.removeFavorite(id!);
          //           } else {
          //             favoriteController.changeFavorite(id, 1);
          //             favoriteController.addFavorite(id!);
          //           }
          //         },
          //         icon:
          //             favoriteController.isFavorite[itemsModel!.itemsId] == 1
          //                 ? const Icon(Icons.favorite)
          //                 : const Icon(Icons.favorite_outline),
          //       ),
          //     ),
          //   ),
          if (itemsModel!.itemsDiscount! > 0)
            Positioned(
              top: 12,
              left: 12,
              width: 45,
              child: Image.asset(MyImages.saleBadge),
            ),
        ],
      ),
    );
  }
}
