import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;
import 'package:entry/entry.dart' show Entry;
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/config/constants.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/widgets/constraint_title.dart';

class SectionTitleWithSubtitle extends StatefulWidget {
  const SectionTitleWithSubtitle({
    super.key,
    required this.backgroundText,
    required this.foregroundText,
    required this.subtitle,
  });

  final String backgroundText, foregroundText, subtitle;

  @override
  State<SectionTitleWithSubtitle> createState() =>
      _SectionTitleWithSubtitleState();
}

class _SectionTitleWithSubtitleState extends State<SectionTitleWithSubtitle>
    with TickerProviderStateMixin {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foreground = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = theme.colorScheme.secondary;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Entry.opacity(
          duration: Constants.smallDelay,
          child: Column(
            children: [
              Stack(
                children: [
                  Entry.all(
                    scale: 1,
                    xOffset: 60,
                    yOffset: 50,
                    opacity: 0,
                    child: AutoSizeText(
                      widget.backgroundText,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineLarge!.copyWith(
                        fontSize:
                            context.getResponiveValue([40.0, 80.0, 100.0]),
                        foreground: foreground,
                        height: 0.9,
                      ),
                    ),
                  ),
                  AutoSizeText(
                    widget.foregroundText,
                    maxLines: 2,
                    style: theme.textTheme.headlineLarge!.copyWith(
                      fontSize: context.getResponiveValue([40.0, 50.0, 60.0]),
                      height: 1,
                    ),
                  ),
                ],
              ),
              _buildSubTitle(context)
            ],
          ),
        );
      },
    );
  }

  VisibilityDetector _buildSubTitle(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(widget.subtitle),
      onVisibilityChanged: (info) {
        if (info.visibleFraction == 1 && isVisible == false && mounted) {
          setState(() => isVisible = true);
        } else if (info.visibleFraction == 0 && mounted) {
          setState(() => isVisible = false);
        }
      },
      child: ConstraintTitle(isVisible: isVisible, title: widget.subtitle),
    );
  }
}
