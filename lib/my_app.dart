import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendex/core/services/router_manager.dart';
import 'package:sendex/core/theme/theme_data/dark_theme.dart';
import 'package:sendex/core/theme/theme_data/light_theme.dart';
import 'package:sendex/features/settings/presentation/manager/setting_bloc.dart';
import 'package:sendex/generated/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp._();
  static const instance = MyApp._();
  factory MyApp() => instance;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              SettingsBloc()
                ..add(GetTheme())
                ..add(GetLocalization()),
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return CustomMaterialApp();
        },
      ),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsBloc bloc = context.watch<SettingsBloc>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      locale: Locale(bloc.local),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: bloc.isDark ? darkTheme : lightTheme,
      routerConfig: RouterManager.routConfig,
    );
  }
}
