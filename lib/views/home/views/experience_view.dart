import 'package:flutter/material.dart';
import '../../../models/experience.dart';
import '../../../utils/animations/pointer_animation.dart';
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 50,
      children: [
        SectionTitle(
          title: "My Work",
          backgroundText: "Experience",
        ),
        PointerAnimation(),
        ...experiences.map(
          (experience) {
            int index = experiences.indexOf(experience);
            double start = index / experiences.length;
            double end = (index + 1) > experiences.length
                ? 10
                : (index + 1) / experiences.length;

            return StepCard(
              experience: experience,
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
