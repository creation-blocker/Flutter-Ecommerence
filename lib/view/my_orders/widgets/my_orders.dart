import 'package:demo_app/utils/app_textstyle.dart';
import 'package:demo_app/view/my_orders/components/order_card.dart';
import 'package:demo_app/view/my_orders/models/order.dart';
import 'package:demo_app/view/my_orders/repositories/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrders extends StatelessWidget {
  final OrderRepository _repository = OrderRepository();
  MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
            'My Orders',
            style: AppTextstyle.withColor(
              AppTextstyle.h3,
              isDark ? Colors.white : Colors.black,
            ),
          ),
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor:
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(text: 'Active'),
              Tab(text: 'Complete'),
              Tab(text: 'Caneclled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrderList(context, OrderStatus.active),
            _buildOrderList(context, OrderStatus.completed),
            _buildOrderList(context, OrderStatus.cancelled),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(BuildContext context, OrderStatus status) {
    final order = _repository.getOrdersByStatus(status);

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: order.length,
      itemBuilder:
          (context, index) =>
              OrderCard(order: order[index], onViewDetails: () {}),
    );
  }
}
