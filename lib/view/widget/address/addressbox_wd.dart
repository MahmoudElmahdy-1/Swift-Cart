import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/data/model/address_model.dart';
import 'package:flutter/material.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({
    super.key,
    required this.addressModel,
    required this.onDelete,
  });
  final AddressModel addressModel;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      // height: 130,
      decoration: BoxDecoration(
          // color: MyColors.whiteColor,
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
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "- ${addressModel.addressName!}",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: fontFamily(
                            MyFonts.cairoRegular, MyFonts.montserratMedium),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(
                              color: MyColors.primaryColor, width: 1),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(1.7, 1.7),
                              blurStyle: BlurStyle.outer,
                              color: MyColors.shadowColor,
                              blurRadius: 3,
                            ),
                          ]),
                      child: InkWell(
                        onTap: onDelete,
                        child: Icon(Icons.delete_outline,
                            color: MyColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                Text(
                  "- ${addressModel.addressCity!}",
                  maxLines: 2,
                  style: TextStyle(
                    color: MyColors.bodyColor,
                    fontSize: 17,
                    fontFamily: fontFamily(
                        MyFonts.cairoRegular, MyFonts.montserratMedium),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "- ${addressModel.addressStreet!}",
                  maxLines: 2,
                  style: TextStyle(
                    color: MyColors.bodyColor,
                    fontSize: 17,
                    fontFamily: fontFamily(
                        MyFonts.cairoRegular, MyFonts.montserratMedium),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "- ${addressModel.addressBuilding!}",
                  maxLines: 2,
                  style: TextStyle(
                    color: MyColors.bodyColor,
                    fontSize: 17,
                    fontFamily: fontFamily(
                        MyFonts.cairoRegular, MyFonts.montserratMedium),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "- ${addressModel.addressOptional!}",
                  maxLines: 3,
                  style: TextStyle(
                    color: MyColors.bodyColor,
                    fontSize: 17,
                    fontFamily: fontFamily(
                        MyFonts.cairoRegular, MyFonts.montserratMedium),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
