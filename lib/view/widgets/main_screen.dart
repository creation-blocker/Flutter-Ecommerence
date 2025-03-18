import 'package:demo_app/controllers/navigation_controller.dart';
import 'package:demo_app/controllers/theme_controller.dart';
import 'package:demo_app/view/widgets/account_screen.dart';
import 'package:demo_app/view/widgets/components/custom_navigationbar.dart';
import 'package:demo_app/view/widgets/home_screen.dart';
import 'package:demo_app/view/widgets/shopping_screen.dart';
import 'package:demo_app/view/widgets/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.put(
      NavigationController(),
    );
    return GetBuilder<ThemeController>(
      builder:
          (themeController) => Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: AnimatedSwitcher(
              duration: const Duration(microseconds: 200),
              child: Obx(
                () => IndexedStack(
                  key: ValueKey(navigationController.currentIndex.value),
                  index: navigationController.currentIndex.value,
                  children: [
                    HomeScreen(),
                    ShoppingScreen(),
                    WishlistScreen(),
                    AccountScreen(),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: CustomNavigationbar(),
          ),
    );
  }
}
