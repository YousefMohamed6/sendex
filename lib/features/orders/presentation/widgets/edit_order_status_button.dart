import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendex/core/enums/order_status.dart';
import 'package:sendex/features/orders/data/model/order_model.dart';
import 'package:sendex/features/orders/presentation/manager/order_cubit.dart';

class EditOrderStatus extends StatelessWidget {
  const EditOrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderModel order = context.watch<OrderCubit>().selectedOrder;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Order Status: ${order.orderStatus}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        PopupMenuButton(
          icon: const Icon(Icons.edit),
          onSelected:
              (value) => context.read<OrderCubit>().updateStatus(
                orderModel: order,
                status: value.name,
              ),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: OrderStatus.pending,
                child: Text(
                  OrderStatus.pending.name,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: Colors.orange),
                ),
              ),
              PopupMenuItem(
                value: OrderStatus.delivered,
                child: Text(
                  OrderStatus.delivered.name,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: Colors.green),
                ),
              ),
              PopupMenuItem(
                value: OrderStatus.cancelled,
                child: Text(
                  OrderStatus.cancelled.name,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: Colors.red),
                ),
              ),
            ];
          },
        ),
      ],
    );
  }
}
