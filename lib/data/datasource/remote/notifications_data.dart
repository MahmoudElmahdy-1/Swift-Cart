import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/class/crud.dart';

class NotificationsData {
  Crud crud;
  NotificationsData(this.crud);

  getData(String usersid) async {
    var response =
        await crud.postData(ApiLinks.notifications, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
