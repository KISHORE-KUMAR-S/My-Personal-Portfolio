import 'package:flutter/material.dart';
import 'package:personal_portfolio/models/project_item_data.dart';
import 'package:personal_portfolio/models/recent_works.dart';

import '../widgets/section_title.dart';

class WorksView extends StatelessWidget {
  const WorksView({super.key});

  @override
  Widget build(BuildContext context) {
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
        ),
      ],
    );
  }

  List<Widget> _buildOpenSourceContributions(
      {required List<ProjectItemData> data}) {
    List<Widget> items = [];

    // for (int index = data.length - 1; index >= 0; i--) {
    //   items.add(Container(
    //     child: Container(),
    //   ));
    // }

    return items;
  }
}
