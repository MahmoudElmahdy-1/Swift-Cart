import 'package:ecommerceapp/controller/orders/orderdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    OrderdetailsController orderdetailsController = Get.find();

    return Card(
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 300,
        // width: double.infinity,
        child: GoogleMap(
          mapType: MapType.normal,
          markers: orderdetailsController.markers.toSet(),
          initialCameraPosition: orderdetailsController.cameraPosition!,
          onMapCreated: (GoogleMapController controller) {
            orderdetailsController.completerController.complete(controller);
          },
        ),
      ),
    );
  }
}
