import 'package:flutter/material.dart';
import 'project_item_data.dart';
import 'projects.dart';

class RecentWorks {
  static List<ProjectItemData> openSourceContributions(BuildContext context) {
    return [
      Projects.localSend(context),
    ];
  }
}
