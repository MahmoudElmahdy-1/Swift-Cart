import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:ecommerceapp/core/shared/mainlogo.dart';
import 'package:ecommerceapp/view/screen/account/orders/completedorders_sc.dart';
import 'package:ecommerceapp/view/screen/account/orders/pendingorders_sc.dart';
import 'package:ecommerceapp/core/shared/customappbar_wd.dart';
import 'package:ecommerceapp/view/widget/language/customelanguagebutton_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseOrders extends StatelessWidget {
  const ChooseOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: '160'.tr),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(MyImages.languagePageBackground),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  const MainLogo(),
                  const SizedBox(height: 15),
                  CustomeLanguageButton(
                      text: "161".tr,
                      onPressed: () {
                        Get.to(() => const PendingOrders(),
                            transition: Transition.downToUp);
                      }),
                  const SizedBox(height: 15),
                  CustomeLanguageButton(
                      text: "162".tr,
                      onPressed: () {
                        Get.to(() => const CompletedOrders(),
                            transition: Transition.downToUp);
                      }),
                  const Spacer(flex: 7),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
