import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, top: 10),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            // border: Border.all(color: MyColors.primaryColor, width: 1),
            boxShadow: [
              BoxShadow(
                // offset: const Offset(4, 4),
                // blurStyle: BlurStyle.outer,
                color: MyColors.lightPrimaryColor2,
                blurRadius: 8,
              ),
            ]),
        child: Text(
          text,
          style: TextStyle(
            color: MyColors.whiteColor,
            fontSize: fontSize(18, 16),
            fontFamily:
                fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
          ),
        ),
      ),
    );
  }
}
