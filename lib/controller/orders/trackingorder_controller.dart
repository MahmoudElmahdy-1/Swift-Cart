import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/get_decode_polyline_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/model/orders_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingOrderController extends GetxController {
  GoogleMapController? gmc;

  MyServices myServices = Get.find();

  double? riderLat;
  double? riderLong;
  double? currentLat;
  double? currentLong;

  Set<Polyline> polyLineSet = {};

  CameraPosition? cameraPosition;
  List<Marker> markers = [];

  StatusRequest statusRequest = StatusRequest.none;
  late OrdersModel ordersModel;

  getCurrentPosition() {
    // positionStream =
    //     Geolocator.getPositionStream().listen((Position? position) {
    //   currentLat = position!.latitude;
    //   currentLong = position.longitude;
    //   if (gmc != null) {
    //     gmc!.animateCamera(
    //         CameraUpdate.newLatLng(LatLng(currentLat!, currentLong!)));
    //   }

    //   markers.removeWhere((element) => element.markerId.value == "current");
    //   markers.add(Marker(
    //       markerId: const MarkerId("rider"),
    //       position: LatLng(position.latitude, position.longitude)));
    //   update();
    //   log('Current $currentLat, $currentLong');
    // });
  }

  initialData() {
    cameraPosition = CameraPosition(
      target:
          LatLng(ordersModel.addressLatitude!, ordersModel.addressLongitude!),
      zoom: 15,
    );
    markers.add(Marker(
        markerId: const MarkerId("current"),
        position: LatLng(
            ordersModel.addressLatitude!, ordersModel.addressLongitude!)));
    log('current ${ordersModel.addressLatitude!}, ${ordersModel.addressLongitude!}');
  }

  getPolyline() async {
    currentLat = ordersModel.addressLatitude!;
    currentLong = ordersModel.addressLongitude!;
    // await Future.delayed(const Duration(seconds: 1));
    polyLineSet =
        await getPolyLine(currentLat, currentLong, riderLat, riderLong);
    update();
  }

  getRiderLocation() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc("${ordersModel.ordersId}")
        .snapshots()
        .listen((event) {
      if (event.exists) {
        riderLat = event.get('lat');
        riderLong = event.get('long');
        updateRiderMarker(riderLat, riderLong);
      }
    });
  }

  updateRiderMarker(riderLat, riderLong) {
    markers.removeWhere((element) => element.markerId.value == "rider");
    markers.add(Marker(
        markerId: const MarkerId("rider"),
        position: LatLng(riderLat, riderLong)));
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    // getCurrentPosition();
    initialData();
    // getPolyline();
    super.onInit();
  }

  @override
  void onClose() {
    gmc!.dispose();
    super.onClose();
  }
}
