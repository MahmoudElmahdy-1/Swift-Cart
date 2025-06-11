import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';

class CustomeAuthButton extends StatelessWidget {
  const CustomeAuthButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 3,
        shadowColor: MyColors.shadowColor,
        fixedSize: const Size(1000, 46),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: MyColors.primaryColor,
        foregroundColor: MyColors.whiteColor,
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize(17, 16),
            fontFamily:
                fontFamily(MyFonts.cairoSemiBold, MyFonts.montserratBold)),
      ),
    );
  }
}
