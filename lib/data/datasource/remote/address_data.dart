// ignore: unused_import
import 'dart:developer';
import 'package:ecommerceapp/api_links.dart';
import 'package:ecommerceapp/core/class/crud.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  addAddress(String usersid, String name, String city, String street,
      String building, String optional, String lat, String long) async {
    var response = await crud.postData(ApiLinks.addressAdd, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "building": building,
      "optional": optional,
      "latitude": lat,
      "longitude": long,
    });
    // log("From AddressData addAddress $response");
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(int addressid) async {
    var response =
        await crud.postData(ApiLinks.addressDelete, {"addressid": addressid});
    // log("From AddressData deleteAddress $response");
    return response.fold((l) => l, (r) => r);
  }

  editAddress(String addressid, String name, String city, String street,
      String building, String optional, String lat, String long) async {
    var response = await crud.postData(ApiLinks.addressEdit, {
      "addressid": addressid,
      "name": name,
      "city": city,
      "street": street,
      "building": building,
      "optional": optional,
      "latitude": lat,
      "longitude": long,
    });
    // log("From AddressData editAddress $response");
    return response.fold((l) => l, (r) => r);
  }

  viewAddress(String usersid) async {
    var response =
        await crud.postData(ApiLinks.addressView, {"usersid": usersid});
    // log("From AddressData viewAddress $response");
    return response.fold((l) => l, (r) => r);
  }
}
