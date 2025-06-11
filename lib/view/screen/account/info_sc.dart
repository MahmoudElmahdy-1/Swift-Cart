import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/core/shared/customappbar_wd.dart';
import 'package:ecommerceapp/view/widget/account/info/infocard_wd.dart';
import 'package:ecommerceapp/view/widget/account/info/title_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Scaffold(
      appBar: CustomAppBar(text: '189'.tr),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        children: [
          TitleWidget(text: '196'.tr),
          InfoCard(
              text: '${myServices.sharedPreferences.getString("username")} '),
          const SizedBox(height: 20),
          TitleWidget(text: '197'.tr),
          InfoCard(text: '${myServices.sharedPreferences.getString("phone")}'),
          const SizedBox(height: 20),
          TitleWidget(text: '198'.tr),
          InfoCard(text: '${myServices.sharedPreferences.getString("email")}'),
        ],
      )),
    );
  }
}
