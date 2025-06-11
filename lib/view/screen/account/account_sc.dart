import 'package:ecommerceapp/controller/account/account_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:ecommerceapp/core/localization/changelocalecontroller.dart';
import 'package:ecommerceapp/view/widget/account/titleaccount_wd.dart';
// ignore: unused_import
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController accountController = Get.find();
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 210 + MediaQuery.of(context).padding.top,
                  width: double.infinity,
                  color: MyColors.whiteColor,
                  child: Image.asset(
                    MyImages.accountBackgound,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -1,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(28)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -36,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: MyColors.primaryColor, width: 6),
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: MyColors.whiteColor,
                      child: ClipOval(
                        child: Padding(
                          padding:
                              const EdgeInsets.all(8.0), // Adjust as needed
                          child: Image.asset(
                            MyImages.mainLogo,
                            width: 65,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  TitleAccount(
                      onTap: () {
                        accountController.goToMyAccount();
                      },
                      title: "189".tr,
                      icon: Icons.person_2_outlined,
                      widget: const Icon(EvaIcons.arrowIosUpward)),
                  TitleAccount(
                      onTap: () {
                        accountController.goToOrders();
                      },
                      title: "190".tr,
                      icon: MdiIcons.bookOpenOutline,
                      widget: const Icon(EvaIcons.arrowIosUpward)),
                  TitleAccount(
                      onTap: () {
                        accountController.goToAddress();
                      },
                      title: "191".tr,
                      icon: MdiIcons.notebookOutline,
                      widget: const Icon(EvaIcons.arrowIosUpward)),
                  TitleAccount(
                    onTap: () {
                      accountController.goToNotifications();
                    },
                    title: "192".tr,
                    icon: Icons.notifications_active_outlined,
                    widget: const Icon(EvaIcons.arrowIosUpward),
                  ),
                  GetBuilder<ChangeLocaleController>(
                    builder: (changeLocaleController) => TitleAccount(
                      onTap: null,
                      title: "193".tr,
                      icon: Icons.language_outlined,
                      widget: accountController.changeLangOnPress(),
                    ),
                  ),
                  TitleAccount(
                      onTap: () {
                        accountController.goToContactUs();
                      },
                      title: "194".tr,
                      icon: Icons.email_outlined,
                      widget: const Icon(EvaIcons.arrowIosUpward)),
                  TitleAccount(
                      onTap: () {
                        accountController.logOut(context);
                      },
                      title: "195".tr,
                      icon: Icons.logout_outlined,
                      widget: const Icon(EvaIcons.arrowIosUpward)),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
