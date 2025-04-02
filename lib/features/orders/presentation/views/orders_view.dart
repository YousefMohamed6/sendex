import 'package:flutter/material.dart';
import 'package:sendex/features/orders/presentation/widgets/orders_body.dart';
import 'package:sendex/features/settings/presentation/views/setting_view.dart';
import 'package:sendex/generated/app_localizations.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const String routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: SettingsView()),
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.orders)),
      body: const OrdersViewBody(),
    );
  }
}
