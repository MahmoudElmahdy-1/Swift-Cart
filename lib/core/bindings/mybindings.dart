import 'package:ecommerceapp/controller/account/account_controller.dart';
import 'package:ecommerceapp/controller/account/notifications_controller.dart';
import 'package:ecommerceapp/controller/address/addaddress_controller.dart';
import 'package:ecommerceapp/controller/address/addlocation_controller.dart';
import 'package:ecommerceapp/controller/address/editaddress_controller.dart';
import 'package:ecommerceapp/controller/address/viewaddress_controller.dart';
import 'package:ecommerceapp/controller/auth/forgotpassword/forgotpassword_controller.dart';
import 'package:ecommerceapp/controller/auth/forgotpassword/resetpassword_controller.dart';
import 'package:ecommerceapp/controller/auth/forgotpassword/successresetpassword_controller.dart';
import 'package:ecommerceapp/controller/auth/forgotpassword/verificationresetpassword_controller.dart';
import 'package:ecommerceapp/controller/auth/login_controller.dart';
import 'package:ecommerceapp/controller/auth/register_controller.dart';
import 'package:ecommerceapp/controller/auth/successregister_controller.dart';
import 'package:ecommerceapp/controller/auth/verificationregister_controller.dart';
import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/controller/categories_controller.dart';
import 'package:ecommerceapp/controller/checkout_controller.dart';
import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/controller/itemsdetails_controller.dart';
import 'package:ecommerceapp/controller/language_controller.dart';
import 'package:ecommerceapp/controller/homescreenwithnavbar_controller.dart';
import 'package:ecommerceapp/controller/offers_controller.dart';
import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:ecommerceapp/controller/orders/completedorders_controller.dart';
import 'package:ecommerceapp/controller/orders/orderdetails_controller.dart';
import 'package:ecommerceapp/controller/orders/pendingorders_controller.dart';
import 'package:ecommerceapp/controller/orders/trackingorder_controller.dart';
import 'package:ecommerceapp/controller/searchmix_controller.dart';
import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/localization/changelocalecontroller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    // Crud Page
    Get.put(Crud());
    // MyServices
    Get.put(MyServices(), permanent: true);
    // Change local
    Get.lazyPut(() => ChangeLocaleController(), fenix: true);
    // Language Page
    Get.lazyPut(() => LanguageControllerImp(), fenix: true);
    // OnBoarding Page
    Get.lazyPut(() => OnBoardingControllerImp(), fenix: true);
    // Login Page
    Get.lazyPut(() => LoginControllerImp(), fenix: true);
    // Register Page
    Get.lazyPut(() => RegisterControllerImp(), fenix: true);
    // Success Register Page
    Get.lazyPut(() => SuccessRegisterControllerImp(), fenix: true);
    // Verification Register Page
    Get.lazyPut(() => VerificationRegisterControllerImp(), fenix: true);
    // Forgot Password Page
    Get.lazyPut(() => ForgotPasswordControllerImp(), fenix: true);
    // Reset Password Page
    Get.lazyPut(() => ResetPasswordControllerImp(), fenix: true);
    // Success Reset Password Page
    Get.lazyPut(() => SuccessResetPasswordControllerImp(), fenix: true);
    // Verification Reset Password Page
    Get.lazyPut(() => VerificationResetPasswordControllerImp(), fenix: true);
    // HomePage
    Get.lazyPut(() => HomePageControllerImp(), fenix: true);
    // Navigation Bar Controller
    Get.lazyPut(() => HomeScreenWithNavBarControllerImp(), fenix: true);
    // Categories Items Controller
    Get.lazyPut(() => ItemsControllerImp(), fenix: true);
    // Items Details Controller
    Get.lazyPut(() => ItemsdetailsControllerImp(), fenix: true);
    // Favorite Controller
    Get.lazyPut(() => FavoriteController(), fenix: true);
    // Account Controller
    Get.lazyPut(() => AccountController(), fenix: true);
    // Cart Controller
    Get.lazyPut(() => CartController(), fenix: true);
    // Checkout Controller
    Get.lazyPut(() => CheckoutController(), fenix: true);
    // Search Mix Controller
    Get.lazyPut(() => SearchMixController(), fenix: true);
    // Address Controller
    Get.lazyPut(() => AddLocationController(), fenix: true);
    Get.lazyPut(() => AddAddressController(), fenix: true);
    Get.lazyPut(() => ViewAddressController(), fenix: true);
    Get.lazyPut(() => EditAddressController(), fenix: true);
    // Orders Controller
    Get.lazyPut(() => PendingOrdersController(), fenix: true);
    Get.lazyPut(() => CompletedOrdersController(), fenix: true);
    Get.lazyPut(() => OrderdetailsController(), fenix: true);
    // Notifications Controller
    Get.lazyPut(() => NotificationsController(), fenix: true);
    // OffersController
    Get.lazyPut(() => OffersController(), fenix: true);
    // tracking order controller
    Get.lazyPut(() => TrackingOrderController(), fenix: true);
    // Categories controller
    Get.lazyPut(() => CategoriesController(), fenix: true);
  }
}
