import 'package:ecommerceapp/controller/auth/successregister_controller.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/view/screen/auth/login_sc.dart';
import 'package:ecommerceapp/core/shared/custombuttonauth_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessRegister extends StatelessWidget {
  const SuccessRegister({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessRegisterControllerImp successRegisterControllerImp =
        Get.find<SuccessRegisterControllerImp>();

    return Scaffold(
        body: PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.offAll(const LogIn(), transition: Transition.upToDown);
      },
      child: SafeArea(
          child: Stack(
        children: [
          Opacity(
              opacity: 0.2, child: Image.asset(MyImages.registerBackground)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                const SizedBox(height: 150),
                const Icon(Icons.check_circle, color: Colors.green, size: 180),
                const SizedBox(height: 20),
                Text(
                  '42'.tr,
                  style: TextStyle(
                    fontSize: fontSize(18, 18),
                    fontFamily: fontFamily(
                        MyFonts.cairoSemiBold, MyFonts.montserratMedium),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 120),
                CustomeAuthButton(
                  onPressed: () {
                    successRegisterControllerImp.goToLogin();
                  },
                  text: '43'.tr,
                )
              ],
            ),
          ),
        ],
      )),
    ));
  }
}
