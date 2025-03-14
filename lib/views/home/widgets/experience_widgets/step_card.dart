import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/experience.dart';
import '../../../../providers/app_state_provider.dart';
import '../../../../utils/extensions/context_extensions.dart';
import '../../../../utils/extensions/date_time_extensions.dart';
import '../../../../utils/extensions/string_extensions.dart';

class StepCard extends StatelessWidget {
  const StepCard({
    super.key,
    required this.experience,
    required this.start,
    required this.end,
    required this.index,
  });

  final Experience experience;
  final double start, end;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isLightMode = context.read<AppStateProvider>().isLightMode;

    return context.isDesktop
        ? _buildDesktopStepCard(context, theme, isLightMode)
        : _buildMobileStepCard(context, theme, isLightMode);
  }

  Widget _buildMobileStepCard(
    BuildContext context,
    ThemeData theme,
    bool isLightMode,
  ) {
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.only(left: context.screenWidth * 0.1),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildWorkTimeline(theme),
            Divider(
              thickness: 1,
              color: isLightMode ? Colors.black : Colors.white,
              indent: 0,
              endIndent: 0,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: _buildExperienceDetails(theme),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWorkTimeline(ThemeData theme) {
    var startDate = experience.startDate.toMonthAndYear();
    var endDate = experience.endDate.toMonthAndYear();
    var now = DateTime.now().toMonthAndYear();

    var timeline =
        "$startDate -  ${(endDate.contains(now)) ? "PRESENT" : endDate}";

    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        spacing: 30,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$index".prefixZero(),
            style: theme.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w200,
            ),
          ),
          Text(
            timeline,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: theme.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceDetails(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          experience.company,
          style: theme.textTheme.titleMedium!.copyWith(height: 1.3),
        ),
        Text(
          experience.position,
          style:
              theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
        ),
        ...experience.responsibilities.map(
          (responsibility) => Text(
            responsibility.prefixDash(),
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopStepCard(
    BuildContext context,
    ThemeData theme,
    bool isLightMode,
  ) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimeline(context, theme),
          VerticalDivider(
            thickness: 1,
            color: isLightMode ? Colors.black : Colors.white,
          ),
          _buildExperiences(theme),
        ],
      ),
    );
  }

  Expanded _buildExperiences(ThemeData theme) {
    return Expanded(
      flex: 2,
      child: _buildExperienceDetails(theme),
    );
  }

  Expanded _buildTimeline(BuildContext context, ThemeData theme) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: context.screenWidth * 0.1,
          top: 15,
        ),
        child: _buildWorkTimeline(theme),
      ),
    );
  }
}
