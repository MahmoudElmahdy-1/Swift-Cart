import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiLinks {
  // Roots
  static String? server = dotenv.env['SERVER_LINK'];

  static String test = "$server/test.php";

  // images
  static String imagesRoot = "$server/upload";
  static String imageCategories = "$imagesRoot/categories";
  static String imageItems = "$imagesRoot/items";
  static String imageOffers = "$imagesRoot/offers";
  // Auth
  static String login = "$server/auth/login.php";
  static String register = "$server/auth/register.php";
  static String verificationRegister = "$server/auth/verificationregister.php";
  static String resenddata = "$server/auth/resendcode.php";
  // Forgot Password
  static String forgotPassword = "$server/forgotpassword/forgotpassword.php";
  static String verificationResetPassword =
      "$server/forgotpassword/verificationresetpassword.php";
  static String resetPassword = "$server/forgotpassword/resetpassword.php";
  // Home Page
  static String homePage = "$server/homepage.php";
  static String items = "$server/items/items.php";
  static String search = "$server/items/search.php";
  static String categories = "$server/categories/view.php";
  // Favorite
  static String favoriteAdd = "$server/favorite/add.php";
  static String favoriteRemove = "$server/favorite/remove.php";
  static String favoriteView = "$server/favorite/view.php";
  static String removeFromFavoritePage =
      "$server/favorite/removefromfavoritepage.php";
  // Cart
  static String cartAdd = "$server/cart/add.php";
  static String cartRemove = "$server/cart/remove.php";
  static String cartGetCount = "$server/cart/getcount.php";
  static String cartView = "$server/cart/view.php";
  static String deleteItem = "$server/cart/deleteitem.php";
  // Checkout
  static String checkout = "$server/orders/checkout.php";
  // Orders
  static String pendingOrders = "$server/orders/pending.php";
  static String completedOrders = "$server/orders/completed.php";
  static String ordersDetails = "$server/orders/ordersdetails.php";
  static String cancelOrders = "$server/orders/cancel.php";
  static String ratingOrders = "$server/rating.php";
  // Address
  static String addressView = "$server/address/view.php";
  static String addressAdd = "$server/address/add.php";
  static String addressDelete = "$server/address/delete.php";
  static String addressEdit = "$server/address/edit.php";
  // Coupon
  static String checkCoupon = "$server/coupon/checkcoupon.php";
  // Notifications
  static String notifications = "$server/notifications.php";
  // Offers
  static String offers = "$server/offers.php";
}
