import 'package:flutter/material.dart';
import 'package:sendex/features/settings/presentation/widgets/setting_view_body.dart';

class SettingsView extends StatelessWidget {
  static String routeName = '/Setting';
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SettingsViewBody()));
  }
}
