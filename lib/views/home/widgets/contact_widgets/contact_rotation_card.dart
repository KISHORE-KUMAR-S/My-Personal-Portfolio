import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/config/constants.dart';
import 'social_icon_buttons.dart';

class ContactRotationCard extends StatefulWidget {
  const ContactRotationCard({super.key});

  @override
  State<ContactRotationCard> createState() => _ContactRotationCardState();
}

class _ContactRotationCardState extends State<ContactRotationCard> {
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    // final width = context.screenWidth;
    // double circleWidth = width < 500 ? width - 50 : 500;
    // final isLightMode = context.read<AppStateProvider>().isLightMode;

    // Container(
    //       width: circleWidth,
    //       height: circleWidth,
    //       padding: EdgeInsets.all(30),
    //       decoration: DottedDecoration(
    //         shape: Shape.circle,
    //         dash: [20],
    //         strokeWidth: 2,
    //         color: isLightMode ? Colors.black : Colors.white,
    //       ),
    //     ),
    //     Container(
    //       width: circleWidth - 50,
    //       height: circleWidth - 50,
    //       decoration: DottedDecoration(
    //         shape: Shape.circle,
    //         dash: [10],
    //         strokeWidth: 2,
    //         color: theme.colorScheme.secondary,
    //       ),
    //     ),

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 40,
          spacing: 40,
          children: [
            SocialIconsButton(
              iconData: FontAwesomeIcons.solidEnvelope,
              text: Constants.primaryEmail,
              isEmail: true,
            ),
            SocialIconsButton(
              iconData: FontAwesomeIcons.linkedinIn,
              text: Constants.linkedIn,
            ),
            SocialIconsButton(
              iconData: FontAwesomeIcons.squareGithub,
              text: Constants.githubProfile,
            ),
            // SocialIconsButton(
            //   iconData: FontAwesomeIcons.code,
            //   isLeetCode: true,
            //   text: Constants.leetCode,
            // ),
            SocialIconsButton(
              iconData: FontAwesomeIcons.instagram,
              text: Constants.instagram,
            ),
            SocialIconsButton(
              iconData: FontAwesomeIcons.envelope,
              text: Constants.secondaryEmail,
              isEmail: true,
            ),
          ],
        ),
      ],
    );
  }
}
