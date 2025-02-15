import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart' show Consumer;

import '../../providers/app_state_provider.dart';
import '../../utils/sizes/sizes.dart';
import '../splash/splash_screen.dart';
import 'views/contacts_view.dart';
import 'views/hero_view.dart';
import 'views/skills_view.dart';
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
          child:
              // !provider.isSplashAnimationDone
              //     ? SplashScreen(key: ValueKey(0))
              //     :
              Scaffold(
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
                    ContactsView(),
                    SizedBox(height: sizes.spacer(context) / 1.5),
                  ],
                ),
                ThemeSwitcher(),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white.withValues(alpha: 0.3)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Colors.transparent.withValues(alpha: 0.1)),
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Iconsax.document_download,
                        size: 20,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Resume",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
