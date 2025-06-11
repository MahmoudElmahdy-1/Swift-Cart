import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/class/crud.dart';

class RegisterData {
  Crud crud;
  RegisterData(this.crud);

  postdata(String username, String email, String phone, String password) async {
    var response = await crud.postData(ApiLinks.register, {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
