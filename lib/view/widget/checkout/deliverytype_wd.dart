import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';

class DeliveryType extends StatelessWidget {
  const DeliveryType({
    super.key,
    required this.title,
    required this.onTap,
    required this.myImage,
    required this.isActive,
  });
  final String title;
  final Function()? onTap;
  final String myImage;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 140,
          // padding: EdgeInsets.symmetric(
          //     vertical: 10, horizontal: 12),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 110,
                child: Image.asset(
                  myImage,
                  color: isActive ? MyColors.whiteColor : MyColors.blackColor,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  color: isActive ? MyColors.whiteColor : MyColors.blackColor,
                  fontSize: fontSize(16, 15),
                  fontFamily: fontFamily(
                      MyFonts.cairoRegular, MyFonts.montserratMedium),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
