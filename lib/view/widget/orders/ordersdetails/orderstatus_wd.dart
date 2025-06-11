import 'package:ecommerceapp/controller/orders/orderdetails_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    OrderdetailsController orderdetailsController = Get.find();

    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: orderdetailsController.getStatusColor(
              "${orderdetailsController.ordersModel.ordersStatus}"),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Text(
            '${"164".tr} ${orderdetailsController.getOrdersStatus("${orderdetailsController.ordersModel.ordersStatus}")}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MyColors.whiteColor,
              fontFamily:
                  fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
