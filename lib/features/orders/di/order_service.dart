import 'package:get_it/get_it.dart';
import 'package:sendex/core/extentions/getit_extension.dart';
import 'package:sendex/core/services/api_service.dart';
import 'package:sendex/features/orders/data/repos/order_repo_impl.dart';
import 'package:sendex/features/orders/domin/repos/i_order_repo.dart';
import 'package:sendex/features/orders/domin/use_cases/fetch_all_orders_use_case.dart';
import 'package:sendex/features/orders/presentation/manager/order_cubit.dart';

class OrderService {
  final sl = GetIt.instance;
  void initDi() {
    sl.registerLazySingletonSafely<ApiService>(() => ApiService());
    sl.registerLazySingletonSafely<IOrderRepo>(
      () => OrderRepoImpl(apiService: sl()),
    );
    sl.registerLazySingletonSafely<FetchAllOrdersUseCase>(
      () => FetchAllOrdersUseCase(sl()),
    );
    sl.registerFactorySafely<OrderCubit>(() => OrderCubit(sl()));
  }
}
