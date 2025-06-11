import 'dart:io';
import 'package:ecommerceapp/controller/auth/login_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:ecommerceapp/core/functions/validinput_fu.dart';
import 'package:ecommerceapp/core/shared/animated_confirm_dialog.dart';
import 'package:ecommerceapp/view/widget/auth/headlineauth_wd.dart';
import 'package:ecommerceapp/core/shared/custombuttonauth_wd.dart';
import 'package:ecommerceapp/core/shared/customeformfield_wd.dart';
import 'package:ecommerceapp/view/widget/auth/passwordcustomformfield_wd.dart';
import 'package:ecommerceapp/view/widget/auth/questionauth_wd.dart';
import 'package:ecommerceapp/core/shared/mainlogo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              // showDialog(
              //   context: context,
              //   builder: (context) {
              //     return alertExitApp();
              //   },
              // ).then(
              //   (value) {
              //     if (value ?? false) {
              //       Get.back();
              //     }
              //   },
              // );
              showCustomDialog(
                  context: context,
                  title: '49'.tr,
                  message: '50'.tr,
                  cancelButtonText: '51'.tr,
                  confirmButtonText: '52'.tr,
                  cancelButtonColor: MyColors.darkRedColor,
                  cancelButtonTextColor: MyColors.whiteColor,
                  confirmButtonColor: MyColors.greenColor,
                  confirmButtonTextColor: MyColors.whiteColor,
                  onCancel: () {
                    Get.back();
                  },
                  onConfirm: () {
                    exit(0);
                  },
                  isFlip: true,
                );
            },
            child: SafeArea(
                child: GetBuilder<LoginControllerImp>(
                    builder: (loginControllerImp) => HandlingStatusViewWithHand(
                          statusRequest: loginControllerImp.statusRequest,
                          child: Form(
                            key: loginControllerImp.formstate,
                            child: Stack(
                              children: [
                                Opacity(
                                    opacity: 0.2,
                                    child:
                                        Image.asset(MyImages.signInBackground)),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Center(
                                    child: ListView(
                                      children: [
                                        const MainLogo(),
                                        ListView(
                                          shrinkWrap: true,
                                          children: [
                                            HeadLineAuth(
                                                headline: '12'.tr,
                                                description: '13'.tr),
                                            const SizedBox(height: 35),
                                            CustomeFormField(
                                              hintText: '14'.tr,
                                              icon: Icons.email_outlined,
                                              textController:
                                                  loginControllerImp.email,
                                              type: TextInputType.emailAddress,
                                              valid: (val) {
                                                return validInput(
                                                    val!, 5, 100, "email");
                                              },
                                            ),
                                            const SizedBox(height: 20),
                                            PasswordCustomeFormField(
                                              hintText: '15'.tr,
                                              icon: Icons.lock_outline,
                                              textController:
                                                  loginControllerImp.password,
                                              obscureText: loginControllerImp
                                                  .isPasswordHidden,
                                              type: TextInputType.text,
                                              onTapIcon: loginControllerImp
                                                  .showPassword,
                                              valid: (val) {
                                                return validInput(
                                                    val!, 8, 30, "password");
                                              },
                                            ),
                                            Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: TextButton(
                                                  onPressed: () {
                                                    loginControllerImp
                                                        .goToForgotPassword();
                                                  },
                                                  child: Text('16'.tr,
                                                      style: TextStyle(
                                                          fontFamily: fontFamily(
                                                              MyFonts
                                                                  .cairoRegular,
                                                              MyFonts
                                                                  .montserratMedium),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: MyColors
                                                              .textFieldFourground)),
                                                )),
                                            const SizedBox(height: 40),
                                            CustomeAuthButton(
                                              text: '17'.tr,
                                              onPressed: () {
                                                loginControllerImp.logIn();
                                              },
                                            ),
                                            const SizedBox(height: 15),
                                            QuestionAuth(
                                              question: '18'.tr,
                                              action: '19'.tr,
                                              ontap: () {
                                                loginControllerImp
                                                    .goToRegister();
                                              },
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )))));
  }
}
