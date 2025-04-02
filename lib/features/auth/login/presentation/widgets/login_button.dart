import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendex/core/widgets/custom_button.dart';
import 'package:sendex/core/widgets/custom_text.dart';
import 'package:sendex/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:sendex/generated/app_localizations.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        BlocProvider.of<LoginCubit>(context).login();
      },
      child: CustomText(
        text: AppLocalizations.of(context)!.login,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
