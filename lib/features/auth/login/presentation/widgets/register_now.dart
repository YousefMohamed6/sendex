import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sendex/core/widgets/custom_text.dart';
import 'package:sendex/core/widgets/custom_text_button.dart';
import 'package:sendex/features/auth/register/presentation/views/register_view.dart';
import 'package:sendex/generated/app_localizations.dart';

class RegisterNow extends StatelessWidget {
  const RegisterNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomText(
          text: AppLocalizations.of(context)!.donot_have_account,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        CustomTextButton(
          text: AppLocalizations.of(context)!.register_now,
          onPressed: () {
            context.pushNamed(RegisterView.routeName);
          },
        ),
      ],
    );
  }
}
