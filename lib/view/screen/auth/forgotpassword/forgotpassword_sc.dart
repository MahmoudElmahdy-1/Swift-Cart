import 'package:ecommerceapp/controller/auth/forgotpassword/forgotpassword_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:ecommerceapp/core/functions/validinput_fu.dart';
import 'package:ecommerceapp/view/widget/auth/headlineauth_wd.dart';
import 'package:ecommerceapp/core/shared/custombuttonauth_wd.dart';
import 'package:ecommerceapp/core/shared/customeformfield_wd.dart';
import 'package:ecommerceapp/core/shared/mainlogo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordControllerImp forgotPasswordControllerImp =
        Get.find<ForgotPasswordControllerImp>();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: MyColors.primaryColor,
      ),
      body: SafeArea(
        child: Form(
          key: forgotPasswordControllerImp.formstate,
          child: Stack(
            children: [
              Opacity(
                  opacity: 0.2,
                  child: Image.asset(MyImages.languagePageBackground)),
              GetBuilder<ForgotPasswordControllerImp>(
                builder: (forgotPasswordControllerImp) =>
                    HandlingStatusViewWithHand(
                  statusRequest: forgotPasswordControllerImp.statusRequest,
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
                                headline: '29'.tr,
                                description: '30'.tr,
                              ),
                              const SizedBox(height: 35),
                              CustomeFormField(
                                hintText: '31'.tr,
                                icon: Icons.email_outlined,
                                textController:
                                    forgotPasswordControllerImp.email,
                                type: TextInputType.emailAddress,
                                valid: (val) {
                                  return validInput(val!, 5, 100, "email");
                                },
                              ),
                              const SizedBox(height: 40),
                              CustomeAuthButton(
                                onPressed: () {
                                  forgotPasswordControllerImp
                                      .goToVerification();
                                },
                                text: '32'.tr,
                              ),
                            ],
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
      ),
    );
  }
}
