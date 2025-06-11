
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class MyTitle extends StatelessWidget {
  const MyTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          color: MyColors.bodyColor,
          fontSize: fontSize(24, 22),
          fontFamily:
              fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
