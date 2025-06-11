import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ItemsCountWidget extends StatelessWidget {
  const ItemsCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(6),
      height: 35,
      decoration: BoxDecoration(
        color: MyColors.textFieldBackground,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Text.rich(
        TextSpan(children: [
          TextSpan(text: '${'91'.tr} '),
          TextSpan(
              text: '${cartController.totlaItemsCount} ',
              style: TextStyle(
                color: MyColors.primaryColor,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(text: '92'.tr),
        ]),
        // "${'91'.tr} ${cartController.totlaItemsCount} ${'92'.tr}",
        style: TextStyle(
          fontSize: 17,
          fontFamily:
              fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
        ),
      ),
    );
  }
}
