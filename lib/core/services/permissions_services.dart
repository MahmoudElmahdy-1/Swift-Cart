import 'dart:developer';

import 'package:ecommerceapp/core/functions/locationsnackbar_fu.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class PermissionsService {
  static Future<void> requestLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {locationPermissionSnackBar("97".tr); return;}
    if (serviceEnabled) {
      log("Location Service Enabled");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationPermissionSnackBar("98".tr);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      locationPermissionSnackBar('99'.tr);
      return;
    }
  }

  static Future<bool> checkLocationPermissionForGoogleMap() async {
    try {
      // 1. Check service status
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // locationPermissionSnackBar("97".tr);
        return false;
      }

      // 2. Check permission status
      LocationPermission permission = await Geolocator.checkPermission();

      // 3. Handle different permission states
      switch (permission) {
        case LocationPermission.deniedForever:
          locationPermissionSnackBar('99'.tr);
          return false;

        case LocationPermission.denied:
          permission = await Geolocator.requestPermission();
          if (permission != LocationPermission.whileInUse &&
              permission != LocationPermission.always) {
            locationPermissionSnackBar("98".tr);
            return false;
          }
          return true;

        case LocationPermission.whileInUse:
        case LocationPermission.always:
          return true;

        default:
          return false;
      }
    } catch (e) {
      log("Location permission error: $e");
      return false;
    }
  }

  static Future<void> requestNotificationPermissions() async {
    // ignore: unused_local_variable
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log("Notification permission granted");
    }
  }

  static Future<void> requestAllPermissions() async {
    await requestNotificationPermissions();
    await requestLocationPermission();
  }
}
