import 'dart:developer';
import 'package:ecommerceapp/controller/orders/pendingorders_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/shared/customsnackbar_fu.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// ignore: unused_import
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

// to request notification permissions
// Future<void> requestNotificationPermissions() async {
//   // ignore: unused_local_variable
//   NotificationSettings settings =
//       await FirebaseMessaging.instance.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );
// }

// to send notification in foreground
fcmConfig() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    log("${message.notification!.title}");
    log("${message.notification!.body}");
    FlutterRingtonePlayer().playNotification();
    customSnackBar(
      message.notification!.title!,
      15,
      15,
      message.notification!.body!,
      12,
      12,
      null,
      null,
      MyColors.blackColor,
      MyColors.blackColor,
    );
    refreshPendingOrdersPage(message.data);
  });
}

refreshPendingOrdersPage(data) {
  log(data['pageid']);
  log(data['pagename']);
  log(Get.currentRoute);

  if (Get.currentRoute == "/PendingOrders" &&
      data['pagename'] == "refreshPendingOrdersPage") {
    PendingOrdersController pendingOrdersController = Get.find();
    pendingOrdersController.refreshPage();
  }
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
// to send notification using flutter-local-notification
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> setupFCM() async {
//   // Initialize local notification plugin
//   const AndroidInitializationSettings androidInitSettings =
//       AndroidInitializationSettings('@mipmap/ic_launcher');

//   const InitializationSettings initSettings =
//       InitializationSettings(android: androidInitSettings);

//   await flutterLocalNotificationsPlugin.initialize(initSettings);

//   // Request notification permissions (especially for iOS)
//   await FirebaseMessaging.instance.requestPermission();

//   // Listen for foreground messages
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;

//     if (notification != null && android != null) {
//       flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         const NotificationDetails(
//           android: AndroidNotificationDetails(
//             'high_importance_channel', // channel ID
//             'High Importance Notifications', // channel name
//             importance: Importance.max,
//             priority: Priority.high,
//             playSound: true,
//           ),
//         ),
//       );
//     }
//   });
// }