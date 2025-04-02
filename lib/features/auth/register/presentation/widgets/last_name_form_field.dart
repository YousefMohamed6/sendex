import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendex/core/widgets/custom_form_field.dart';
import 'package:sendex/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:sendex/l10n.dart';

class LastNameFormField extends StatelessWidget {
  const LastNameFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomFormField(
        textInputType: TextInputType.name,
        prefixIcon: const Icon(Icons.person_2_outlined),
        lablelText: AppLocalizations.of(context)!.last_name,
        hintText: AppLocalizations.of(context)!.last_name,
        controller:
            BlocProvider.of<RegisterCubit>(context).lastNameTextController,
      ),
    );
  }
}
