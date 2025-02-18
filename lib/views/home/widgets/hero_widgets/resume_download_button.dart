import 'package:entry/entry.dart' show Entry;
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;
import 'package:personal_portfolio/providers/app_state_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart' show launchUrlString;

import '../../../../utils/config/constants.dart';

class ResumeDownloadButton extends StatelessWidget {
  const ResumeDownloadButton({super.key, required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final isLightMode = context.read<AppStateProvider>().isLightMode;

    return Positioned(
      bottom: 10,
      right: 10,
      child: Entry.offset(
        yOffset: 100,
        delay: Duration(seconds: 5),
        duration: Duration(seconds: 7),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Colors.transparent.withValues(alpha: 0.1),
              ),
            ),
            onPressed: () async => launchUrlString(Constants.resume),
            icon: Icon(
              Iconsax.document_download,
              size: 20,
              color: isLightMode ? Colors.black : Colors.white,
            ),
            label: Text(
              "Resume",
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
