import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/data/model/favorites_model.dart';
import 'package:ecommerceapp/view/widget/items/priceline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FavoriteItemsWidget extends StatelessWidget {
  const FavoriteItemsWidget({super.key, required this.favoritesModel});
  final FavoritesModel? favoritesModel;

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.find();
    return InkWell(
      onTap: () {
        favoriteController.goToItemDetails(favoritesModel!);
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
                      tag: "${favoritesModel!.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl:
                            "${ApiLinks.imageItems}/${favoritesModel!.itemsImage}",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    translateDatabase("${favoritesModel!.itemsNameAr}",
                        "${favoritesModel!.itemsNameEn}"),
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
                  favoritesModel!.itemsDiscount! > 0
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
                                            favoritesModel!.itemsPrice!)),
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
                                      favoritesModel!.priceAfterDiscount!)),
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
                                  favoritesModel!.priceAfterDiscount!)),
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
          if (favoritesModel != null)
            GetBuilder<FavoriteController>(
              builder: (favoriteController) => Positioned(
                top: 12,
                right: 12,
                child: IconButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      shadowColor:
                          WidgetStateProperty.all(MyColors.shadowColor),
                      elevation: WidgetStateProperty.all(3),
                      backgroundColor:
                          WidgetStateProperty.all(MyColors.textFieldBackground),
                      iconColor: WidgetStateProperty.all(MyColors.redColor),
                    ),
                    onPressed: () {
                      favoriteController
                          .removeFavorite(favoritesModel!.itemsId!);
                    },
                    icon: const Icon(Icons.favorite)),
              ),
            ),
          if (favoritesModel!.itemsDiscount! > 0)
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
