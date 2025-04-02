import 'package:flutter/material.dart';
import 'package:sendex/features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SplashViewBody());
  }
}
