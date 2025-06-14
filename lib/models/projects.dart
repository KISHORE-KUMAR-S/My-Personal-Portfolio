import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../router/routes.dart';
import '../utils/config/constants.dart';
import 'project_item_data.dart';

class Projects {
  static ProjectItemData localSend(BuildContext context) {
    return ProjectItemData(
      category: Constants.localSendPlatforms,
      coverImage: Constants.localSendCoverImage,
      image: Constants.localSendImage,
      platform: Constants.localSendPlatforms,
      portfolioDescription: Constants.localSendDetails,
      subtitle: Constants.localSendSubtitle,
      title: Constants.localSend,
      onTap: () => context.push(Routes.localsend),
    );
  }
}
