import 'package:sendex/features/orders/data/model/order_model.dart';

abstract class IOrderRepo {
  Future<List<OrderModel>> fetchOrders();
}
