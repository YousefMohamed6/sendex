import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendex/core/widgets/custom_form_field.dart';
import 'package:sendex/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:sendex/l10n.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.emailAddress,
      prefixIcon: const Icon(Icons.email_outlined),
      lablelText: AppLocalizations.of(context)!.email,
      hintText: AppLocalizations.of(context)!.enter_email,
      controller: BlocProvider.of<RegisterCubit>(context).emailTextController,
    );
  }
}
