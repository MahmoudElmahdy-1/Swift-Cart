import 'package:ecommerceapp/controller/testcontroller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      body: GetBuilder<TestController>(builder: (controller) {
        return HandlingStatusRequests(
          statusRequest: controller.statusRequest,
          child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Text("${controller.data[index]}");
              }),
        );
      }),
    );
  }
}
