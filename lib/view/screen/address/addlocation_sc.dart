import 'package:ecommerceapp/controller/address/addlocation_controller.dart';
import 'package:ecommerceapp/core/class/handlingstatusrequests.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart'; // Required for LatLng

class AddLocation extends StatelessWidget {
  const AddLocation({super.key});

  @override
  Widget build(BuildContext context) {
    // AddLocationController addLocationController = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: MyColors.shadowColor,
        elevation: 2,
        backgroundColor: MyColors.primaryColor,
        foregroundColor: MyColors.whiteColor,
        title: Text('108'.tr),
      ),
      body: SafeArea(
        child: GetBuilder<AddLocationController>(
          builder: (addLocationController) => HandlingStatusRequests(
            statusRequest: addLocationController.statusRequest,
            child: Column(
              children: [
                if (addLocationController.cameraPosition != null)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        GoogleMap(
                          mapType: MapType.normal,
                          markers: addLocationController.markers.toSet(),
                          onTap: (latLong) {
                            addLocationController.addMarkers(latLong);
                          },
                          initialCameraPosition:
                              addLocationController.cameraPosition!,
                          onMapCreated: (GoogleMapController controller) {
                            addLocationController.completerController
                                .complete(controller);
                          },
                        ),
                        Positioned(
                          bottom: 15,
                          child: ElevatedButton(
                            onPressed: () {
                              addLocationController.goToAddAddress();
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 3,
                              shadowColor: MyColors.shadowColor,
                              fixedSize: const Size(220, 46),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              backgroundColor: MyColors.primaryColor,
                              foregroundColor: MyColors.whiteColor,
                            ),
                            child: Text(
                              "109".tr,
                              style: TextStyle(
                                  fontSize: fontSize(17, 16),
                                  fontFamily: fontFamily(MyFonts.cairoSemiBold,
                                      MyFonts.montserratBold)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
