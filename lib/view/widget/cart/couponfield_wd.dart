import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({
    super.key,
    required this.myController,
    required this.onApplyTap,
  });

  final TextEditingController myController;
  final void Function()? onApplyTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextFormField(
              controller: myController,
              decoration: InputDecoration(
                fillColor: MyColors.textFieldBackground,
                filled: true,
                hintText: "121".tr,
                hintStyle: TextStyle(
                  fontSize: fontSize(14, 14),
                  fontFamily: fontFamily(
                      MyFonts.cairoRegular, MyFonts.montserratMedium),
                  fontWeight: FontWeight.bold,
                  color: MyColors.primaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: BorderSide(
                    color: MyColors.primaryColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: BorderSide(
                    color: MyColors.primaryColor,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                  color: MyColors.shadowColor,
                  blurRadius: 1,
                  blurStyle: BlurStyle.outer,
                  // ignore: prefer_const_constructors
                  offset: Offset(2, 2))
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: MaterialButton(
              color: MyColors.primaryColor,
              onPressed: onApplyTap,
              child: Text('122'.tr,
                  style: TextStyle(
                      color: MyColors.whiteColor,
                      fontSize: 14,
                      fontFamily: fontFamily(
                          MyFonts.cairoBold, MyFonts.montserratBold)))),
        ),
      ],
    );
  }
}
