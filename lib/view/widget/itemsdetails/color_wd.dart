import 'package:ecommerceapp/controller/itemsdetails_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsdetailsControllerImp itemsdetailsControllerImp = Get.find();

    return Column(
      children: [
        Row(
          spacing: 6,
          children: [
            Text(
              'Color :',
              style: TextStyle(
                color: MyColors.blackColor,
                fontSize: fontSize(24, 22),
                fontFamily:
                    fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'color name',
              style: TextStyle(
                color: MyColors.bodyColor,
                fontSize: fontSize(24, 22),
                fontFamily:
                    fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          spacing: 6,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              '-',
              style: TextStyle(fontSize: 30),
            ),
            ...List.generate(itemsdetailsControllerImp.items.length, (i) {
              return InkWell(
                onTap: () {},
                child: Container(
                    padding: const EdgeInsets.all(2),
                    height: itemsdetailsControllerImp.items[i]['active'] == "0"
                        ? 29
                        : 34,
                    width: itemsdetailsControllerImp.items[i]['active'] == "0"
                        ? 29
                        : 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      border: Border.all(color: MyColors.lightPrimaryColor),
                      color: MyColors.whiteColor,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55),
                        color: itemsdetailsControllerImp.items[i]['name'] ==
                                "red"
                            ? MyColors.redColor
                            : itemsdetailsControllerImp.items[i]['name'] ==
                                    "yellow"
                                ? MyColors.bodyColor
                                : itemsdetailsControllerImp.items[i]['name'] ==
                                        "green"
                                    ? MyColors.blackColor
                                    : null,
                      ),
                    )),
              );
            }),
            const Text(
              '-',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ],
    );
  }
}
