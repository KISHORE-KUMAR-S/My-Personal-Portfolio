import 'package:flutter/material.dart'
    show BuildContext, MaterialApp, StatelessWidget, Widget;
import 'package:provider/provider.dart' show Consumer;

import 'providers/app_state_provider.dart';
import 'router/router.dart' show router;

class App extends StatelessWidget {
  const App({super.key});

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
