import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key, required String text})
      : super(
          foregroundColor: MyColors.whiteColor,
          shadowColor: MyColors.shadowColor,
          backgroundColor: MyColors.primaryColor,
          elevation: 2,
          centerTitle: true,
          title: Text(
            text,
            style: TextStyle(
                fontFamily: fontFamily(
                    MyFonts.cairoSemiBold, MyFonts.montserratMedium)),
          ),
        );
}
