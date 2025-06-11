import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/class/crud.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(ApiLinks.offers, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
