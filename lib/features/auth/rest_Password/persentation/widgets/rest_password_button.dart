import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendex/core/widgets/custom_button.dart';
import 'package:sendex/core/widgets/custom_text.dart';
import 'package:sendex/features/auth/rest_Password/persentation/manager/rest_password_cubit.dart';
import 'package:sendex/l10n.dart';

class RestPasswordButtom extends StatelessWidget {
  const RestPasswordButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        var formKey = BlocProvider.of<RestPasswordCubit>(context).formKey;
        if (formKey.currentState!.validate()) {
          await BlocProvider.of<RestPasswordCubit>(context).restPassword();
        }
      },
      child: CustomText(text: AppLocalizations.of(context)!.rest),
    );
  }
}
