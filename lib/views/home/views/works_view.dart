import 'package:flutter/material.dart';
import 'package:personal_portfolio/models/project_item_data.dart';
import 'package:personal_portfolio/models/recent_works.dart';
import 'package:personal_portfolio/utils/extensions/context_extensions.dart';

import '../widgets/section_title.dart';
import '../widgets/works_widgets/project_item.dart';

class WorksView extends StatelessWidget {
  const WorksView({super.key});

  @override
  Widget build(BuildContext context) {
    double projectHeight = context.assignHeight(0.4);
    double subHeight = (3 / 4) * projectHeight;

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
        ),
      ],
    );
  }

  List<Widget> _buildOpenSourceContributions({
    required List<ProjectItemData> data,
    required double projectHeight,
    required double subHeight,
  }) {
    List<Widget> items = [];
    int margin = (subHeight * (data.length - 1)).toInt();

    for (int index = data.length - 1; index >= 0; i--) {
      items.add(Container(
        margin: EdgeInsets.only(top: margin.toDouble()),
        child: ProjectItem(),
      ));
    }

    return items;
  }
}
