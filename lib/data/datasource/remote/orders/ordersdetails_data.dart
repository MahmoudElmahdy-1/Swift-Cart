import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/class/crud.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);

  getData(String ordersid) async {
    var response =
        await crud.postData(ApiLinks.ordersDetails, {"ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
