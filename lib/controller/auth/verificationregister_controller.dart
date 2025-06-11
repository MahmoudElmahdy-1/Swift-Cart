import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/verificationregister_data.dart';
import 'package:ecommerceapp/view/screen/auth/successregister_sc.dart';
import 'package:ecommerceapp/core/shared/customsnackbarwithicon_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerificationRegisterController extends GetxController {
  goToSuccessRegister();
  reSendCode();
}

class VerificationRegisterControllerImp extends VerificationRegisterController {
  late TextEditingController verifycode;
  String? email;
  StatusRequest statusRequest = StatusRequest.none;

  VerificationRegisterData verificationRegisterData =
      VerificationRegisterData(Get.find<Crud>());

  @override
  goToSuccessRegister() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verificationRegisterData.postdata(email!, verifycode.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offAll(() => const SuccessRegister(), transition: Transition.rightToLeft);
      } else {
        customSnackBarWithIcon('61'.tr, 20, 20, '62'.tr, 15, 15,
            SnackPosition.BOTTOM, MyColors.primaryColor);
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  @override
  reSendCode() {
    verificationRegisterData.resenddata(email!);
  }

  @override
  void onInit() {
    verifycode = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    verifycode.dispose();
    super.dispose();
  }
}
