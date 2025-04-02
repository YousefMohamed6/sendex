import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sendex/core/widgets/custom_text.dart';
import 'package:sendex/features/auth/login/presentation/views/login_view.dart';
import 'package:sendex/features/settings/presentation/manager/setting_bloc.dart';
import 'package:sendex/generated/app_localizations.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<SettingsBloc>();
    return SettingsList(
      brightness: Theme.of(context).brightness,
      sections: [
        SettingsSection(
          title: Text(AppLocalizations.of(context)!.common),
          tiles: <SettingsTile>[
            SettingsTile.switchTile(
              initialValue: bloc.isDark,
              leading: Icon(Icons.format_paint),
              title: CustomText(text: AppLocalizations.of(context)!.theme),
              onToggle: (value) {
                bloc.add(UpdateTheme());
              },
            ),
            SettingsTile.switchTile(
              initialValue: bloc.local == 'ar',
              leading: Icon(Icons.language),
              title: CustomText(text: AppLocalizations.of(context)!.language),
              onToggle: (value) {
                bloc.add(UpdateLocalization(local: value ? 'ar' : 'en'));
              },
            ),
          ],
        ),

        SettingsSection(
          title: CustomText(text: AppLocalizations.of(context)!.account),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.logout_outlined),
              title: CustomText(text: AppLocalizations.of(context)!.sign_out),
              onPressed: (context) async {
                await FirebaseAuth.instance.signOut();
                if (context.mounted) {
                  context.pushReplacementNamed(LoginView.routeName);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
