import 'package:ecommerceapp/view/screen/homepage_sc.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/view/screen/offers_sc.dart';
import 'package:ecommerceapp/view/screen/categories_sc.dart';
import 'package:ecommerceapp/view/screen/favoritesview_sc.dart';
import 'package:ecommerceapp/view/screen/account/account_sc.dart';

abstract class HomeScreenWithNavBarController extends GetxController {
  changePage(int index);
}

class HomeScreenWithNavBarControllerImp extends HomeScreenWithNavBarController {
  int currentIndex = 2; // Default to HomePage

  List pages = [
    const Offers(),
    const CategoriesScreen(),
    const HomePage(),
    const FavoritesView(),
    const Account(),
  ];

  @override
  void changePage(int index) {
    currentIndex = index;
    update();
  }

  //   @override
  // void onInit() {
  //   currentIndex = 2 ;
  //   super.onInit();
  // }
}
