import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sendex/core/utils/error_handler/auth_error_handler.dart';
import 'package:sendex/core/utils/helper/show_message.dart';
import 'package:sendex/core/widgets/background.dart';
import 'package:sendex/features/auth/login/presentation/views/login_view.dart';
import 'package:sendex/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:sendex/features/auth/register/presentation/widgets/register_form.dart';
import 'package:sendex/generated/app_localizations.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is Success<bool> && state.data) {
            ShowMessage.show(
              context,
              msg: AppLocalizations.of(context)!.success,
            );
            context.pushReplacementNamed(LoginView.routeName);
          } else if (state is Failure<String>) {
            ShowMessage.show(
              context,
              msg: AuthErrorHandler.getErrorMessage(
                errorMessage: state.message,
                context: context,
              ),
            );
          }
        },
        buildWhen: (previous, current) => current is UpdateUI,
        builder: (context, state) {
          if (state is Loading<bool>) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return RegistetForm();
          }
        },
      ),
    );
  }
}
