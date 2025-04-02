import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendex/core/widgets/custom_text.dart';
import 'package:sendex/features/auth/rest_Password/persentation/widgets/rest_password_view_body.dart';
import 'package:sendex/generated/app_localizations.dart';

class RestPasswordView extends StatelessWidget {
  const RestPasswordView({super.key});
  static const String routeName = "/ForgetPassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.rest_password,
          fontSize: 20.sp,
          color: Colors.white,
        ),
      ),
      body: ForgetPasswodBody(),
    );
  }
}
