import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:sendex/features/auth/login/data/repos/login_repo_impl.dart';
import 'package:sendex/features/auth/login/di/login_service.dart';
import 'package:sendex/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:sendex/features/auth/login/presentation/views/login_view.dart';
import 'package:sendex/features/auth/register/di/register_service.dart';
import 'package:sendex/features/auth/register/domain/repos/i_register_repo.dart';
import 'package:sendex/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:sendex/features/auth/register/presentation/views/register_view.dart';
import 'package:sendex/features/auth/rest_Password/persentation/manager/rest_password_cubit.dart';
import 'package:sendex/features/auth/rest_Password/persentation/view/rest_password_view.dart';
import 'package:sendex/features/orders/di/order_service.dart';
import 'package:sendex/features/orders/domin/repos/i_order_repo.dart';
import 'package:sendex/features/orders/presentation/manager/order_cubit.dart';
import 'package:sendex/features/orders/presentation/views/order_details_view.dart';
import 'package:sendex/features/orders/presentation/views/orders_view.dart';
import 'package:sendex/features/splash/presentation/views/splash_view.dart';

sealed class RouterManager {
  static GoRouter routConfig = GoRouter(
    initialLocation: SplashView.routeName,
    routes: [
      GoRoute(
        path: SplashView.routeName,
        builder: (context, state) {
          return SplashView();
        },
      ),
      GoRoute(
        path: LoginView.routeName,
        name: LoginView.routeName,
        builder: (context, state) {
          LoginService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.I<LoginRepoImpl>(),
            child: BlocProvider(
              create: (context) => GetIt.I<LoginCubit>(),
              child: LoginView(),
            ),
          );
        },
      ),
      GoRoute(
        path: RegisterView.routeName,
        name: RegisterView.routeName,
        builder: (context, state) {
          RegisterService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.instance<IRegisterRepo>(),
            child: BlocProvider(
              create: (context) => GetIt.instance<RegisterCubit>(),
              child: RegisterView(),
            ),
          );
        },
      ),
      GoRoute(
        path: RestPasswordView.routeName,
        name: RestPasswordView.routeName,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => RestPasswordCubit(),
            child: RestPasswordView(),
          );
        },
      ),
      GoRoute(
        path: OrdersView.routeName,
        name: OrdersView.routeName,
        builder: (context, state) {
          OrderService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.I<IOrderRepo>(),
            child: BlocProvider(
              create: (context) => GetIt.I<OrderCubit>()..fetchOrders(),
              child: OrdersView(),
            ),
          );
        },
      ),
      GoRoute(
        path: OrderDetailsView.routeName,
        name: OrderDetailsView.routeName,
        builder: (context, state) {
          final cubit = state.extra as OrderCubit;
          return BlocProvider.value(value: cubit, child: OrderDetailsView());
        },
      ),
    ],
  );
}
