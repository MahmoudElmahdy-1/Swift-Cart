import 'dart:developer';

import 'package:ecommerceapp/controller/address/viewaddress_controller.dart';
import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/mypages.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/core/shared/customsnackbar_fu.dart';
import 'package:ecommerceapp/data/datasource/remote/address_data.dart';
import 'package:ecommerceapp/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAddressController extends GetxController {
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

  AddressModel? addressModel;

  @override
  void onInit() {
    addressModel = Get.arguments["addressModel"];
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    building = TextEditingController();
    optional = TextEditingController();
    lat = addressModel!.addressLatitude.toString();
    long = addressModel!.addressLongitude.toString();
    name.text = addressModel!.addressName!;
    city.text = addressModel!.addressCity!;
    street.text = addressModel!.addressStreet!;
    building.text = addressModel!.addressBuilding!;
    optional.text = addressModel!.addressOptional!;
    super.onInit();
  }

  editAddress() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.editAddress(
        "${addressModel!.addressId!}",
        name.text,
        city.text,
        street.text,
        building.text,
        optional.text,
        lat!,
        long!,
      );
      log("responseFromEditAddressController : $response");
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
          ViewAddressController viewAddressController = Get.find();
          viewAddressController.viewAddress();
          Get.offNamed(MyPages.addressView);
        }
      } else {
        Get.back();
        // statusRequest = StatusRequest.noDataFailure;
      }
      update();
    } else {}
  }
}
