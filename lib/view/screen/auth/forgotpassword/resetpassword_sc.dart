import 'package:ecommerceapp/controller/auth/forgotpassword/resetpassword_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:ecommerceapp/core/functions/validinput_fu.dart';
import 'package:ecommerceapp/view/widget/auth/headlineauth_wd.dart';
import 'package:ecommerceapp/core/shared/custombuttonauth_wd.dart';
import 'package:ecommerceapp/core/functions/alertbackbutton/alertgotologin_fu.dart';
import 'package:ecommerceapp/view/widget/auth/passwordcustomformfield_wd.dart';
import 'package:ecommerceapp/core/shared/mainlogo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp resetPasswordControllerImp =
        Get.find<ResetPasswordControllerImp>();

    return Scaffold(
        body: PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        showDialog(
          context: context,
          builder: (context) {
            return alertGoToLogin();
          },
        ).then(
          (value) {
            if (value ?? false) {
              Get.back();
            }
          },
        );
      },
      child: SafeArea(
        child: Form(
          key: resetPasswordControllerImp.formstate,
          child: Stack(
            children: [
              Opacity(
                  opacity: 0.2,
                  child: Image.asset(MyImages.languagePageBackground)),
              GetBuilder<ResetPasswordControllerImp>(
                builder: (resetPasswordControllerImp) => HandlingStatusViewWithHand(
                  statusRequest: resetPasswordControllerImp.statusRequest,
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
                                    headline: '35'.tr,
                                    description: '36'.tr,
                                  ),
                                  const SizedBox(height: 35),
                                  PasswordCustomeFormField(
                                    hintText: '37'.tr,
                                    icon: Icons.lock_outline,
                                    textController:
                                        resetPasswordControllerImp.password,
                                    obscureText: resetPasswordControllerImp
                                        .isPasswordHidden,
                                    type: TextInputType.text,
                                    onTapIcon:
                                        resetPasswordControllerImp.showPassword,
                                    valid: (val) {
                                      return validInput(
                                          val!, 8, 30, "password");
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  PasswordCustomeFormField(
                                    hintText: '38'.tr,
                                    icon: Icons.lock_outline,
                                    textController: resetPasswordControllerImp
                                        .confirmPassword,
                                    obscureText: resetPasswordControllerImp
                                        .isPasswordHidden,
                                    type: TextInputType.text,
                                    onTapIcon:
                                        resetPasswordControllerImp.showPassword,
                                    valid: (val) {
                                      return validInput(
                                          val!, 8, 30, "confirmpassword");
                                    },
                                  ),
                                  const SizedBox(height: 40),
                                  CustomeAuthButton(
                                    onPressed: () {
                                      resetPasswordControllerImp
                                          .goToSuccessResetPassword();
                                    },
                                    text: '39'.tr,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
