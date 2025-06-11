import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/class/crud.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);

  viewCategories() async {
    var response = await crud.postData(ApiLinks.categories, {});
    return response.fold((l) => l, (r) => r);
  }

}
