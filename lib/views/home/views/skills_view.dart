import 'package:entry/entry.dart' show Entry;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;
import 'package:provider/provider.dart' show ReadContext;
import '../../../providers/app_state_provider.dart';
import '../../../utils/animations/stick_animation.dart';
import '../../../utils/config/constants.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../widgets/section_title.dart';
import '../widgets/skills_widgets/skills_builder.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isLightMode = context.read<AppStateProvider>().isLightMode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: context.screenHeight * 0.06,
      children: [
        _buildSectionTitle(theme, context),
        StickAnimation(color: isLightMode ? Colors.black : Colors.white),
        _buildSkillsSection(context, theme),
      ],
    );
  }

  Widget _buildSectionTitle(ThemeData theme, BuildContext context) {
    return SectionTitle(title: "Skills", backgroundText: "Expertise");
  }

  Widget _buildSkillsSection(BuildContext context, ThemeData theme) {
    return Container(
      constraints: BoxConstraints(maxWidth: 1500),
      margin: EdgeInsets.symmetric(horizontal: context.isMobile ? 30 : 100),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        runSpacing: 50,
        children: [
          Entry.opacity(
            delay: Constants.mediumDelay,
            child: SkillsBuilder(
              theme: theme,
              title: "Programming Languages",
              subtitle: "Logic defines everything",
              items: [
                {"icon": FontAwesomeIcons.dartLang, "text": "Dart"},
                {"icon": FontAwesomeIcons.java, "text": "Java"},
              ],
            ),
          ),
          Entry.opacity(
            delay: Constants.mediumDelay * 1.25,
            child: SkillsBuilder(
              theme: theme,
              title: "Tools and Technologies",
              subtitle: "Saves Time",
              items: [
                {
                  "icon": AssetImage('assets/images/firebase.png'),
                  "text": "Firebase",
                  "isImageIcon": true,
                },
                {
                  "icon": FontAwesomeIcons.flutter,
                  "text": "Flutter",
                },
                {
                  "icon": FontAwesomeIcons.git,
                  "text": "Git",
                },
                {
                  "icon": FontAwesomeIcons.github,
                  "text": "Github",
                },
                {
                  "icon": Iconsax.code,
                  "text": "Rest API Integration",
                },
                {
                  "icon": FontAwesomeIcons.uikit,
                  "text": "UI / UX Design",
                },
              ],
            ),
          ),
          Entry.opacity(
            delay: Constants.mediumDelay * 1.5,
            child: SkillsBuilder(
              theme: theme,
              title: "State Management",
              subtitle: "Defines behaviour",
              items: [
                {
                  "icon": AssetImage('assets/images/get_x.png'),
                  "text": "GetX",
                  "isImageIcon": true,
                },
                {
                  "icon": AssetImage('assets/images/riverpod.png'),
                  "text": "Riverpod",
                  "isImageIcon": true,
                },
                {"icon": FontAwesomeIcons.dartLang, "text": "Provider"},
              ],
            ),
          ),
        ],
      ),
    );
  }
}
