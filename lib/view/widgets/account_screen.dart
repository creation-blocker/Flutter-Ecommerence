import 'package:demo_app/controllers/auth_controller.dart';
import 'package:demo_app/utils/app_textstyle.dart';
import 'package:demo_app/view/my_orders/widgets/my_orders.dart';
import 'package:demo_app/view/shipping_address/widgets/shipping_address.dart';
import 'package:demo_app/view/widgets/settings_screen.dart';
import 'package:demo_app/view/widgets/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'My Account',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => SettingsScreen());
            },
            icon: Icon(
              Icons.settings_outlined,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileSection(context),
            const SizedBox(height: 16),
            _buildMenuSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850]! : Colors.grey[100],
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/icons/user.png'),
          ),
          const SizedBox(height: 16),
          Text(
            'Saw Aung Kyaw Thu',
            style: AppTextstyle.withColor(
              AppTextstyle.h2,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'creationblocker@gmail.com',
            style: AppTextstyle.withColor(
              AppTextstyle.bodyMedium,
              isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              side: BorderSide(color: isDark ? Colors.white70 : Colors.black12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Edit Profile',
              style: AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final menuItem = [
      {'icon': Icons.shopping_bag_outlined, 'title': 'My Orders'},
      {'icon': Icons.location_on_outlined, 'title': 'Shipping Address'},
      {'icon': Icons.help_outline, 'title': 'Help Center'},
      {'icon': Icons.logout_outlined, 'title': 'Logout'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children:
            menuItem.map((item) {
              return Container(
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color:
                          isDark
                              ? Colors.black.withOpacity(0.2)
                              : Colors.grey.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(
                    item['icon'] as IconData,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    item['title'] as String,
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                  onTap: () {
                    if (item['title'] == 'Logout') {
                      _showLogoutDialog(context);
                    } else if (item['title'] == 'My Orders') {
                      //navigate to my order screen
                      Get.to(() => MyOrders());
                    } else if (item['title'] == 'Shipping Address') {
                      Get.to(() => ShippingAddress());
                    } else if (item['title'] == 'Help Center') {
                      //navigate to help center screen
                    }
                  },
                ),
              );
            }).toList(),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Get.dialog(
      AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.logout_rounded,
                color: Theme.of(context).primaryColor,
                size: 32,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Are you sure you want to logout?',
              textAlign: TextAlign.center,
              style: AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(
                        color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: AppTextstyle.withColor(
                        AppTextstyle.buttonMedium,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final AuthController authController =
                          Get.find<AuthController>();
                      authController.logout();
                      Get.offAll(() => SigninScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Theme.of(context).primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Logout',
                      style: AppTextstyle.withColor(
                        AppTextstyle.buttonMedium,
                        Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
