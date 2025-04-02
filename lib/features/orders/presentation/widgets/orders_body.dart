import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendex/core/utils/helper/show_message.dart';
import 'package:sendex/core/widgets/background.dart';
import 'package:sendex/features/orders/data/model/order_model.dart';
import 'package:sendex/features/orders/presentation/manager/order_cubit.dart';
import 'package:sendex/features/orders/presentation/widgets/order_item.dart';
import 'package:sendex/generated/app_localizations.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocConsumer<OrderCubit, OrderState>(
        buildWhen:
            (previous, current) =>
                current is Loading<List<OrderModel>> ||
                current is Success<List<OrderModel>> ||
                current is Failure<List<OrderModel>>,

        builder:
            (context, state) => state.when(
              initial: () => const Center(child: SizedBox()),
              loading: () => const Center(child: CircularProgressIndicator()),
              success:
                  (orders) => ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index] as OrderModel;
                      return OrderItem(order: order);
                    },
                  ),
              failure: (error) => Center(child: Text(error)),
            ),
        listener: (context, state) {
          if (state is Failure<List<OrderModel>>) {
            ShowMessage.show(context, msg: AppLocalizations.of(context)!.fail);
          }
        },
      ),
    );
  }
}
