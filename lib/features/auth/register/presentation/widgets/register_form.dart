import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendex/core/utils/constants/app_images.dart';
import 'package:sendex/core/widgets/custom_circle_avatar.dart';
import 'package:sendex/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:sendex/features/auth/register/presentation/widgets/address_form_field.dart';
import 'package:sendex/features/auth/register/presentation/widgets/email_form_field.dart';
import 'package:sendex/features/auth/register/presentation/widgets/first_name_form_field.dart';
import 'package:sendex/features/auth/register/presentation/widgets/last_name_form_field.dart';
import 'package:sendex/features/auth/register/presentation/widgets/password_form_field.dart';
import 'package:sendex/features/auth/register/presentation/widgets/register_button.dart';

class RegistetForm extends StatelessWidget {
  const RegistetForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<RegisterCubit>(context).formKey,
      child: ListView(
        children: [
          SizedBox(height: 24.h),
          CustomCircleAvatar(imagePath: AppImages.kAppLogo),
          SizedBox(height: 24.h),
          Row(children: [FirstNameFormField(), LastNameFormField()]),
          EmailFormField(),
          PasswordFormField(),
          AddressFormField(),
          SizedBox(height: 16.h),
          RegisterButton(),
        ],
      ),
    );
  }
}
