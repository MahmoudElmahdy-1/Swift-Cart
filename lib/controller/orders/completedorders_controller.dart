import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/orders/completedorders_data.dart';
import 'package:ecommerceapp/data/model/orders_model.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CompletedOrdersController extends GetxController {
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  CompletedOrdersData completedOrdersData =
      CompletedOrdersData(Get.find<Crud>());
  MyServices myServices = Get.find();

  getDeliveryType(String val) {
    if (val == "0") {
      return "152".tr;
    } else {
      return "153".tr;
    }
  }

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
      return "157.5".tr;
    } else if (val == "3") {
      return "158".tr;
    } else {
      return "159".tr;
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await completedOrdersData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    // log("responseFromItemsController : $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  String getOrdersTime(String dateTime) {
    Jiffy.setLocale(myServices.sharedPreferences.getString("lang") ?? "en");
    return Jiffy.parse(dateTime, isUtc: true).fromNow();
  }

  submitRating(int ordersid, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await completedOrdersData.getRating(ordersid, rating, comment);
    // log("responseFromItemsController : $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        getOrders();
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
