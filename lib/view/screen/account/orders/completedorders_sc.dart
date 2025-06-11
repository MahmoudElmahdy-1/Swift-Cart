import 'package:ecommerceapp/controller/orders/completedorders_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/shared/customappbar_wd.dart';
import 'package:ecommerceapp/view/widget/orders/completedordersbox_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: '162'.tr),
      body: SafeArea(
          child: GetBuilder<CompletedOrdersController>(
              builder: (completedOrdersController) => HandlingStatusRequests(
                  statusRequest: completedOrdersController.statusRequest,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    itemCount: completedOrdersController.data.length,
                    itemBuilder: (context, i) => CompletedOrdersBox(
                      ordersModel: completedOrdersController.data[i],
                    ),
                  )))),
    );
  }
}
