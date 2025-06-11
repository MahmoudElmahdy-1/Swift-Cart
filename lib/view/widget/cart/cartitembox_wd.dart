import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:flutter/material.dart';

class CartItemBox extends StatelessWidget {
  const CartItemBox(
      {super.key,
      required this.name,
      required this.price,
      required this.itemscount,
      required this.imagename,
      required this.onTapRemove,
      required this.onTapAdd,
      required this.onTapDelete});
  final String name;
  final String price;
  final String itemscount;
  final String imagename;
  final void Function()? onTapRemove;
  final void Function()? onTapAdd;
  final void Function()? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      height: 130,
      decoration: BoxDecoration(
          color: MyColors.whiteColor,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: MyColors.shadowColor,
              blurRadius: 10,
            ),
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              color: MyColors.textFieldBackground,
              borderRadius: BorderRadius.circular(13),
            ),
            child: CachedNetworkImage(
              imageUrl: "${ApiLinks.imageItems}/$imagename",
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              // width: 150, //original 186
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: MyFonts.montserratMedium,
                    ),
                  ),
                  Text(
                    '$price\$',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: MyFonts.montserratMedium,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: onTapDelete,
                child: Icon(Icons.delete_outline, color: MyColors.primaryColor),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: MyColors.textFieldBackground,
                ),
                width: 85,
                height: 33,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: onTapRemove,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: MyColors.shadowColor,
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                          color: MyColors.whiteColor,
                        ),
                        width: 22,
                        height: 22,
                        child: const Icon(Icons.remove, size: 16),
                      ),
                    ),
                    Text(itemscount,
                        style: TextStyle(
                            fontSize: 16,
                            color: MyColors.blackColor,
                            fontFamily: MyFonts.montserratMedium)),
                    InkWell(
                      onTap: onTapAdd,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: MyColors.shadowColor,
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                          color: MyColors.whiteColor,
                        ),
                        width: 22,
                        height: 22,
                        child: const Icon(Icons.add, size: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
