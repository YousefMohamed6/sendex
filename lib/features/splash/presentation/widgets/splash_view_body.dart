import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sendex/core/utils/constants/app_images.dart';
import 'package:sendex/core/widgets/asset_image.dart';
import 'package:sendex/core/widgets/background.dart';
import 'package:sendex/features/auth/login/presentation/views/login_view.dart';
import 'package:sendex/features/orders/presentation/views/orders_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    handleNavigation();
    super.initState();
  }

  Future<void> handleNavigation() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        context.goNamed(OrdersView.routeName);
      } else {
        context.goNamed(LoginView.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CustomAssetImage(imagePath: AppImages.kAppLogo)),
        ],
      ),
    );
  }
}
