import 'dart:developer';
import 'package:ecommerceapp/core/functions/fcm_services_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  String? sharePrefLanguage;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
    language = locale;
    update();
  }

  changeLangOnPress() {
    if (language?.languageCode == 'en') {
      changeLang('ar');
    } else {
      changeLang('en');
    }
    language = Get.locale;
    log("${language?.languageCode}");
  }

  @override
  void onInit() {
    fcmConfig();
    final lang = myServices.sharedPreferences.getString("lang");
    language = lang == "ar"
        ? const Locale("ar")
        : lang == "en"
            ? const Locale("en")
           : Locale(Get.deviceLocale?.languageCode ?? 'en');
    super.onInit();
  }
}
