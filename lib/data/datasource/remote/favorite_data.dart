// ignore: unused_import
import 'dart:developer';
import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/class/crud.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite(String usersid, int itemsid) async {
    var response = await crud.postData(
        ApiLinks.favoriteAdd, {"usersid": usersid, "itemsid": itemsid});
    log("From favoriteDataAdd $response");

    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, int itemsid) async {
    var response = await crud.postData(
        ApiLinks.favoriteRemove, {"usersid": usersid, "itemsid": itemsid});
    log("From favoriteDataRemove $response");

    return response.fold((l) => l, (r) => r);
  }

  getitems(String usersid) async {
    var response =
        await crud.postData(ApiLinks.favoriteView, {"usersid": usersid});

    return response.fold((l) => l, (r) => r);
  }

  removeFromFavritePage(int favoriteid) async {
    var response = await crud
        .postData(ApiLinks.removeFromFavoritePage, {"favoriteid": favoriteid});

    return response.fold((l) => l, (r) => r);
  }
}
