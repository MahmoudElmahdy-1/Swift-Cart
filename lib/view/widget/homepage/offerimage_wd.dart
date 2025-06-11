import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OfferImage extends StatelessWidget {
  const OfferImage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp = Get.find();
    bool isLoading =
        homePageControllerImp.statusRequest == StatusRequest.loading;
    return Skeletonizer(
      enabled: isLoading,
      child: SizedBox(
        height: 183,
        width: double.infinity,
        child: Card(
          color: MyColors.textFieldBackground,
          elevation: 4,
          clipBehavior: Clip.hardEdge,
          child: isLoading
              ? Container(
                  color: MyColors.textFieldBackground,
                  height: 180,
                  width: 300,
                )
              : CachedNetworkImage(
                  imageUrl: translateDatabase(
                      "${ApiLinks.imageOffers}/cashbackar.png",
                      "${ApiLinks.imageOffers}/cashbacken.png"),
                  fit: BoxFit.cover),
        ),
      ),
    );
  }
}
