import 'package:ecommerceapp/view/screen/auth/login_sc.dart';
import 'package:get/get.dart';

abstract class SuccessRegisterController extends GetxController {
  goToLogin();
}

class SuccessRegisterControllerImp extends SuccessRegisterController {
  @override
  goToLogin() {
    Get.offAll(() => const LogIn(), transition: Transition.upToDown);
  }
}
