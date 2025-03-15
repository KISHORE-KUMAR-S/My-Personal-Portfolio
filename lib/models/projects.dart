import 'package:flutter/material.dart';

import '../utils/config/constants.dart';
import 'project_item_data.dart';

class Projects {
  static ProjectItemData localSend = ProjectItemData(
    category: Constants.localSendPlatforms,
    coverImage: Constants.localSendCoverImage,
    image: Constants.localSendImage,
    platform: Constants.localSendPlatforms,
    portfolioDescription: Constants.localSendDetails,
    primaryColor: Colors.green.shade900,
    subtitle: Constants.localSendSubtitle,
    title: Constants.localSend,
  );
}
