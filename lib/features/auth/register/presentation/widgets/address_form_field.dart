import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendex/core/widgets/custom_form_field.dart';
import 'package:sendex/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:sendex/l10n.dart';

class AddressFormField extends StatelessWidget {
  const AddressFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.streetAddress,
      prefixIcon: const Icon(Icons.place_outlined),
      lablelText: AppLocalizations.of(context)!.address,
      hintText: AppLocalizations.of(context)!.enter_address,
      controller: BlocProvider.of<RegisterCubit>(context).addressTextController,
    );
  }
}
