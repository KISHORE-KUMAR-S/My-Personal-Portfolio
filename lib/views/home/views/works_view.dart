import 'package:flutter/material.dart';
import '../../../models/project_item_data.dart';
import '../../../models/recent_works.dart';
import '../../../providers/app_state_provider.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../widgets/section_title.dart';
import '../widgets/works_widgets/project_item_display_large.dart';
import '../widgets/works_widgets/project_item_display_small.dart';

class WorksView extends StatelessWidget {
  const WorksView({super.key, required this.provider});

  final AppStateProvider provider;

  @override
  Widget build(BuildContext context) {
    double projectHeight = context.assignHeight(0.4);
    double subHeight = (3 / 4) * projectHeight;
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionTitle(
          title: "Open Source",
          backgroundText: "Contributions",
        ),
        SizedBox(height: 25),
        if (context.isMobile)
          ..._buildOpenSourceContributionsMobileView(
            data: RecentWorks.openSourceContributions(context),
            projectHeight: projectHeight,
            subHeight: subHeight,
            theme: theme,
            context: context,
          )
        else
          ..._buildOpenSourceContributions(
            data: RecentWorks.openSourceContributions(context),
            projectHeight: projectHeight,
            subHeight: subHeight,
            theme: theme,
            context: context,
          ),
      ],
    );
  }

  List<Widget> _buildOpenSourceContributions({
    required List<ProjectItemData> data,
    required double projectHeight,
    required double subHeight,
    required ThemeData theme,
    required BuildContext context,
  }) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        ProjectItemDisplayLarge(
          provider: provider,
          projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
          imageUrl: data[index].image,
          projectItemHeight: projectHeight,
          subHeight: subHeight,
          title: data[index].title,
          subtitle: data[index].subtitle,
          containerColor: theme.colorScheme.secondary,
          onTap: data[index].onTap,
        ),
      );
    }

    return items;
  }

  List<Widget> _buildOpenSourceContributionsMobileView({
    required List<ProjectItemData> data,
    required double projectHeight,
    required double subHeight,
    required ThemeData theme,
    required BuildContext context,
  }) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        ProjectItemDisplaySmall(
          provider: provider,
          projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
          imageUrl: data[index].image,
          projectItemHeight: projectHeight,
          subHeight: subHeight,
          title: data[index].title,
          subtitle: data[index].subtitle,
          containerColor: theme.colorScheme.secondary,
          onTap: data[index].onTap,
        ),
      );
    }

    return items;
  }
}
