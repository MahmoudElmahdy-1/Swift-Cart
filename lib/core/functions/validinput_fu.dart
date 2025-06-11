import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return '44'.tr;
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return '45'.tr;
    }
  }

  if (type == "number") {
    if (!GetUtils.isPhoneNumber(val)) {
      return '46'.tr;
    }
  }

  if (val.length < min) {
    return '${'47'.tr} $min';
  }

  if (val.length > max) {
    return '${'48'.tr} $max';
  }
}
