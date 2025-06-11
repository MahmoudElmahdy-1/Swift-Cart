import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/mypages.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/core/shared/customsnackbar_fu.dart';
import 'package:ecommerceapp/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find<Crud>());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  MyServices myServices = Get.find();

  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;
  late TextEditingController building;
  late TextEditingController optional;

  String? lat;
  String? long;

  initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    building = TextEditingController();
    optional = TextEditingController();

    lat = Get.arguments["lat"];
    long = Get.arguments["long"];
  }

  addAddress() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.addAddress(
        myServices.sharedPreferences.getString("id")!,
        name.text,
        city.text,
        street.text,
        building.text,
        optional.text,
        lat!,
        long!,
      );
      // log("responseFromaddAddressController : $response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          customSnackBar(
            "116".tr,
            19,
            18,
            "117".tr,
            14,
            14,
            SnackPosition.BOTTOM,
            Colors.green,
            MyColors.whiteColor,
            MyColors.whiteColor,
          );
          Get.offAllNamed(MyPages.homeScreenWithNavBar);
        }
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    city.dispose();
    street.dispose();
    building.dispose();
    optional.dispose();
    super.dispose();
  }
}
