import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendex/core/utils/constants/app_images.dart';
import 'package:sendex/core/widgets/custom_circle_avatar.dart';
import 'package:sendex/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:sendex/features/auth/login/presentation/widgets/email_text_field.dart';
import 'package:sendex/features/auth/login/presentation/widgets/forget_password.dart';
import 'package:sendex/features/auth/login/presentation/widgets/login_button.dart';
import 'package:sendex/features/auth/login/presentation/widgets/password_text_field.dart';
import 'package:sendex/features/auth/login/presentation/widgets/register_now.dart';

class LoginViewForm extends StatelessWidget {
  const LoginViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<LoginCubit>(context).formKey,
      child: ListView(
        children: [
          SizedBox(height: 24.h),
          CustomCircleAvatar(imagePath: AppImages.kAppLogo),
          SizedBox(height: 24.h),
          EmailTextField(),
          SizedBox(height: 8.h),
          PasswordTextField(),
          ForgetPassword(),
          SizedBox(height: 24.h),
          LoginButton(),
          SizedBox(height: 32.h),
          RegisterNow(),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
