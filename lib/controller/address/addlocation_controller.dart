import 'dart:async';
import 'dart:developer';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/services/permissions_services.dart';
import 'package:ecommerceapp/core/shared/customsnackbar_fu.dart';
import 'package:ecommerceapp/view/screen/address/addaddress_sc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddLocationController extends GetxController {
  late StatusRequest statusRequest;
  Position? position;
  CameraPosition? cameraPosition;

  List<Marker> markers = [];
  double? lat;
  double? long;

  Completer<GoogleMapController> completerController =
      Completer<GoogleMapController>();

  Future<bool> _checkLocationPermissions() async {
    final hasPermission =
        await PermissionsService.checkLocationPermissionForGoogleMap();
    if (!hasPermission) {
      // Show a more specific message for map functionality
      customSnackBar(
        "203".tr,
        18,
        18,
        "204".tr,
        12,
        12,
        SnackPosition.TOP,
        Colors.redAccent,
        MyColors.whiteColor,
        MyColors.whiteColor,
      );
      return false;
    }
    return true;
  }

  addMarkers(LatLng latLong) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId('1'), position: latLong));
    lat = latLong.latitude;
    long = latLong.longitude;
    log("$lat");
    log("$long");
    update();
  }

  // getCurrentLocation() async {
  //   statusRequest = StatusRequest.loading;
  //   position = await Geolocator.getCurrentPosition();
  //   cameraPosition = CameraPosition(
  //     target: LatLng(position!.latitude, position!.longitude),
  //     zoom: 15,
  //   );
  //   addMarkers(LatLng(position!.latitude, position!.longitude));
  //   statusRequest = StatusRequest.none;
  //   update();
  // }

    Future<void> getCurrentLocation() async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      // 1. Check permissions and services
      final hasPermission = await _checkLocationPermissions();
      if (!hasPermission) return;

      // 2. Get current position
      position = await Geolocator.getCurrentPosition();
      cameraPosition = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 15,
      );
      addMarkers(LatLng(position!.latitude, position!.longitude));
    } catch (e) {
      // 3. Fallback to default location
      const LatLng defaultLocation = LatLng(51.509865, -0.118092); // London
      cameraPosition = const CameraPosition(target: defaultLocation, zoom: 10);
      addMarkers(defaultLocation);
      
      // 4. Show error if it's a permission issue
      if (e is PermissionDeniedException) {
        customSnackBar(
          "203".tr, 18, 18,
          "204".tr, 12, 12,
          SnackPosition.TOP,
          Colors.redAccent,
          MyColors.whiteColor,
          MyColors.whiteColor,
        );
      }
    } finally {
      statusRequest = StatusRequest.none;
      update();
    }
  }


  @override
  void onInit() {
    getCurrentLocation();
    completerController = Completer<GoogleMapController>();
    super.onInit();
  }

  goToAddAddress() async {
    final hasPermission = await _checkLocationPermissions();
    if (!hasPermission) return;
    if (lat != null && long != null) {
      Get.to(() => const AddAddress(),
          transition: Transition.rightToLeft,
          arguments: {'lat': lat.toString(), 'long': long.toString()});
    } else {
      customSnackBar(
        "105".tr,
        18,
        18,
        "106".tr,
        12,
        12,
        SnackPosition.TOP,
        Colors.redAccent,
        MyColors.whiteColor,
        MyColors.whiteColor,
      );
    }
  }
}
