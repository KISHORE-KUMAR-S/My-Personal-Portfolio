import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;
import 'package:entry/entry.dart' show Entry;
import 'package:flutter/material.dart';

import '../utils/config/constants.dart';

class OverlappingText extends StatefulWidget {
  const OverlappingText({
    super.key,
    this.offset = const Offset(-10, 10),
    required this.text,
    this.backgroundText,
    this.backgroundStyle,
    this.foregroundStyle,
    this.delay = const Duration(seconds: 4),
    this.duration = Constants.mediumDelay,
  });

  final Offset offset;
  final String text;
  final String? backgroundText;
  final TextStyle? backgroundStyle, foregroundStyle;
  final Duration delay, duration;

  @override
  State<OverlappingText> createState() => _OverlappingTextState();
}

class _OverlappingTextState extends State<OverlappingText>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      fit: StackFit.passthrough,
      children: [
        Entry.all(
          xOffset: -widget.offset.dx,
          yOffset: -widget.offset.dy,
          opacity: 0,
          scale: 1,
          delay: widget.delay,
          duration: widget.duration,
          child: Transform.translate(
            offset: widget.offset,
            child: AutoSizeText(
              widget.backgroundText ?? widget.text,
              maxLines: 1,
              style: widget.backgroundStyle ??
                  theme.textTheme.headlineLarge!.copyWith(
                    color: theme.colorScheme.secondary,
                    fontSize: 120,
                  ),
            ),
          ),
        ),
        AutoSizeText(
          widget.text,
          maxLines: 1,
          style: theme.textTheme.headlineLarge!
              .copyWith(fontSize: widget.foregroundStyle!.fontSize ?? 120),
        )
      ],
    );
  }
}
