import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/experience.dart';
import '../../../providers/app_state_provider.dart';
import '../../../utils/animations/stick_animation.dart';
import '../widgets/experience_widgets/step_card.dart';
import '../widgets/section_title.dart';

class ExperienceView extends StatefulWidget {
  const ExperienceView({super.key});

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView> {
  @override
  Widget build(BuildContext context) {
    final experiences = Experience.kExperiences;
    final isLightMode = context.read<AppStateProvider>().isLightMode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 50,
      children: [
        SectionTitle(
          title: "My Work",
          backgroundText: "Experience",
        ),
        StickAnimation(color: isLightMode ? Colors.black : Colors.white),
        ...experiences.map(
          (experience) {
            int index = experiences.indexOf(experience);
            double start = index / experiences.length;
            double end = (index + 1) > experiences.length
                ? 10
                : (index + 1) / experiences.length;

            return StepCard(
              child: experience,
              start: start,
              end: end,
              index: index + 1,
            );
          },
        )
      ],
    );
  }
}
