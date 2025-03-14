import 'package:flutter/material.dart';

import '../utils/config/constants.dart';
import 'project_item_data.dart';

class Projects {
  static ProjectItemData LOCALSEND = ProjectItemData(
    category: Constants.localSend,
    coverUrl: Constants.localSend,
    image: Constants.localSendImage,
    platform: Constants.localSendPlatforms,
    portfolioDescription: Constants.localSendDetails,
    primaryColor: Colors.green.shade900,
    subtitle: Constants.localSend,
    title: Constants.localSend,
  );
}
