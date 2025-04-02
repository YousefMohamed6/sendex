import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sendex/features/orders/data/model/order_model.dart';
import 'package:sendex/features/orders/presentation/views/order_details_view.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(order.clientName),
        subtitle: Text(order.clientAddress),
        trailing: Text(order.orderStatus),
        onTap: () {
          context.pushNamed(OrderDetailsView.routeName, extra: order);
        },
      ),
    );
  }
}
