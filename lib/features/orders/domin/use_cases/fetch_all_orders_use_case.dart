import 'package:sendex/features/orders/data/model/order_model.dart';
import 'package:sendex/features/orders/domin/repos/i_order_repo.dart';

class FetchAllOrdersUseCase {
  final IOrderRepo _ordersRepo;

  FetchAllOrdersUseCase(this._ordersRepo);

  Future<List<OrderModel>> execute() async {
    return await _ordersRepo.fetchOrders();
  }
}
