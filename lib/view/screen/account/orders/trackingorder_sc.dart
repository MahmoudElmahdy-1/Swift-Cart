import 'package:ecommerceapp/controller/orders/trackingorder_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/shared/customappbar_wd.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackingOrder extends StatelessWidget {
  const TrackingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Track Order'.tr),
      body: GetBuilder<TrackingOrderController>(
          builder: (trackingOrderController) => HandlingStatusRequests(
                statusRequest: trackingOrderController.statusRequest,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        child: GoogleMap(
                          polylines: trackingOrderController.polyLineSet,
                          mapType: MapType.normal,
                          markers: trackingOrderController.markers.toSet(),
                          initialCameraPosition:
                              trackingOrderController.cameraPosition!,
                          onMapCreated: (GoogleMapController controllerMap) {
                            trackingOrderController.gmc = controllerMap;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
