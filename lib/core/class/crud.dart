// ignore: unused_import
import 'dart:developer';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/checkinternet_fu.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        // Convert all values to String
        Map<String, String> stringData = data
            .map((key, value) => MapEntry(key.toString(), value.toString()));

        var response = await http.post(Uri.parse(linkurl), body: stringData);
        // log('Response Body: ${response.body}');
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          // log('responsebody From Crud : $responsebody');
          return Right(responsebody);
        } else {
          log("Server Failure From Crud ${response.statusCode}");
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        log("Offline Failure - No Internet From Crud");
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      log("Server Exception From Crud: $e");
      return const Left(StatusRequest.serverException);
    }
  }
}
