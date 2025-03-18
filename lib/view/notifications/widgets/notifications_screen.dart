import 'package:demo_app/utils/app_textstyle.dart';
import 'package:demo_app/view/notifications/models/notification_type.dart';
import 'package:demo_app/view/notifications/repositories/notification_repository.dart';
import 'package:demo_app/view/notifications/uitis/notification_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {
  final NotificationRepository _repository = NotificationRepository();
  NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final notifications = _repository.getNotifications();
    return Scaffold(
      appBar: AppBar(
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
          'Notifications',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Mark all as read',
              style: AppTextstyle.withColor(
                AppTextstyle.bodyMedium,
                Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder:
            (context, index) =>
                _buildNotificationCard(context, notifications[index]),
      ),
    );
  }

  Widget _buildNotificationCard(
    BuildContext context,
    NotificationItem notification,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color:
            notification.isRead
                ? Theme.of(context).primaryColor.withOpacity(0.1)
                : Theme.of(context).primaryColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color:
                isDark
                    ? Colors.black.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.1),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: NotificationUtils.getIconBackgroundColor(
              context,
              notification.type,
            ),
            shape: BoxShape.circle,
          ),
          child: Icon(
            NotificationUtils.getNotificationIcon(notification.type),
            color: NotificationUtils.getIconColor(context, notification.type),
          ),
        ),
        title: Text(
          notification.title,
          style: AppTextstyle.withColor(
            AppTextstyle.bodyLarge,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 4),
            Text(
              notification.message,
              style: AppTextstyle.withColor(
                AppTextstyle.bodySmall,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
          ],
        ),
        onTap: () {
          //Navigate to Notifciation Details
        },
      ),
    );
  }
}
