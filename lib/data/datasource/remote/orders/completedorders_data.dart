import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/class/crud.dart';

class CompletedOrdersData {
  Crud crud;
  CompletedOrdersData(this.crud);

  getData(String usersid) async {
    var response =
        await crud.postData(ApiLinks.completedOrders, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  getRating(int ordersid, double rating, String comment) async {
    var response =
        await crud.postData(ApiLinks.ratingOrders, {"ordersid": ordersid, "rating": rating, "commentrating": comment});
    return response.fold((l) => l, (r) => r);
  }
}
