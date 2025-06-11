import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdata_fu.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/address_data.dart';
import 'package:ecommerceapp/data/model/address_model.dart';
import 'package:ecommerceapp/view/screen/address/editaddress_sc.dart';
import 'package:get/get.dart';

class ViewAddressController extends GetxController {
  late StatusRequest statusRequest;

  List<AddressModel> data = [];

  AddressData addressData = AddressData(Get.find<Crud>());

  MyServices myServices = Get.find();

  deleteAddress(int addressid) {
    addressData.deleteAddress(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  viewAddress() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.viewAddress(
      myServices.sharedPreferences.getString("id")!,
    );
    // log("responseFromViewAddressController : $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  goToEditAddress(addressModel) {
    Get.to(() => const EditAddress(),
        transition: Transition.rightToLeft,
        arguments: {
          "addressModel": addressModel,
        });
  }

  @override
  void onInit() {
    viewAddress();
    super.onInit();
  }
}
