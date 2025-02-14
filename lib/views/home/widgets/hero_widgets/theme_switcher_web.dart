import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_state_provider.dart';
import '../../../../utils/config/constants.dart';
import '../../../../utils/config/theme_config.dart';
import 'theme_switcher.dart';
import 'theme_toggle_button.dart';

class ThemeSwitcherWeb extends StatelessWidget {
  const ThemeSwitcherWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final allThemes = ThemeConfig.allThemes();
    return Positioned(
      right: 20,
      bottom: 0,
      top: 0,
      child: Consumer<AppStateProvider>(
        builder: (BuildContext context, provider, Widget? child) {
          return provider.isNavbarOpen
              ? SizedBox.shrink()
              : Entry.all(
                  delay: Constants.smallDelay,
                  xOffset: -20,
                  yOffset: 0,
                  scale: 1,
                  duration: Constants.smallDelay,
                  child: SizedBox(
                      width: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < allThemes.length; i++) ...[
                            _buildThemeToggleButtons(
                              allThemes,
                              i,
                              provider,
                              context,
                            ),
                            if (i < allThemes.length - 1) buildSpacer(),
                          ]
                        ],
                      )),
                );
        },
      ),
    );
  }

  Widget _buildThemeToggleButtons(
    List<ThemeData> allThemes,
    int i,
    AppStateProvider provider,
    BuildContext context,
  ) {
    return ThemeToggleButton(
      color: allThemes[i].colorScheme.secondary,
      index: i,
      isActive: i == provider.currentIndex,
      onTap: () => context.read<AppStateProvider>().updateThemeIndex(i),
    );
  }
}
