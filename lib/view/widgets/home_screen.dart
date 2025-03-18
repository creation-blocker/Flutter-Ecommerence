// import 'package:demo_app/controllers/theme_controller.dart';
import 'package:demo_app/view/notifications/widgets/notifications_screen.dart';
import 'package:demo_app/view/widgets/all_products.dart';
import 'package:demo_app/view/widgets/cart_screen.dart';
import 'package:demo_app/view/widgets/components/category_chips.dart';
import 'package:demo_app/view/widgets/components/custom_searchbar.dart';
import 'package:demo_app/view/widgets/components/product_grid.dart';
import 'package:demo_app/view/widgets/components/sale_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            //Header Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/icons/user.png'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Saw Aung',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  //Notification Icon
                  IconButton(
                    onPressed: () {
                      Get.to(() => NotificationsScreen());
                    },
                    icon: Icon(Icons.notifications_outlined),
                  ),
                  //Shopping bag icon
                  IconButton(
                    onPressed: () {
                      Get.to(() => CartScreen());
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                  ),
                  //Theme Button
                  // GetBuilder<ThemeController>(
                  //   builder:
                  //       (controller) => IconButton(
                  //         onPressed: () => controller.toggleTheme(),
                  //         icon: Icon(
                  //           controller.isDarkMode
                  //               ? Icons.light_mode
                  //               : Icons.dark_mode,
                  //         ),
                  //       ),
                  // ),
                ],
              ),
            ),

            //Search Bar
            const CustomSearchbar(),

            //Category chips
            const CategoryChips(),

            //Sale Banner
            const SaleBanner(),

            //Popular Products
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Products',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => AllProducts());
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            //Popular Products Grid Component
            const Expanded(child: ProductGrid()),
          ],
        ),
      ),
    );
  }
}
