// ignore_for_file: unused_import
import 'package:ecommerceapp/core/constant/mypages.dart';
import 'package:ecommerceapp/test.dart';
import 'package:ecommerceapp/core/middleware/mymiddleware.dart';
import 'package:ecommerceapp/view/screen/account/contactus_sc.dart';
import 'package:ecommerceapp/view/screen/account/info_sc.dart';
import 'package:ecommerceapp/view/screen/account/notifications_sc.dart';
import 'package:ecommerceapp/view/screen/account/orders/chooseorders_sc.dart';
import 'package:ecommerceapp/view/screen/account/orders/completedorders_sc.dart';
import 'package:ecommerceapp/view/screen/account/orders/orderdetails_sc.dart';
import 'package:ecommerceapp/view/screen/account/orders/pendingorders_sc.dart';
import 'package:ecommerceapp/view/screen/account/orders/trackingorder_sc.dart';
import 'package:ecommerceapp/view/screen/address/addaddress_sc.dart';
import 'package:ecommerceapp/view/screen/address/addlocation_sc.dart';
import 'package:ecommerceapp/view/screen/address/editaddress_sc.dart';
import 'package:ecommerceapp/view/screen/address/viewaddress_sc.dart';
import 'package:ecommerceapp/view/screen/auth/forgotpassword/forgotpassword_sc.dart';
import 'package:ecommerceapp/view/screen/auth/forgotpassword/successresetpassword_sc.dart';
import 'package:ecommerceapp/view/screen/auth/login_sc.dart';
import 'package:ecommerceapp/view/screen/auth/register_sc.dart';
import 'package:ecommerceapp/view/screen/auth/forgotpassword/resetpassword_sc.dart';
import 'package:ecommerceapp/view/screen/auth/forgotpassword/verificationresetpassword_sc.dart';
import 'package:ecommerceapp/view/screen/auth/successregister_sc.dart';
import 'package:ecommerceapp/view/screen/auth/verificationregister_sc.dart';
import 'package:ecommerceapp/view/screen/cart_sc.dart';
import 'package:ecommerceapp/view/screen/checkout_sc.dart';
import 'package:ecommerceapp/view/screen/favoritesview_sc.dart';
import 'package:ecommerceapp/view/screen/items_sc.dart';
import 'package:ecommerceapp/view/screen/homepage_sc.dart';
import 'package:ecommerceapp/view/screen/homescreenwithnavbar_sc.dart';
import 'package:ecommerceapp/view/screen/itemsdetails_sc.dart';
import 'package:ecommerceapp/view/screen/language_sc.dart';
import 'package:ecommerceapp/view/screen/onboarding_sc.dart';
import 'package:ecommerceapp/view/testview.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  // TEST
  // GetPage(name: "/", page: () => const TestView()),
  // Language
  GetPage(
      name: "/",
      // page: () => const LogIn(), // test
      page: () => const MyLanguage(),
      middlewares: [MyMiddleWare()]), // middlewares: [MyMiddleWare()]
  // OnBoarding
  GetPage(name: MyPages.onBoarding, page: () => const OnBoarding()),
  // Home
  GetPage(
      name: MyPages.homeScreenWithNavBar,
      page: () => const HomeScreenWithNavBar()),
  GetPage(name: MyPages.homePage, page: () => const HomePage()),
  // Auth
  GetPage(name: MyPages.login, page: () => const LogIn()),
  GetPage(name: MyPages.register, page: () => const Register()),
  GetPage(
      name: MyPages.verificationRegister,
      page: () => const VerificationRegister()),
  GetPage(name: MyPages.successRegister, page: () => const SuccessRegister()),
  // Forgot Password
  GetPage(name: MyPages.forgotPassword, page: () => const ForgotPassword()),
  GetPage(name: MyPages.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: MyPages.verificationResetPassword,
      page: () => const VerificationResetPassword()),
  GetPage(
      name: MyPages.successResetPassword,
      page: () => const SuccessResetPassword()),
  // Items
  GetPage(name: MyPages.itemsPage, page: () => const ItemsPage()),
  // Items Details
  GetPage(name: MyPages.itemsDetails, page: () => const ItemsDetails()),
  // Favorites
  GetPage(name: MyPages.favoritesView, page: () => const FavoritesView()),
  // Cart
  GetPage(name: MyPages.cartView, page: () => const Cart()),
  // Checkout
  GetPage(name: MyPages.checkout, page: () => const Checkout()),
  // Address
  GetPage(name: MyPages.addressView, page: () => const ViewAddress()),
  GetPage(name: MyPages.locationAdd, page: () => const AddLocation()),
  GetPage(name: MyPages.addressAdd, page: () => const AddAddress()),
  GetPage(name: MyPages.addressEdit, page: () => const EditAddress()),
  // Orders
  GetPage(name: MyPages.chooseOrders, page: () => const ChooseOrders()),
  GetPage(name: MyPages.pendingOrders, page: () => const PendingOrders()),
  GetPage(name: MyPages.completedOrders, page: () => const CompletedOrders()),
  GetPage(name: MyPages.orderDetails, page: () => const OrderDetails()),
  // Notifications / My Account
  GetPage(name: MyPages.notificationsPage, page: () => const NotificationsPage()),
  // Contact us / My Account
  GetPage(name: MyPages.contactUs, page: () => const ContactUs()),
  // My Account / My Account
  GetPage(name: MyPages.myAccount, page: () => const MyAccount()),
  // Tracking Order 
  GetPage(name: MyPages.trackingOrder, page: () => const TrackingOrder()),

];
