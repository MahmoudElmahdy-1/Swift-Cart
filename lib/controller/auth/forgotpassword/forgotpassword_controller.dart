import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/shared/customsnackbarwithicon_fu.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/data/datasource/remote/forgotpassword/forgotpassword_data.dart';
import 'package:ecommerceapp/view/screen/auth/forgotpassword/verificationresetpassword_sc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgotPasswordController extends GetxController {
  goToVerification();
}

class ForgotPasswordControllerImp extends ForgotPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;

  ForgotPasswordData forgotPasswordData = ForgotPasswordData(Get.find<Crud>());

  @override
  goToVerification() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await forgotPasswordData.postdata(email.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.off(() => const VerificationResetPassword(),
              transition: Transition.rightToLeft,
              arguments: {"email": email.text});
        } else {
          customSnackBarWithIcon('65'.tr, 20 , 20 , '66'.tr , 15 , 15, SnackPosition.BOTTOM, MyColors.primaryColor); 
          statusRequest = StatusRequest.noDataFailure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
