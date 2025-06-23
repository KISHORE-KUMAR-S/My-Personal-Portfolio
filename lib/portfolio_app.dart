import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Widget, MaterialApp;
import 'package:provider/provider.dart' show Consumer;

import 'providers/app_state_provider.dart';
import 'router/router.dart' show router;
import 'utils/config/env.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  static String _pkg = 'personal_portfolio';
  static String? get pkg => Env.getPackage(_pkg);
  static String get bundle => Env.getBundle(_pkg);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, provider, child) {
        return MaterialApp.router(
          title: "Kishore Kumar S",
          debugShowCheckedModeBanner: false,
          theme: provider.currentTheme,
          routerConfig: router,
        );
      },
    );
  }
}
