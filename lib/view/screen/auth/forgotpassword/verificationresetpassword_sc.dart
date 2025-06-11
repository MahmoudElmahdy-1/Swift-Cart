import 'package:ecommerceapp/controller/auth/forgotpassword/verificationresetpassword_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/view/widget/auth/headlineauth_wd.dart';
import 'package:ecommerceapp/view/widget/auth/otpauthresetpassword_wd.dart';
import 'package:ecommerceapp/view/widget/auth/otpresendtimer.dart';
import 'package:ecommerceapp/core/shared/mainlogo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationResetPassword extends StatelessWidget {
  const VerificationResetPassword({super.key, this.onCompleted});
  final Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    OtpTimerButtonController otpcontroller = OtpTimerButtonController();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: MyColors.primaryColor,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Opacity(
                opacity: 0.2,
                child: Image.asset(MyImages.languagePageBackground)),
            GetBuilder<VerificationResetPasswordControllerImp>(
              builder: (verificationResetPasswordControllerImp) =>
                  HandlingStatusViewWithHand(
                statusRequest:
                    verificationResetPasswordControllerImp.statusRequest,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Center(
                    child: ListView(
                      children: [
                        const MainLogo(),
                        ListView(
                          shrinkWrap: true,
                          children: [
                            HeadLineAuth(
                              headline: '33'.tr,
                              description: '34'.tr,
                            ),
                            const SizedBox(height: 40),
                            OTPAuthResetPassword(
                                controller:
                                    verificationResetPasswordControllerImp
                                        .verifycode),
                          ],
                        ),
                        const SizedBox(height: 35),
                        Center(
                          child: OtpTimerButton(
                            controller: otpcontroller,
                            onPressed: () {
                              verificationResetPasswordControllerImp
                                  .reSendCode();
                            },
                            text: Text('34.1'.tr,
                                style: TextStyle(
                                    color: MyColors.bodyColor,
                                    fontSize: fontSize(15, 15),
                                    fontFamily: fontFamily(MyFonts.cairoRegular,
                                        MyFonts.montserratMedium))),
                            duration: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
