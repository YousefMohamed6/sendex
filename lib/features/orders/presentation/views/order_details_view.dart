import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendex/features/orders/data/model/order_model.dart';
import 'package:sendex/features/orders/presentation/manager/order_cubit.dart';
import 'package:sendex/features/orders/presentation/widgets/order_details_body.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});
  static const String routeName = '/orderDetails';
  @override
  Widget build(BuildContext context) {
    final OrderModel orderModel = context.read<OrderCubit>().selectedOrder;
    return Scaffold(
      appBar: AppBar(title: Text(orderModel.orderName)),
      body: OrderDetailsBody(),
    );
  }
}
