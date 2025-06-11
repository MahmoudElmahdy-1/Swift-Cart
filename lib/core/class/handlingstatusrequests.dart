import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/mylotties.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingStatusRequests extends StatelessWidget {
  const HandlingStatusRequests(
      {super.key, required this.statusRequest, required this.child});
  final StatusRequest statusRequest;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Transform.scale(
                scale: 0.8, child: Lottie.asset(MyLotties.loading)))
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(MyLotties.offline, width: 310, height: 310))
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child:
                        Lottie.asset(MyLotties.server, width: 310, height: 310))
                : statusRequest == StatusRequest.noDataFailure
                    ? Center(
                        child: Lottie.asset(MyLotties.noData,
                            width: 270, height: 270))
                    : child;
  }
}

class HandlingStatusViewWithHand extends StatelessWidget {
  const HandlingStatusViewWithHand(
      {super.key, required this.statusRequest, required this.child});
  final StatusRequest statusRequest;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(MyLotties.loading))
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(MyLotties.offline, width: 310, height: 310))
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child:
                        Lottie.asset(MyLotties.server, width: 310, height: 310))
                : child;
  }
}

class HandlingStatusSkeletonizer extends StatelessWidget {
  const HandlingStatusSkeletonizer(
      {super.key, required this.statusRequest, required this.child});
  final StatusRequest statusRequest;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.offlineFailure
        ? Center(
            child: Lottie.asset(MyLotties.offline, width: 310, height: 310))
        : statusRequest == StatusRequest.serverFailure
            ? Center(
                child: Lottie.asset(MyLotties.server, width: 310, height: 310))
            : statusRequest == StatusRequest.noDataFailure
                ? Center(
                    child:
                        Lottie.asset(MyLotties.noData, width: 270, height: 270))
                : child;
  }
}
