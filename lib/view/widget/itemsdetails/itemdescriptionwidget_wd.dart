import 'package:ecommerceapp/controller/itemsdetails_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionInItemDetails extends StatelessWidget {
  const DescriptionInItemDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ItemsdetailsControllerImp itemsdetailsControllerImp = Get.find();
    return Text(
      translateDatabase(
        itemsdetailsControllerImp.itemsModel.itemsDescriptionAr!,
        itemsdetailsControllerImp.itemsModel.itemsDescriptionEn!,
      ),
      style: TextStyle(
        color: MyColors.bodyColor,
        fontSize: fontSize(20, 18),
        fontFamily: fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
      ),
    );
  }
}
