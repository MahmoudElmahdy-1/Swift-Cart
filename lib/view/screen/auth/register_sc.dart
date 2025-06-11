import 'package:ecommerceapp/controller/auth/register_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:ecommerceapp/core/functions/validinput_fu.dart';
import 'package:ecommerceapp/view/screen/auth/login_sc.dart';
import 'package:ecommerceapp/view/widget/auth/headlineauth_wd.dart';
import 'package:ecommerceapp/core/shared/custombuttonauth_wd.dart';
import 'package:ecommerceapp/core/shared/customeformfield_wd.dart';
import 'package:ecommerceapp/view/widget/auth/passwordcustomformfield_wd.dart';
import 'package:ecommerceapp/view/widget/auth/questionauth_wd.dart';
import 'package:ecommerceapp/core/shared/mainlogo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterControllerImp registerControllerImp =
        Get.find<RegisterControllerImp>();
    return Scaffold(
        body: PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.off(() => const LogIn(), transition: Transition.upToDown);
      },
      child: SafeArea(
        child: Form(
          key: registerControllerImp.formstate,
          child: Stack(
            children: [
              Opacity(
                  opacity: 0.2,
                  child: Image.asset(MyImages.registerBackground)),
              GetBuilder<RegisterControllerImp>(
                  builder: (registerControllerImp) =>
                      HandlingStatusViewWithHand(
                        statusRequest: registerControllerImp.statusRequest,
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
                                      headline: '20'.tr,
                                      description: '21'.tr,
                                    ),
                                    const SizedBox(height: 35),
                                    CustomeFormField(
                                      hintText: '22'.tr,
                                      icon: Icons.person_3_outlined,
                                      textController:
                                          registerControllerImp.username,
                                      type: TextInputType.text,
                                      valid: (val) {
                                        return validInput(
                                            val!, 1, 30, "username");
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    CustomeFormField(
                                      hintText: '23'.tr,
                                      icon: Icons.email_outlined,
                                      textController:
                                          registerControllerImp.email,
                                      type: TextInputType.emailAddress,
                                      valid: (val) {
                                        return validInput(
                                            val!, 5, 100, "email");
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    CustomeFormField(
                                      hintText: '24'.tr,
                                      icon: Icons.phone_outlined,
                                      textController:
                                          registerControllerImp.phone,
                                      type: const TextInputType
                                          .numberWithOptions(),
                                      valid: (val) {
                                        return validInput(
                                            val!, 9, 15, "number");
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    PasswordCustomeFormField(
                                      hintText: '15'.tr,
                                      icon: Icons.lock_outline,
                                      textController:
                                          registerControllerImp.password,
                                      obscureText: registerControllerImp
                                          .isPasswordHidden,
                                      type: TextInputType.text,
                                      onTapIcon:
                                          registerControllerImp.showPassword,
                                      valid: (val) {
                                        return validInput(
                                            val!, 8, 30, "password");
                                      },
                                    ),
                                    // CustomeFormField(
                                    //   hintText: '25'.tr,
                                    //   icon: Icons.lock_outline,
                                    //   textController:
                                    //       registerControllerImp.password,
                                    //   type: TextInputType.text,
                                    //   valid: (val) {
                                    //     return validInput(
                                    //         val!, 8, 30, "password");
                                    //   },
                                    // ),
                                    const SizedBox(height: 25),
                                    CustomeAuthButton(
                                      text: '26'.tr,
                                      onPressed: () {
                                        registerControllerImp.signUp();
                                      },
                                    ),
                                    const SizedBox(height: 15),
                                    QuestionAuth(
                                        question: '27'.tr,
                                        action: '28'.tr,
                                        ontap: () {
                                          registerControllerImp.goToLogin();
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
            ],
          ),
        ),
      ),
    ));
  }
}
