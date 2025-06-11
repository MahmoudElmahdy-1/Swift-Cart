import 'package:ecommerceapp/controller/auth/verificationregister_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OTPAuthRegister extends StatelessWidget {
  OTPAuthRegister({super.key, required this.controller});
  final TextEditingController controller;

  final VerificationRegisterControllerImp verificationRegisterControllerImp =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return Pinput(
        controller: controller,
        length: 5,
        showCursor: true,
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        defaultPinTheme: PinTheme(
          width: 59,
          height: 59,
          textStyle: TextStyle(
              fontSize: 20,
              color: MyColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: MyFonts.montserratMedium),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: MyColors.textFieldBackground,
          ),
        ),
        onCompleted: (value) {
          verificationRegisterControllerImp.goToSuccessRegister();
        });
  }
}
