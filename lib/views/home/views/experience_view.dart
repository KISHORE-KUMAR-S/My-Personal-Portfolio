import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

import '../../../utils/config/constants.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../widgets/overlapping_text.dart';
import '../widgets/section_title.dart';

class ExperienceView extends StatefulWidget {
  const ExperienceView({super.key});

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SectionTitle(
          title: "My",
          backgroundText: "Experience",
        ),
      ],
    );
  }
}
