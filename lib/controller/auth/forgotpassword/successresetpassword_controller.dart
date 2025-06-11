import 'package:ecommerceapp/view/screen/auth/login_sc.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToLogin() {
    Get.offAll(() => const LogIn(), transition: Transition.upToDown);
  }
}
