import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/notifications_data.dart';
import 'package:ecommerceapp/data/model/notifications_model.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationsController extends GetxController {
  List categories = [];
  int? selectedCategory;
  List<NotificationsModel> data = [];
  String? categoryid;
  late StatusRequest statusRequest;
  NotificationsData notificationsData = NotificationsData(Get.find<Crud>());
  MyServices myServices = Get.find();

  getnotifications() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationsData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    // log("responseFromItemsController : $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => NotificationsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  String getNotificationsTime(String dateTime) {
    Jiffy.setLocale(myServices.sharedPreferences.getString("lang") ?? "en");
    return Jiffy.parse(dateTime, isUtc: true).fromNow();
  }

  @override
  void onInit() {
    getnotifications();
    super.onInit();
  }
}
