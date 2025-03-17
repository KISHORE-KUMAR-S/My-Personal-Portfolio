import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart' show Consumer, ReadContext;

import '../../providers/app_state_provider.dart';
import '../../utils/extensions/context_extensions.dart';
import '../splash/splash_screen.dart';
import 'views/about_view.dart';
import 'views/contacts_view.dart';
import 'views/experience_view.dart';
import 'views/works_view.dart';
import 'views/hero_view.dart';
import 'views/skills_view.dart';
import 'widgets/hero_widgets/resume_download_button.dart';
import 'widgets/hero_widgets/theme_switcher.dart';
import 'widgets/hero_widgets/toggle_mode.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLightMode = context.read<AppStateProvider>().isLightMode;

    return Consumer<AppStateProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: !provider.isSplashAnimationDone
              ? SplashScreen(key: ValueKey(0))
              : Scaffold(
                  body: Stack(
                    children: [
                      ListView(
                        controller: scrollController,
                        physics: provider.isNavbarOpen
                            ? NeverScrollableScrollPhysics()
                            : null,
                        children: [
                          // HeroView(scrollController: scrollController),
                          // SizedBox(height: context.spacer / 1.5),
                          // SkillsView(),
                          // SizedBox(height: context.spacer / 1.5),
                          // ExperienceView(),
                          SizedBox(height: context.spacer / 1.5),
                          WorksView(provider: provider),
                          SizedBox(height: context.spacer / 1.5),
                          // AboutView(),
                          // SizedBox(height: context.spacer / 1.5),
                          // ContactsView(),
                          // SizedBox(height: context.spacer / 1.5),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   spacing: 20,
                          //   children: [
                          //     Icon(
                          //       FontAwesomeIcons.trowelBricks,
                          //       color:
                          //           isLightMode ? Colors.black : Colors.white,
                          //       size: 20,
                          //     ),
                          //     AutoSizeText(
                          //       "Under Construction. Enjoy the beta-version now.",
                          //       style: theme.textTheme.titleLarge,
                          //       minFontSize: 10,
                          //       maxFontSize: 20,
                          //       wrapWords: true,
                          //       softWrap: true,
                          //     )
                          //   ],
                          // ),
                          SizedBox(height: context.spacer / 1.5),
                        ],
                      ),
                      ThemeSwitcher(),
                      ResumeDownloadButton(theme: theme),
                      ToggleMode(theme: theme, provider: provider),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
