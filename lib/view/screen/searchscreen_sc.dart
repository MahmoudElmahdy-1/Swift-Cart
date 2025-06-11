import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:ecommerceapp/view/widget/items/priceline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.listItemsInSearch});
  final List<ItemsModel> listItemsInSearch;

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp = Get.find();
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listItemsInSearch.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              homePageControllerImp.goToItemDetails(listItemsInSearch[i]);
            },
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  // height: 110,
                  decoration: BoxDecoration(
                      color: MyColors.whiteColor,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: MyColors.shadowColor,
                          blurRadius: 2,
                        ),
                      ]),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          color: MyColors.textFieldBackground,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${ApiLinks.imageItems}/${listItemsInSearch[i].itemsImage}",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              translateDatabase(
                                  "${listItemsInSearch[i].itemsNameAr}",
                                  "${listItemsInSearch[i].itemsNameEn}"),
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: MyFonts.montserratMedium,
                              ),
                            ),
                            Text(
                              translateDatabase(
                                  "(${listItemsInSearch[i].categoriesNameAr})",
                                  "(${listItemsInSearch[i].categoriesNameEn})"),
                              style: TextStyle(
                                color: MyColors.bodyColor,
                                fontSize: 15,
                                fontFamily: MyFonts.montserratMedium,
                              ),
                            ),
                            Row(
                              children: [
                                listItemsInSearch[i].itemsDiscount! > 0
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Opacity(
                                            opacity: 0.6,
                                            child: Stack(
                                              children: [
                                                Text(
                                                  NumberFormat.currency(
                                                          decimalDigits: 2,
                                                          symbol: '\$')
                                                      .format(double.parse(
                                                          listItemsInSearch[i]
                                                              .itemsPrice!)),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: MyFonts
                                                        .montserratMedium,
                                                    // fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Positioned.fill(
                                                  child: CustomPaint(
                                                    size: const Size(70, 20),
                                                    painter:
                                                        DiagonalLinePainter(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            NumberFormat.currency(
                                                    decimalDigits: 2,
                                                    symbol: '\$')
                                                .format(double.parse(
                                                    listItemsInSearch[i]
                                                        .priceafterdiscount!)),
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontFamily:
                                                  MyFonts.montserratMedium,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        NumberFormat.currency(
                                                decimalDigits: 2, symbol: '\$')
                                            .format(double.parse(
                                                listItemsInSearch[i]
                                                    .priceafterdiscount!)),
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: MyFonts.montserratMedium,
                                        ),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (listItemsInSearch[i].itemsDiscount! > 0)
                  Positioned(
                    top: 10,
                    left: 5,
                    width: 30,
                    child: Image.asset(MyImages.saleBadge),
                  ),
              ],
            ),
          );
        });
  }
}
