import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/class/crud.dart';

class VerificationResetPasswordData {
  Crud crud;
  VerificationResetPasswordData(this.crud);

  postdata(String email, String verifycode) async {
    var response = await crud.postData(ApiLinks.verificationResetPassword, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

    resenddata(String email) async {
    var response = await crud.postData(ApiLinks.resenddata, {
      "email": email
    });
    return response.fold((l) => l, (r) => r);
  }
}
