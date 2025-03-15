import '../utils/config/constants.dart';
import 'project_item_data.dart';

class Projects {
  static ProjectItemData localSend = ProjectItemData(
    category: Constants.localSendPlatforms,
    coverImage: Constants.localSendCoverImage,
    image: Constants.localSendImage,
    platform: Constants.localSendPlatforms,
    portfolioDescription: Constants.localSendDetails,
    subtitle: Constants.localSendSubtitle,
    title: Constants.localSend,
  );
}
