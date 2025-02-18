import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../providers/app_state_provider.dart';
import '../../../../utils/extensions/context_extensions.dart';
import '../../../../utils/widgets/constraint_title.dart';

class SkillsBuilder extends StatelessWidget {
  const SkillsBuilder({
    super.key,
    required this.theme,
    required this.title,
    required this.subtitle,
    required this.items,
  });

  final ThemeData theme;
  final String title, subtitle;
  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    final isLightMode = context.read<AppStateProvider>().isLightMode;

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
              fontSize: context.isMobile
                  ? 20
                  : context.isTablet
                      ? 28
                      : 40,
              height: 1,
            ),
          ),
          ConstraintTitle(isVisible: true, title: subtitle),
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
                    spacing: 10,
                    children: [
                      if (isImageIcon)
                        ImageIcon(
                          skill["icon"] as ImageProvider<Object>,
                          color: isLightMode ? Colors.black : Colors.white,
                          size: 50,
                        )
                      else
                        FaIcon(
                          skill["icon"] as IconData,
                          color: isLightMode ? Colors.black : Colors.white,
                          size: 50,
                        ),
                      AutoSizeText(
                        skill["text"] as String,
                        maxLines: 3,
                        style: TextStyle(fontSize: context.isMobile ? 14 : 28),
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
