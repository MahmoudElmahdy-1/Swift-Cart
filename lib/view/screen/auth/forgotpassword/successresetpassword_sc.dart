import 'package:ecommerceapp/controller/auth/forgotpassword/successresetpassword_controller.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/core/shared/custombuttonauth_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp successResetPasswordControllerImp =
        Get.find<SuccessResetPasswordControllerImp>();

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Opacity(opacity: 0.2, child: Image.asset(MyImages.signInBackground)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                const SizedBox(height: 150),
                const Icon(Icons.check_circle, color: Colors.green, size: 180),
                const SizedBox(height: 20),
                Text(
                  '40'.tr,
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
                    successResetPasswordControllerImp.goToLogin();
                  },
                  text: '41'.tr,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
