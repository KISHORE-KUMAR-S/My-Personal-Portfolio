import 'package:auto_size_text/auto_size_text.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/extensions/context_extensions.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/config/constants.dart';
import '../../../utils/sizes/sizes.dart';
import '../../../widgets/overlapping_text.dart';

class SectionTitle extends StatefulWidget {
  const SectionTitle({
    super.key,
    required this.backgroundText,
    required this.foregroundText,
    required this.subtitle,
  });

  final String backgroundText, foregroundText, subtitle;

  @override
  State<SectionTitle> createState() => _SectionTitleState();
}

class _SectionTitleState extends State<SectionTitle>
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
                            context.getResponiveValue([60.0, 80.0, 100.0]),
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
              VisibilityDetector(
                key: ValueKey(widget.subtitle),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction == 1 &&
                      isVisible == false &&
                      mounted) {
                    setState(() => isVisible = true);
                  } else if (info.visibleFraction == 0 && mounted) {
                    setState(() => isVisible = false);
                  }
                },
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: context.isMobile ? 300 : 400,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 2000),
                            height: 1,
                            color: Colors.white,
                            curve: Curves.easeOutCirc,
                            width: isVisible ? 400 : 0,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: isVisible ? 1 : 0,
                        duration: Duration(milliseconds: 500),
                        child: AnimatedSlide(
                          offset: isVisible ? Offset(0, 0) : Offset(2, 0),
                          duration: Duration(milliseconds: 500),
                          child: Text(widget.subtitle),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
