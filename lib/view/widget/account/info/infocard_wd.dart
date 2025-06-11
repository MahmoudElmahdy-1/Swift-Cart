import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
          color: null,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: MyColors.primaryColor, width: 1),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 4),
              blurStyle: BlurStyle.outer,
              color: MyColors.shadowColor,
              blurRadius: 8,
            ),
          ]),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: MyColors.blackColor,
          fontSize: 16,
          fontFamily:
              fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
        ),
      ),
    );
  }
}
