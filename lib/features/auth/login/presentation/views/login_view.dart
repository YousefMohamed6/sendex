import 'package:flutter/material.dart';
import 'package:sendex/core/widgets/custom_text.dart';
import 'package:sendex/features/auth/login/presentation/widgets/login_view_body.dart';
import 'package:sendex/generated/app_localizations.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String routeName = "/LoginView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: AppLocalizations.of(context)!.login),
      ),
      body: const LoginViewBody(),
    );
  }
}
