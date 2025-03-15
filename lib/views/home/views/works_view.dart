import 'package:flutter/material.dart';
import '../../../models/project_item_data.dart';
import '../../../models/recent_works.dart';
import '../../../providers/app_state_provider.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../widgets/section_title.dart';
import '../widgets/works_widgets/project_item.dart';

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
        ..._buildOpenSourceContributions(
          data: RecentWorks.openSourceContributions,
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
    int margin = (subHeight * (data.length - 1)).toInt();

    for (int index = data.length - 1; index >= 0; index--) {
      items.add(
        Container(
          margin: EdgeInsets.only(top: margin.toDouble()),
          child: ProjectItem(
            provider: provider,
            projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
            imageUrl: data[index].coverImage,
            projectItemHeight: projectHeight,
            subHeight: subHeight,
            title: data[index].title,
            subtitle: data[index].subtitle,
            containerColor: theme.colorScheme.secondary,
            onTap: () {},
          ),
        ),
      );
      margin -= subHeight.toInt();
    }

    return items;
  }
}
