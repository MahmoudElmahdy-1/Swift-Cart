import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/core/localization/changelocalecontroller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/view/screen/account/contactus_sc.dart';
import 'package:ecommerceapp/view/screen/account/info_sc.dart';
import 'package:ecommerceapp/view/screen/account/notifications_sc.dart';
import 'package:ecommerceapp/view/screen/account/orders/chooseorders_sc.dart';
import 'package:ecommerceapp/view/screen/address/viewaddress_sc.dart';
import 'package:ecommerceapp/view/screen/auth/login_sc.dart';
import 'package:ecommerceapp/core/shared/animated_confirm_dialog.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  MyServices myservices = Get.find();

  logOut(context) {
    showCustomDialog(
      context: context,
      title: '199'.tr,
      message: '200'.tr,
      cancelButtonText: '201'.tr,
      confirmButtonText: '202'.tr,
      cancelButtonColor: MyColors.darkRedColor,
      cancelButtonTextColor: MyColors.whiteColor,
      confirmButtonColor: MyColors.greenColor,
      confirmButtonTextColor: MyColors.whiteColor,
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        String userid = myservices.sharedPreferences.getString("id")!;
        FirebaseMessaging.instance.unsubscribeFromTopic("users");
        FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
        myservices.sharedPreferences.clear();
        Get.offAll(() => const LogIn(), transition: Transition.upToDown);
      },
      isFlip: true,
    );
  }

  goToMyAccount() {
    Get.to(() => const MyAccount(), transition: Transition.downToUp);
  }

  goToOrders() {
    Get.to(() => const ChooseOrders(), transition: Transition.downToUp);
  }

  goToAddress() {
    Get.to(() => const ViewAddress(), transition: Transition.downToUp);
  }

  goToNotifications() {
    Get.to(() => const NotificationsPage(), transition: Transition.downToUp);
  }

  goToContactUs() {
    Get.to(() => const ContactUs(), transition: Transition.downToUp);
  }

  Widget changeLangOnPress() {
    final ChangeLocaleController localeController = Get.find();
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        value: localeController.language?.languageCode ?? 'en',
        onChanged: (String? newValue) {
          if (newValue != null) {
            localeController.changeLang(newValue);
          }
        },
        items: [
          DropdownMenuItem(
            value: 'en',
            child: Text(
              'English',
              style: TextStyle(
                fontFamily: MyFonts.montserratMedium,
                color: MyColors.blackColor,
              ),
            ),
          ),
          DropdownMenuItem(
            value: 'ar',
            child: Text(
              'العربية',
              style: TextStyle(
                fontFamily: MyFonts.cairoRegular,
                color: MyColors.blackColor,
              ),
            ),
          ),
        ],
        dropdownStyleData: DropdownStyleData(
          width: 134,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: MyColors.whiteColor,
          ),
          offset: const Offset(-20, -10),
          elevation: 2,
        ),
        customButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              localeController.language?.languageCode == 'ar'
                  ? 'العربية'
                  : 'English',
              style: TextStyle(
                fontFamily:
                    fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
                color: MyColors.blackColor,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(EvaIcons.arrowIosUpward),
          ],
        ),
      ),
    );
  }
}
