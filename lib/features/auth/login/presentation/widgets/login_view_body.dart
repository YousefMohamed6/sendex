import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sendex/core/utils/error_handler/auth_error_handler.dart';
import 'package:sendex/core/utils/helper/show_message.dart';
import 'package:sendex/core/widgets/background.dart';
import 'package:sendex/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:sendex/features/auth/login/presentation/widgets/login_view_form.dart';
import 'package:sendex/features/orders/presentation/views/orders_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is Success<bool> && state.data) {
            context.goNamed(OrdersView.routeName);
          } else if (state is Failure) {
            final String message = AuthErrorHandler.getErrorMessage(
              context: context,
              errorMessage: state.errMessage,
            );
            ShowMessage.show(context, msg: message);
          }
        },
        buildWhen: (previous, current) => current is UpdateUI,
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const LoginViewForm();
          }
        },
      ),
    );
  }
}
