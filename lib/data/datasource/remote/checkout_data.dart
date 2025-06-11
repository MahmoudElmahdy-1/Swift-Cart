import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/class/crud.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);

  checkout(Map data) async {
    var response = await crud.postData(ApiLinks.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
