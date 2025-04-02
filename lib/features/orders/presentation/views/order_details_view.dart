import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendex/core/widgets/background.dart';
import 'package:sendex/features/orders/data/model/order_model.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.orderModel});
  final OrderModel orderModel;
  static const String routeName = '/orderDetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(orderModel.orderName)),
      body: Background(
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
            Text(
              'Order Status: ${orderModel.orderStatus}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
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
      ),
    );
  }
}
