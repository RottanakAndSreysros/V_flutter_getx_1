import 'package:flutter_2_5_getx_1/presentation/screen/cart/cart_screen.dart';
import 'package:flutter_2_5_getx_1/presentation/screen/favorite/favorite_screen.dart';
import 'package:flutter_2_5_getx_1/presentation/screen/home/home_screen.dart';
import 'package:flutter_2_5_getx_1/presentation/screen/profile/profile_screen.dart';
import 'package:flutter_2_5_getx_1/presentation/screen/search/search_screen.dart';
import 'package:get/get.dart';

class LandingScreenController extends GetxController {
  final List listScreen = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
}
