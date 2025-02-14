import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import '../utils/extensions/context_extensions.dart';

class OverlappingHeroText extends StatefulWidget {
  const OverlappingHeroText({
    super.key,
    this.offset = const Offset(-8, 5),
    required this.text,
    this.backgroundStyle,
    required this.initialXOffset,
    required this.initialYOffset,
    this.backgroundText,
  });

  final Offset offset;
  final String text;
  final TextStyle? backgroundStyle;
  final String? backgroundText;
  final double initialXOffset, initialYOffset;

  @override
  State<OverlappingHeroText> createState() => _OverlappingHeroTextState();
}

class _OverlappingHeroTextState extends State<OverlappingHeroText> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    double fontSize = context.getResponiveValue([70, 80, 120]).toDouble();

    return Entry.all(
      xOffset: 400,
      yOffset: 300,
      opacity: 0,
      scale: 1,
      curve: Curves.ease,
      delay: Duration(seconds: 1),
      duration: Duration(seconds: 2),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Entry.all(
            xOffset: widget.initialXOffset,
            yOffset: widget.initialYOffset,
            opacity: 0,
            scale: 1,
            delay: Duration(seconds: 1),
            duration: Duration(milliseconds: 2500),
            curve: Curves.easeInOut,
            child: Transform.translate(
              offset: widget.offset,
              child: Text(
                widget.backgroundText ?? widget.text,
                style: widget.backgroundStyle ??
                    theme.textTheme.headlineLarge?.copyWith(
                      color: theme.colorScheme.secondary,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Text(
            widget.text,
            style: theme.textTheme.headlineLarge!.copyWith(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
