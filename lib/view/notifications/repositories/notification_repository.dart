import 'package:demo_app/view/notifications/models/notification_type.dart';

class NotificationRepository {
  List<NotificationItem> getNotifications() {
    return const [
      NotificationItem(
        title: 'Order Confirmed',
        message:
            'Your order  #123456 has been confirmed and is begin processed.',
        time: '2 minutes ago',
        type: NotificationType.order,
        isRead: true,
      ),
      NotificationItem(
        title: 'Special Offier!',
        message: 'Get 20% off on all shoes this weekend!',
        time: '1 hour ago',
        type: NotificationType.promo,
        isRead: false,
      ),
      NotificationItem(
        title: 'Out for Delivery',
        message: 'Your order  #123456 is out for delivery.',
        time: '3 hours ago',
        type: NotificationType.delivery,
        isRead: true,
      ),
      NotificationItem(
        title: 'Payment Successful',
        message: 'Payment for order #43222 was successful.',
        time: '2 minutes ago',
        type: NotificationType.payment,
        isRead: true,
      ),
    ];
  }
}
