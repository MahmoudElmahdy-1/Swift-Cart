import 'package:ecommerceapp/core/localization/changelocalecontroller.dart';
import 'package:ecommerceapp/view/screen/onboarding_sc.dart';
import 'package:get/get.dart';

abstract class LanguageController extends GetxController {
  goToOnBoardingArabic();
  goToOnBoardingEnglish();
}

class LanguageControllerImp extends LanguageController {
ChangeLocaleController controller = Get.find();

  @override
  goToOnBoardingArabic() {
    controller.changeLang("ar");
    Get.off(() => const OnBoarding(), transition: Transition.leftToRight);
  }

  @override
  goToOnBoardingEnglish() {
    controller.changeLang("en");
    Get.off(() => const OnBoarding(), transition: Transition.rightToLeft);
  }
}
