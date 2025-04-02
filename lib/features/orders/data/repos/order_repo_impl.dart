import 'package:sendex/core/services/api_service.dart';
import 'package:sendex/features/orders/data/model/order_model.dart';
import 'package:sendex/features/orders/domin/repos/i_order_repo.dart';

class OrderRepoImpl implements IOrderRepo {
  final ApiService apiService;
  OrderRepoImpl({required this.apiService});
  @override
  Future<List<OrderModel>> fetchOrders() async {
    final response = await Future.delayed(
      const Duration(seconds: 3),
      () => [
        <String, dynamic>{
          'clientName': 'Yousef Mohammed',
          'clientPhone': '1234567890',
          'clientAddress': '123 Main St, New York, USA',
          'clientEmail': 'TlMxH@example.com',
          'notes': 'Handle with care',
          'orderId': '1',
          'orderName': 'Order 1',
          'orderDate':
              DateTime.now()
                  .subtract(const Duration(days: 3))
                  .toIso8601String(),
          'orderStatus': 'Pending',
        },
        {
          'clientName': 'Omar Marmoush',
          'clientPhone': '987-654-3210',
          'clientAddress': '456 Elm St, San Francisco, USA',
          'clientEmail': 'ylFZM@example.com',
          'notes': 'Special instructions',
          'orderId': '2',
          'orderName': 'Order 2',
          'orderDate':
              DateTime.now()
                  .subtract(const Duration(days: 2))
                  .toIso8601String(),
          'orderStatus': 'Delivered',
        },
        {
          'clientName': 'Mo Salah',
          'clientPhone': '698-765-4321',
          'clientAddress': '789 Oak St, California, USA',
          'clientEmail': 'FkKt0@example.com',
          'notes': 'Urgent delivery',
          'orderId': '3',
          'orderName': 'Order 3',
          'orderDate':
              DateTime.now()
                  .subtract(const Duration(days: 3))
                  .toIso8601String(),
          'orderStatus': 'Cancelled',
        },
      ],
    );
    return response.map((order) {
      return OrderModel.fromJson(order);
    }).toList();
  }
}
