import 'dart:async';

import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/mypages.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/data/datasource/remote/orders/ordersdetails_data.dart';
import 'package:ecommerceapp/data/datasource/remote/orders/pendingorders_data.dart';
import 'package:ecommerceapp/data/model/orders_model.dart';
import 'package:ecommerceapp/data/model/ordersdetails_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderdetailsController extends GetxController {
  late OrdersModel ordersModel;
  PendingOrdersData pendingOrdersData = PendingOrdersData(Get.find<Crud>());

  late StatusRequest statusRequest;
  List<OrdersDetailsModel> data = [];
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find<Crud>());

  CameraPosition? cameraPosition;

  List<Marker> markers = [];
  double? lat;
  double? long;

  Completer<GoogleMapController> completerController =
      Completer<GoogleMapController>();

  getPaymentMethod(String val) {
    if (val == "0") {
      return "154".tr;
    } else {
      return "155".tr;
    }
  }

  getOrdersStatus(String val) {
    if (val == "0") {
      return "156".tr;
    } else if (val == "1") {
      return "157".tr;
    } else if (val == "2") {
      return "158".tr;
    } else {
      return "159".tr;
    }
  }

  getStatusColor(String val) {
    if (val == "0") {
      return MyColors.amberColor2;
    } else if (val == "1") {
      return MyColors.orangeColor;
    } else if (val == "2") {
      return MyColors.greenColor;
    } else if (val == "3") {
      return MyColors.darkGreenColor;
    } else {
      return MyColors.primaryColor;
    }
  }

  getItems() async {
    statusRequest = StatusRequest.loading;
    var response =
        await ordersDetailsData.getData(ordersModel.ordersId.toString());
    // log("responseFromItemsController : $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => OrdersDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  getCurrentLocation() {
    if (ordersModel.ordersDeliverytype == 0) {
      cameraPosition = CameraPosition(
        target:
            LatLng(ordersModel.addressLatitude!, ordersModel.addressLongitude!),
        zoom: 16,
      );
      markers.add(Marker(
          markerId: const MarkerId("1"),
          position: LatLng(
              ordersModel.addressLatitude!, ordersModel.addressLongitude!)));
    }
  }

  cancelOrders(String ordersid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingOrdersData.cancelData(ordersid);
    // log("responseFromItemsController : $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(MyPages.homeScreenWithNavBar);
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    getItems();
    getCurrentLocation();
    super.onInit();
  }
}
