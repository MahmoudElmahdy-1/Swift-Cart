// ignore: unused_import
import 'dart:developer';
import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/class/crud.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(String categoryid, String usersid) async {
    var response = await crud.postData(
        ApiLinks.items, {"categoryid": categoryid, "usersid": usersid});

    return response.fold((l) => l, (r) => r);
  }
}
