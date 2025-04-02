import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendex/core/widgets/custom_button.dart';
import 'package:sendex/core/widgets/custom_text.dart';
import 'package:sendex/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:sendex/l10n.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        BlocProvider.of<RegisterCubit>(context).registerClient();
      },
      child: CustomText(
        text: AppLocalizations.of(context)!.register,
        fontSize: 16,
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
