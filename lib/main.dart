// ignore: unused_import
import 'package:flutter/foundation.dart';
// ignore: unused_import
import 'package:device_preview/device_preview.dart';
import 'package:ecommerceapp/core/services/permissions_services.dart';
import 'package:ecommerceapp/core/localization/changelocalecontroller.dart';
import 'package:ecommerceapp/core/localization/translation.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/core/bindings/mybindings.dart';
import 'package:ecommerceapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initializeServices();
//   await PermissionsService.requestAllPermissions();
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => const MyApp(),
//     ),
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  await dotenv.load(fileName: ".env");
  // await PermissionsService.requestAllPermissions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //  Get.put(ChangeLocaleController());
    ChangeLocaleController controller = Get.put(ChangeLocaleController());
    Future.microtask(() => PermissionsService.requestAllPermissions());
    return GetMaterialApp(
      // useInheritedMediaQuery: true,
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: controller.language,
      initialBinding: MyBindings(),
      getPages: routes,
    );
  }
}
