import 'package:ecommerceapp/controller/itemsdetails_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameInItemDetails extends StatelessWidget {
  const NameInItemDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ItemsdetailsControllerImp itemsdetailsControllerImp = Get.find();
    return Text(
      translateDatabase(
        itemsdetailsControllerImp.itemsModel.itemsNameAr!,
        itemsdetailsControllerImp.itemsModel.itemsNameEn!,
      ),
      style: TextStyle(
        color: MyColors.blackColor,
        fontSize: fontSize(24, 22),
        fontFamily: fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
