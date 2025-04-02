import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sendex/features/orders/data/model/order_model.dart';
import 'package:sendex/features/orders/domin/use_cases/fetch_all_orders_use_case.dart';

part 'order_cubit.freezed.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final FetchAllOrdersUseCase _fetchAllOrdersUseCase;
  OrderCubit(this._fetchAllOrdersUseCase) : super(OrderState.initial());

  Future<void> fetchOrders() async {
    try {
      emit(OrderState<List<OrderModel>>.loading());
      final List<OrderModel> orders = await _fetchAllOrdersUseCase.execute();
      emit(OrderState<List<OrderModel>>.success(orders));
    } catch (e) {
      emit(OrderState<List<OrderModel>>.failure(e.toString()));
    }
  }
}
