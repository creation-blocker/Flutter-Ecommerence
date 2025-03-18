import 'package:demo_app/controllers/theme_controller.dart';
import 'package:demo_app/utils/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Settings',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(context, 'Appearance', [_buildThemeToggle(context)]),
            _buildSection(context, 'Notifications', [
              _buildSwitchTitle(
                context,
                'Push Notifications',
                'Receive push notifications about orders and promotions',
                true,
              ),
              _buildSwitchTitle(
                context,
                'Email Notifications',
                'Receive email update about your orders',
                false,
              ),
            ]),
            _buildSection(context, 'Privacy', [
              _buildNavigationTitle(
                context,
                'Privacy Policy',
                'View our privacy policy',
                Icons.privacy_tip_outlined,
              ),
              _buildNavigationTitle(
                context,
                'Terms of Service',
                'Read our terms of service',
                Icons.description_outlined,
              ),
            ]),
            _buildSection(context, 'About', [
              _buildNavigationTitle(
                context,
                'App Version',
                '1.1.0',
                Icons.info_outline,
              ),
            ]),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
          child: Text(
            title,
            style: AppTextstyle.withColor(
              AppTextstyle.h3,
              isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
          ),
        ),
        ...children,
      ],
    );
  }

  Widget _buildThemeToggle(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GetBuilder<ThemeController>(
      builder:
          (controller) => Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                controller.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'Dark Mode',
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyMedium,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              trailing: Switch.adaptive(
                value: controller.isDarkMode,
                onChanged: (value) => controller.toggleTheme(),
                activeColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
    );
  }

  Widget _buildSwitchTitle(
    BuildContext context,
    String title,
    String subTitle,
    bool initialValue,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
        title: Text(
          title,
          style: AppTextstyle.withColor(
            AppTextstyle.bodyMedium,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: AppTextstyle.withColor(
            AppTextstyle.bodySmall,
            isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
        ),
        trailing: Switch.adaptive(
          value: initialValue,
          onChanged: (value) {},
          activeColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget _buildNavigationTitle(
    BuildContext context,
    String title,
    String subTitle,
    IconData icon,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(
          title,
          style: AppTextstyle.withColor(
            AppTextstyle.bodyMedium,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: AppTextstyle.withColor(
            AppTextstyle.bodySmall,
            isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
        ),
        onTap: () {},
      ),
    );
  }
}
