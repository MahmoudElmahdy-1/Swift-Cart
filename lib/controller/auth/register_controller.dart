// ignore: unused_import
import 'dart:developer';
import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/register_data.dart';
import 'package:ecommerceapp/view/screen/auth/login_sc.dart';
import 'package:ecommerceapp/view/screen/auth/verificationregister_sc.dart';
import 'package:ecommerceapp/core/shared/customsnackbarwithicon_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RegisterController extends GetxController {
  signUp();
  goToLogin();
}

class RegisterControllerImp extends RegisterController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;

  bool isPasswordHidden = true;

  RegisterData registerData = RegisterData(Get.find<Crud>());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await registerData.postdata(
          username.text, email.text, phone.text, password.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          // log("registercontoller === $response") ;
          Get.to(() => const VerificationRegister(),
              transition: Transition.leftToRight,
              arguments: {"email": email.text});
        } else {
          customSnackBarWithIcon('59'.tr, 20 , 20 , '60'.tr , 15 , 15, SnackPosition.BOTTOM, MyColors.primaryColor);
          statusRequest = StatusRequest.noDataFailure;
        }
      }
      update();
    } else {}
  }

    showPassword() {
    isPasswordHidden = isPasswordHidden == true ? false : true;
    update();
  }


  @override
  goToLogin() {
    Get.offAll(() => const LogIn(), transition: Transition.upToDown);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
