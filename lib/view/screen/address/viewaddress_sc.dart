import 'package:ecommerceapp/controller/address/viewaddress_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/view/screen/address/addlocation_sc.dart';
import 'package:ecommerceapp/view/widget/address/addressbox_wd.dart';
import 'package:ecommerceapp/core/shared/animated_confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        shadowColor: MyColors.shadowColor,
        elevation: 2,
        backgroundColor: MyColors.primaryColor,
        foregroundColor: MyColors.whiteColor,
        title: Text('107'.tr),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.primaryColor,
        foregroundColor: MyColors.whiteColor,
        onPressed: () {
          Get.to(() => const AddLocation(), transition: Transition.downToUp);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<ViewAddressController>(
          builder: (viewAddressController) => HandlingStatusRequests(
              statusRequest: viewAddressController.statusRequest,
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                itemCount: viewAddressController.data.length,
                itemBuilder: (BuildContext context, int i) {
                  return InkWell(
                    onTap: () {
                      viewAddressController.goToEditAddress(viewAddressController.data[i],);
                    },
                    child: AddressBox(
                      addressModel: viewAddressController.data[i],
                      onDelete: () {
                        showCustomDialog(
                          context: context,
                          title: '101'.tr,
                          message: '102'.tr,
                          confirmButtonText: '103'.tr,
                          cancelButtonText: '104'.tr,
                          cancelButtonColor: MyColors.darkRedColor,
                          cancelButtonTextColor: MyColors.whiteColor,
                          confirmButtonColor: MyColors.greenColor,
                          confirmButtonTextColor: MyColors.whiteColor,
                          onCancel: () {
                            Get.back();
                          },
                          onConfirm: () {
                            viewAddressController.deleteAddress(
                                viewAddressController.data[i].addressId!);
                            Get.back();
                          },
                          isFlip: true,
                        );
                      },
                    ),
                  );
                },
              ))),
    );
  }
}
