import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';

class QuestionAuth extends StatelessWidget {
  const QuestionAuth(
      {super.key,
      required this.question,
      required this.action,
      required this.ontap});
  final String question;
  final String action;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question,
            style: TextStyle(
                fontFamily:
                    fontFamily(MyFonts.cairoSemiBold, MyFonts.montserratMedium),
                color: MyColors.bodyColor)),
        const SizedBox(width: 5),
        InkWell(
          onTap: ontap,
          child: Text(
            action,
            style: TextStyle(
                fontFamily:
                    fontFamily(MyFonts.cairoBold, MyFonts.montserratBold),
                color: MyColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
