import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/class/crud.dart';

class ForgotPasswordData {
  Crud crud;
  ForgotPasswordData(this.crud);

  postdata(String email) async {
    var response = await crud.postData(ApiLinks.forgotPassword, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
