import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/class/crud.dart';

class HomePageData {
  Crud crud;
  HomePageData(this.crud);

  getData() async {
    var response = await crud.postData(ApiLinks.homePage, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(ApiLinks.search, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
