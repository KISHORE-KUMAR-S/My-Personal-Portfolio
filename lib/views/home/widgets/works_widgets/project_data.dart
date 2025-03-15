import 'package:flutter/material.dart';

class ProjectData extends StatelessWidget {
  const ProjectData({
    super.key,
    required this.projectNumber,
    required this.title,
    required this.subtitle,
    required this.indicatorColor,
    this.projectNumberStyle,
    this.titleStyle,
    this.subtitleStyle,
    this.indicatorWidth = 150,
    this.indicatorHeight = 1,
    this.indicatorMargin,
    this.leadingMargin,
    required this.duration,
    this.curve = Curves.ease,
  });

  final String projectNumber;
  final String title;
  final String subtitle;
  final Color indicatorColor;
  final TextStyle? projectNumberStyle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double indicatorWidth;
  final double indicatorHeight;
  final EdgeInsetsGeometry? indicatorMargin;
  final EdgeInsetsGeometry? leadingMargin;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 30,
      children: [
        Container(
          margin: leadingMargin,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              AnimatedContainer(
                duration: duration,
                width: indicatorWidth,
                height: indicatorHeight,
                margin: indicatorMargin,
                color: indicatorColor,
                curve: curve,
              ),
              Text(projectNumber, style: projectNumberStyle),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(title, style: titleStyle),
            Text(subtitle, style: subtitleStyle),
          ],
        )
      ],
    );
  }
}
