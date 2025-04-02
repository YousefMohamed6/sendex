import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sendex/core/widgets/custom_text_button.dart';
import 'package:sendex/features/auth/rest_Password/persentation/view/rest_password_view.dart';
import 'package:sendex/generated/app_localizations.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTextButton(
          text: AppLocalizations.of(context)!.forget_password,
          onPressed: () {
            context.pushNamed(RestPasswordView.routeName);
          },
        ),
      ],
    );
  }
}
