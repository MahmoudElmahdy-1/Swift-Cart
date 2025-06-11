import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';

class ChooseAddress extends StatelessWidget {
  const ChooseAddress({
    super.key,
    required this.name,
    required this.body,
    required this.onTap,
    required this.isActive,
  });
  final String name;
  final String body;
  final Function()? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
            color: isActive ? MyColors.primaryColor : null,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: isActive ? MyColors.whiteColor : MyColors.blackColor,
                fontSize: 17,
                fontFamily:
                    fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              body,
              maxLines: 3,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isActive ? MyColors.lightwhite : MyColors.bodyColor,
                fontSize: 16,
                fontFamily:
                    fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
