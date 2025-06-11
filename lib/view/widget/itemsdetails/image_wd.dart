import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/controller/itemsdetails_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsdetailsControllerImp itemsdetailsControllerImp = Get.find();

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 300,
          width: double.infinity,
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 45),
          decoration: BoxDecoration(
            color: MyColors.textFieldBackground,
          ),
          child: Hero(
            tag: "${itemsdetailsControllerImp.itemsModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${ApiLinks.imageItems}/${itemsdetailsControllerImp.itemsModel.itemsImage}",
            ),
          ),
        ),
        Container(
          height: 30,
          width: Get.width,
          decoration: BoxDecoration(
            color: MyColors.whiteColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          ),
        )
      ],
    );
  }
}
