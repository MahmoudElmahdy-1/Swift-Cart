import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

String fontFamily(String arFont, String enFont) {
  final lang = Get.find<MyServices>().sharedPreferences.getString("lang");
  return lang == "ar" ? arFont : enFont;
}

double fontSize(double arSize, double enSize) {
  final lang = Get.find<MyServices>().sharedPreferences.getString("lang");
  return lang == "ar" ? arSize : enSize;
}

String translateDatabase(arText, enText) {
  final lang = Get.find<MyServices>().sharedPreferences.getString("lang");
  return lang == "ar" ? arText : enText;
}
