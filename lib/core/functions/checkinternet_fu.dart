// import 'dart:developer';
// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'dart:io';

// checkInternet() async {
//   bool result = await InternetConnection().hasInternetAccess;
//   if (result == true) {
//     log("Connected");
//   } else {
//     log("Not Connected");
//   }
//   return result;
// }

checkInternet() async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
