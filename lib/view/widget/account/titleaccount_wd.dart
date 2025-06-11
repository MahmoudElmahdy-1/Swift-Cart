import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';

class TitleAccount extends StatelessWidget {
  const TitleAccount(
      {super.key,
      required this.onTap,
      required this.title,
      required this.icon,
      required this.widget});
  final void Function()? onTap;
  final String title;
  final IconData icon;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: MyColors.whiteColor,
          borderRadius: BorderRadius.circular(13),
        ),
        height: 60,
        width: double.infinity,
        child: ListTile(
          iconColor: MyColors.blackColor,
          textColor: MyColors.blackColor,
          leading: Icon(icon),
          title: Text(title,
              style: TextStyle(
                fontSize: fontSize(17, 16),
                fontFamily:
                    fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
              )),
          trailing: widget,
        ),
      ),
    );
  }
}
