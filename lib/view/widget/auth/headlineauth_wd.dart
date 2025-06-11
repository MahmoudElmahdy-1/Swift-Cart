import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';

class HeadLineAuth extends StatelessWidget {
  const HeadLineAuth(
      {super.key, required this.headline, required this.description});

  final String headline;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headline,
            style: TextStyle(
              fontSize: fontSize(37, 37),
              fontFamily:
                  fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
              fontWeight: FontWeight.bold,
              color: MyColors.primaryColor,
            )),
        const SizedBox(height: 10),
        Text(description,
            style: TextStyle(
              fontSize: fontSize(16, 16),
              color: MyColors.bodyColor,
              fontFamily:
                  fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }
}
