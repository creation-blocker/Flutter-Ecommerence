import 'package:demo_app/view/my_orders/models/order.dart';

class OrderRepository {
  List<Order> getOrders() {
    return [
      Order(
        OrderNumber: '123456',
        itemCount: 2,
        totalAmount: 2938.9,
        status: OrderStatus.active,
        imageUrl: 'assets/images/shoe1.png',
        orderDate: DateTime.now().subtract(Duration(hours: 2)),
      ),
      Order(
        OrderNumber: '322456',
        itemCount: 1,
        totalAmount: 438.9,
        status: OrderStatus.active,
        imageUrl: 'assets/images/shoe3.png',
        orderDate: DateTime.now().subtract(Duration(hours: 1)),
      ),
      Order(
        OrderNumber: '41456',
        itemCount: 4,
        totalAmount: 7624.9,
        status: OrderStatus.active,
        imageUrl: 'assets/images/shoe6.png',
        orderDate: DateTime.now().subtract(Duration(hours: 1)),
      ),
      Order(
        OrderNumber: '2456',
        itemCount: 1,
        totalAmount: 342,
        status: OrderStatus.completed,
        imageUrl: 'assets/images/shoe4.png',
        orderDate: DateTime.now().subtract(Duration(hours: 3)),
      ),
      Order(
        OrderNumber: '11256',
        itemCount: 1,
        totalAmount: 1330.292,
        status: OrderStatus.completed,
        imageUrl: 'assets/images/shoe4.png',
        orderDate: DateTime.now().subtract(Duration(hours: 2)),
      ),
      Order(
        OrderNumber: '231442',
        itemCount: 5,
        totalAmount: 319.4,
        status: OrderStatus.cancelled,
        imageUrl: 'assets/images/shoe5.jpg',
        orderDate: DateTime.now().subtract(Duration(hours: 2)),
      ),
    ];
  }

  List<Order> getOrdersByStatus(OrderStatus status) {
    return getOrders().where((order) => order.status == status).toList();
  }
}
