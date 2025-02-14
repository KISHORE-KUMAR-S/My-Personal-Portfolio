import 'package:auto_size_text/auto_size_text.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/config/constants.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../widgets/overlapping_text.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuerySize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Overlapping Text Animation
        Entry.opacity(
          delay: Constants.smallDelay,
          child: OverlappingText(
            text: "Skills",
            backgroundText: "Expertise",
            delay: Duration(milliseconds: 10),
            duration: Duration(milliseconds: 500),
            foregroundStyle:
                theme.textTheme.headlineLarge?.copyWith(fontSize: 50),
            backgroundStyle: TextStyle(
              fontSize: 100,
              fontFamily: 'Urbanist',
              foreground: Constants.outlinedText(context),
            ),
          ),
        ),
        SizedBox(height: mediaQuerySize.height * 0.06),
        // Skills Section
        Container(
          constraints: BoxConstraints(maxWidth: 1500),
          margin: EdgeInsets.symmetric(horizontal: context.isMobile ? 30 : 100),
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            runSpacing: 50,
            children: [
              SkillsBuilder(
                theme: theme,
                title: "Programming Languages",
                items: [
                  {"icon": FontAwesomeIcons.dartLang, "text": "Dart"},
                  {"icon": FontAwesomeIcons.java, "text": "Java"},
                ],
              ),
              SkillsBuilder(
                theme: theme,
                title: "Tools and Technologies",
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
              SkillsBuilder(
                theme: theme,
                title: "State Management",
                items: [
                  {
                    "icon": AssetImage('assets/images/get_x.png'),
                    "text": "GetX",
                    "isImageIcon": true,
                  },
                  {"icon": FontAwesomeIcons.dartLang, "text": "Provider"},
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SkillsBuilder extends StatelessWidget {
  const SkillsBuilder({
    super.key,
    required this.theme,
    required this.title,
    required this.items,
  });

  final ThemeData theme;
  final String title;
  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      margin: const EdgeInsets.only(left: 50),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            title,
            maxLines: 1,
            style: theme.textTheme.headlineLarge?.copyWith(
              fontSize: context.isMobile ? 28 : 40,
              height: 1,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            runSpacing: 10,
            children: [
              ...items.map((skill) {
                final bool isImageIcon = skill["isImageIcon"] as bool? ?? false;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 10),
                  child: Row(
                    children: [
                      if (isImageIcon)
                        ImageIcon(
                          skill["icon"] as ImageProvider<Object>,
                          color: Colors.white,
                          size: 50,
                        )
                      else
                        FaIcon(
                          skill["icon"] as IconData,
                          color: Colors.white,
                          size: 50,
                        ),
                      const SizedBox(width: 10),
                      Text(
                        skill["text"] as String,
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
