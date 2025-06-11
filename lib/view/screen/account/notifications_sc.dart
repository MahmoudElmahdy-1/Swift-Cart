import 'package:ecommerceapp/controller/account/notifications_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/shared/customappbar_wd.dart';
import 'package:ecommerceapp/view/widget/account/notifications/notificationsbox_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(text: "192".tr),
        body: SafeArea(
            child: GetBuilder<NotificationsController>(
          builder: (notificationsController) => HandlingStatusRequests(
              statusRequest: notificationsController.statusRequest,
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                itemCount: notificationsController.data.length,
                itemBuilder: (context, i) => NotificationsBox(
                  notificationsModel: notificationsController.data[i],
                ),
              )),
        )));
  }
}
