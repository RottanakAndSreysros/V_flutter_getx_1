import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_2_5_getx_1/core/data/controller/landing_screen_controller.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});
  final RxInt _selectedIndex = 0.obs;
  final landingScreenController = Get.put(LandingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => landingScreenController.listScreen[_selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: badges.Badge(
                position: badges.BadgePosition.topEnd(),
                badgeStyle: badges.BadgeStyle(
                  padding: EdgeInsets.all(6),
                ),
                badgeContent: Container(
                  height: 3,
                  width: 3,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
                child: Icon(Icons.shopping_cart_rounded),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex.value,
          onTap: (value) {
            _selectedIndex.value = value;
          },
        ),
      ),
    );
  }
}
