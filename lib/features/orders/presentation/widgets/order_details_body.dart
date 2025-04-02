import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendex/core/widgets/background.dart';
import 'package:sendex/features/orders/data/model/order_model.dart';
import 'package:sendex/features/orders/presentation/manager/order_cubit.dart';
import 'package:sendex/features/orders/presentation/widgets/edit_order_status_button.dart';

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderModel orderModel = context.read<OrderCubit>().selectedOrder;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16.h,
        children: [
          Text(
            'Order ID: ${orderModel.orderId}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'Client Name: ${orderModel.clientName}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Client Address: ${orderModel.clientAddress}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Client Phone: ${orderModel.clientPhone}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          EditOrderStatus(),
          Text(
            'Order Date: ${orderModel.orderDate.toString()}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Client Email: ${orderModel.clientEmail}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Notes: ${orderModel.notes}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
