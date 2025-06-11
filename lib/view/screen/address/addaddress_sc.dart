import 'package:ecommerceapp/controller/address/addaddress_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/functions/validinput_fu.dart';
import 'package:ecommerceapp/core/shared/custombuttonauth_wd.dart';
import 'package:ecommerceapp/core/shared/customeformfield_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: MyColors.shadowColor,
        elevation: 2,
        backgroundColor: MyColors.primaryColor,
        foregroundColor: MyColors.whiteColor,
        title: Text('110'.tr),
      ),
      body: SafeArea(
          child: GetBuilder<AddAddressController>(
              builder: (addAddressController) => HandlingStatusRequests(
                    statusRequest: addAddressController.statusRequest,
                    child: Form(
                      key: addAddressController.formstate,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        children: [
                          const SizedBox(height: 10),
                          CustomeFormField(
                            hintText: '111'.tr,
                            icon: MdiIcons.text,
                            textController: addAddressController.name,
                            valid: (val) {
                              return validInput(val!, 1, 20, '');
                            },
                            type: TextInputType.text,
                          ),
                          const SizedBox(height: 10),
                          CustomeFormField(
                            hintText: '112'.tr,
                            icon: Icons.location_city_outlined,
                            textController: addAddressController.city,
                            valid: (val) {
                              return validInput(val!, 1, 255, '');
                            },
                            type: TextInputType.text,
                          ),
                          const SizedBox(height: 10),
                          CustomeFormField(
                            hintText: '113'.tr,
                            icon: FontAwesomeIcons.road,
                            textController: addAddressController.street,
                            valid: (val) {
                              return validInput(val!, 1, 255, '');
                            },
                            type: TextInputType.text,
                          ),
                          const SizedBox(height: 10),
                          CustomeFormField(
                            hintText: '114'.tr,
                            icon: FontAwesomeIcons.solidBuilding,
                            textController: addAddressController.building,
                            valid: (val) {
                              return validInput(val!, 1, 255, '');
                            },
                            type: TextInputType.text,
                          ),
                          const SizedBox(height: 10),
                          CustomeFormField(
                            hintText: '114.5'.tr,
                            icon: FontAwesomeIcons.solidSquarePlus,
                            textController: addAddressController.optional,
                            valid: (val) {
                              return null;
                              // return validInput(val!, 0, 255, '');
                            },
                            type: TextInputType.text,
                          ),
                          const SizedBox(height: 20),
                          CustomeAuthButton(
                            onPressed: () {
                              addAddressController.addAddress();
                            },
                            text: '115'.tr,
                          )
                        ],
                      ),
                    ),
                  ))),
    );
  }
}
