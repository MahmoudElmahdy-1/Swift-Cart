import 'package:ecommerceapp/controller/orders/pendingorders_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/shared/customappbar_wd.dart';
import 'package:ecommerceapp/view/widget/orders/pendingordersbox_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    // PendingOrdersController pendingOrdersController = Get.find();
    return Scaffold(
      appBar: CustomAppBar(text: '143'.tr),
      body: SafeArea(
          child: GetBuilder<PendingOrdersController>(
              builder: (pendingOrdersController) => HandlingStatusRequests(
                  statusRequest: pendingOrdersController.statusRequest,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    itemCount: pendingOrdersController.data.length,
                    itemBuilder: (context, i) => PendingOrdersBox(
                      ordersModel: pendingOrdersController.data[i],
                    ),
                  )))),
    );
  }
}
