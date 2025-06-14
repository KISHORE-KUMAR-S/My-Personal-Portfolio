import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;
import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
import 'package:url_launcher/url_launcher.dart'
    show canLaunchUrl, LaunchMode, launchUrl;
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/config/constants.dart';
import 'widgets/localsend_logo.dart';

final urlRegex = RegExp(
  r'(https?:\/\/[^\s]+)',
  caseSensitive: false,
);

final spans = <TextSpan>[];

class LocalsendScreen extends StatelessWidget {
  const LocalsendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isMobileOrTablet = context.isMobile || context.isTablet;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 50,
          children: [
            const Center(child: LocalSendLogo()),
            Center(
              child: Column(
                spacing: 8,
                children: [
                  AutoSizeText(
                    Constants.localSend,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  AutoSizeText(
                    Constants.localSendSubtitle,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            isMobileOrTablet
                ? _buildLocalSendMobileTablet(
                    context: context,
                    theme: theme,
                    title: "About",
                    details: Constants.localSendDetails,
                  )
                : _buildLocalSendDesktop(
                    context: context,
                    theme: theme,
                    title: "About",
                    details: Constants.localSendDetails,
                  ),
            isMobileOrTablet
                ? _buildLocalSendMobileTablet(
                    context: context,
                    theme: theme,
                    title: "My Contributions",
                    details: Constants.localSendContribution,
                  )
                : _buildLocalSendDesktop(
                    context: context,
                    theme: theme,
                    title: "My Contributions",
                    details: Constants.localSendContribution,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                _buildIcon(colorScheme, FontAwesomeIcons.github),
                AutoSizeText(
                  "Merged Pull Requests",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.onTertiary,
                  ),
                ),
                _buildIcon(colorScheme, FontAwesomeIcons.codeMerge),
              ],
            ),
            isMobileOrTablet
                ? _buildLocalSendMobileTablet(
                    context: context,
                    theme: theme,
                    title: "Multiple App Selection",
                    details: "https://github.com/localsend/localsend/pull/1875",
                  )
                : _buildLocalSendDesktop(
                    context: context,
                    theme: theme,
                    title: "Multiple App Selection",
                    details: "https://github.com/localsend/localsend/pull/1875",
                  ),
            isMobileOrTablet
                ? _buildLocalSendMobileTablet(
                    context: context,
                    theme: theme,
                    title: "Tamil (தமிழ்) Language",
                    details: "https://github.com/localsend/localsend/pull/2129",
                  )
                : _buildLocalSendDesktop(
                    context: context,
                    theme: theme,
                    title: "Tamil (தமிழ்) Language",
                    details: "https://github.com/localsend/localsend/pull/2129",
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocalSendMobileTablet({
    required BuildContext context,
    required ThemeData theme,
    required String title,
    required String details,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 25,
      children: [
        AutoSizeText(
          title,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.secondary,
          ),
        ),
        _buildRichText(context: context, theme: theme, text: details),
      ],
    );
  }

  Widget _buildLocalSendDesktop({
    required BuildContext context,
    required ThemeData theme,
    required String title,
    required String details,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: AutoSizeText(
              title,
              maxLines: 1,
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: 50,
                color: theme.colorScheme.secondary,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 5,
            child:
                _buildRichText(context: context, theme: theme, text: details),
          ),
        ],
      ),
    );
  }

  Widget _buildRichText({
    required BuildContext context,
    required ThemeData theme,
    required String text,
  }) {
    final matches = urlRegex.allMatches(text);
    final spans = <TextSpan>[];
    int lastIndex = 0;

    for (final match in matches) {
      final url = match.group(0)!;

      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: text.substring(lastIndex, match.start),
          style: theme.textTheme.labelMedium
              ?.copyWith(color: theme.colorScheme.tertiary),
        ));
      }

      spans.add(TextSpan(
        text: url,
        style: context.isMobile
            ? theme.textTheme.labelSmall?.copyWith(
                decoration: TextDecoration.underline,
              )
            : theme.textTheme.labelLarge?.copyWith(
                decoration: TextDecoration.underline,
              ),
        recognizer: TapGestureRecognizer()
          ..onTap = () async {
            final uri = Uri.tryParse(url);
            if (uri != null && await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
      ));

      lastIndex = match.end;
    }

    if (lastIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastIndex),
        style: theme.textTheme.bodyLarge,
      ));
    }

    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(children: spans),
    );
  }

  Widget _buildIcon(ColorScheme colorScheme, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(10),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: colorScheme.secondary,
        child: Icon(
          icon,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}
