import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Consumer;

import '../../providers/app_state_provider.dart';
import '../../utils/sizes/sizes.dart';
import '../splash/splash_screen.dart';
import 'views/about_view.dart';
import 'views/contacts_view.dart';
import 'views/experience_view.dart';
import 'views/hero_view.dart';
import 'views/skills_view.dart';
import 'widgets/hero_widgets/resume_download_button.dart';
import 'widgets/hero_widgets/theme_switcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final sizes = Sizes();
    final theme = Theme.of(context);

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
                          HeroView(scrollController: scrollController),
                          SizedBox(height: sizes.spacer(context) / 1.5),
                          SkillsView(),
                          SizedBox(height: sizes.spacer(context) / 1.5),
                          ExperienceView(),
                          SizedBox(height: sizes.spacer(context) / 1.5),
                          AboutView(),
                          SizedBox(height: sizes.spacer(context) / 1.5),
                          ContactsView(),
                          SizedBox(height: sizes.spacer(context) / 1.5),
                        ],
                      ),
                      ThemeSwitcher(),
                      ResumeDownloadButton(theme: theme)
                    ],
                  ),
                ),
        );
      },
    );
  }
}
