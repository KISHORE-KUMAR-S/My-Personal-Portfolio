import 'package:entry/entry.dart' show Entry;
import 'package:flutter/material.dart';

import '../../../utils/config/constants.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../widgets/overlapping_text.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.backgroundText,
  });
  final String title, backgroundText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Entry.opacity(
      delay: Constants.smallDelay,
      child: OverlappingText(
        text: title,
        backgroundText: backgroundText,
        delay: Duration(milliseconds: 10),
        duration: Duration(milliseconds: 500),
        foregroundStyle: theme.textTheme.headlineLarge?.copyWith(
          fontSize: context.isMobile ? 25 : 50,
        ),
        backgroundStyle: TextStyle(
          fontSize: context.isMobile ? 50 : 100,
          fontFamily: 'Urbanist',
          foreground: Constants.outlinedText(context),
        ),
      ),
    );
  }
}
