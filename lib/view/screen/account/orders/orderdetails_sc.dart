import 'package:ecommerceapp/controller/orders/orderdetails_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/shared/customappbar_wd.dart';
import 'package:ecommerceapp/view/widget/orders/ordersdetails/cancelorder_wd.dart';
import 'package:ecommerceapp/view/widget/orders/ordersdetails/firsttable_wd.dart';
import 'package:ecommerceapp/view/widget/orders/ordersdetails/googlemap_wd.dart';
import 'package:ecommerceapp/view/widget/orders/ordersdetails/orderstatus_wd.dart';
import 'package:ecommerceapp/view/widget/orders/ordersdetails/secondtable_wd.dart';
import 'package:ecommerceapp/view/widget/orders/ordersdetails/shippingaddress_wd.dart';
import 'package:ecommerceapp/view/widget/orders/ordersdetails/thirdtable_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: '163'.tr),
      body: SafeArea(
          child: GetBuilder<OrderdetailsController>(
              builder: (orderdetailsController) => HandlingStatusRequests(
                    statusRequest: orderdetailsController.statusRequest,
                    child: ListView(
                      padding: const EdgeInsets.only(bottom: 10),
                      children: [
                        const OrderStatusWidget(),
                        const FirstTable(),
                        const SecondTable(),
                        const ThirdTable(),
                        const ShippingAddress(),
                        if (orderdetailsController
                                .ordersModel.ordersDeliverytype ==
                            0)
                          const GoogleMapWidget(),
                        if (orderdetailsController.ordersModel.ordersStatus ==
                            0)
                          const CancelOrder(),
                      ],
                    ),
                  ))),
    );
  }
}
