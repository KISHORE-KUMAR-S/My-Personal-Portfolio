import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_state_provider.dart';
import '../../../../utils/config/theme_config.dart';
import 'theme_switcher.dart';
import 'theme_toggle_button.dart';

class ThemeSwitcherMobile extends StatefulWidget {
  const ThemeSwitcherMobile({super.key});

  @override
  State<ThemeSwitcherMobile> createState() => _ThemeSwitcherMobileState();
}

class _ThemeSwitcherMobileState extends State<ThemeSwitcherMobile> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AppStateProvider>();
    final allThemes = ThemeConfig.allThemes();

    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      left: 20,
      bottom: isOpened ? 30 : 10,
      child: !isOpened
          ? ThemeToggleButton(
              color: allThemes[0].colorScheme.secondary,
              index: provider.currentIndex,
              isActive: true,
              onTap: () => setState(() => isOpened = !isOpened),
            )
          : Entry.offset(
              yOffset: 300,
              child: SizedBox(
                width: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < allThemes.length; i++) ...[
                      ThemeToggleButton(
                        color: allThemes[i].colorScheme.secondary,
                        index: i,
                        isActive: true,
                        onTap: () {
                          context.read<AppStateProvider>().updateThemeIndex(i);
                          setState(() => isOpened = !isOpened);
                        },
                      ),
                      if (i < allThemes.length - 1) buildSpacer(),
                    ]
                  ],
                ),
              ),
            ),
    );
  }
}
