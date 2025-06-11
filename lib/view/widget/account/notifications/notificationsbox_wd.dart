import 'package:ecommerceapp/controller/account/notifications_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/data/model/notifications_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsBox extends StatelessWidget {
  const NotificationsBox({
    super.key,
    required this.notificationsModel,
  });
  final NotificationsModel notificationsModel;

  @override
  Widget build(BuildContext context) {
    NotificationsController notificationsController = Get.find();
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
                Text(
                  "${notificationsModel.notificationsTitle}",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: fontFamily(
                        MyFonts.cairoRegular, MyFonts.montserratMedium),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "${notificationsModel.notificationsBody}",
                  style: TextStyle(
                    color: MyColors.bodyColor,
                    fontSize: 15,
                    fontFamily: fontFamily(
                        MyFonts.cairoRegular, MyFonts.montserratMedium),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  notificationsController.getNotificationsTime(
                      notificationsModel.notificationsDatetime!),
                  style: TextStyle(
                    color: MyColors.primaryColor,
                    fontSize: 13,
                    fontFamily: fontFamily(
                        MyFonts.cairoRegular, MyFonts.montserratMedium),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
