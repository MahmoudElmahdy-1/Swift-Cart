import 'package:ecommerceapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

class FavoriteService extends GetxController {
  final RxMap<int, bool> _favorites = <int, bool>{}.obs;
  bool isFavorite(int itemId) => _favorites[itemId] ?? false;
  
  void toggleFavorite(int itemId) {
    _favorites[itemId] = !isFavorite(itemId);
  }
  void initializeFavorites(Map<int, bool> initialStatus) {
    _favorites.value = initialStatus;
  }
  void clearFavorites() {
    _favorites.clear();
  }
}

initializeServices() async {
  await Get.putAsync(() => MyServices().init());
   Get.put(FavoriteService());
}
