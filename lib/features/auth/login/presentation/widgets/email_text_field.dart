import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendex/core/widgets/custom_form_field.dart';
import 'package:sendex/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:sendex/generated/app_localizations.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.emailAddress,
      prefixIcon: const Icon(Icons.email_outlined),
      lablelText: AppLocalizations.of(context)!.email,
      hintText: AppLocalizations.of(context)!.enter_email,
      controller: BlocProvider.of<LoginCubit>(context).emailTextController,
    );
  }
}
