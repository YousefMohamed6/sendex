import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendex/core/widgets/custom_text.dart';
import 'package:sendex/features/auth/register/presentation/widgets/registet_view_body.dart';
import 'package:sendex/l10n.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String routeName = '/RegisterView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.register,
          fontSize: 20.sp,
          color: Colors.white,
        ),
      ),
      body: const RegisterViewBody(),
    );
  }
}
