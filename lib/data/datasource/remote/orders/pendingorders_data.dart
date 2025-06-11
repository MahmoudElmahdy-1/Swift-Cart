import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/class/crud.dart';

class PendingOrdersData {
  Crud crud;
  PendingOrdersData(this.crud);

  getData(String usersid) async {
    var response =
        await crud.postData(ApiLinks.pendingOrders, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  cancelData(String ordersid) async {
    var response =
        await crud.postData(ApiLinks.cancelOrders, {"ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
