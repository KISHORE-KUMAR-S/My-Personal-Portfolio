import 'package:flutter/material.dart';

import '../../../../providers/app_state_provider.dart';
import '../../../../utils/extensions/context_extensions.dart';
import 'animated_bubble_button.dart';
import 'project_data.dart';
import 'project_item_display_large.dart';

class ProjectItemDisplaySmall extends StatefulWidget {
  const ProjectItemDisplaySmall({
    super.key,
    required this.provider,
    required this.projectNumber,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.buttonTitle = "View",
    this.projectNumberStyle,
    this.titleStyle,
    this.subtitleStyle,
    required this.containerColor,
    this.duration = const Duration(milliseconds: 300),
    this.projectItemHeight,
    this.subHeight,
    this.coloredContainerWidth,
    this.coloredContainerHeight,
    this.padding,
    this.onTap,
  });

  final String projectNumber;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String buttonTitle;
  final TextStyle? projectNumberStyle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Color containerColor;
  final Duration duration;
  final double? projectItemHeight;
  final double? subHeight;
  final double? coloredContainerWidth;
  final double? coloredContainerHeight;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onTap;
  final AppStateProvider provider;

  @override
  State<ProjectItemDisplaySmall> createState() =>
      _ProjectItemDisplaySmallState();
}

class _ProjectItemDisplaySmallState extends State<ProjectItemDisplaySmall>
    with SingleTickerProviderStateMixin {
  bool isHovering = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration);
  }

  void mouseEnter(bool hovering) {
    if (hovering) {
      setState(() {
        isHovering = hovering;
        controller.forward();
      });
    } else {
      setState(() {
        isHovering = hovering;
        controller.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    TextStyle? defaultNumberStyle = widget.projectNumberStyle ??
        textTheme.headlineLarge?.copyWith(
          fontSize: isHovering ? 18 : 16,
          fontWeight: isHovering ? FontWeight.w400 : FontWeight.w300,
        );

    TextStyle? defaultTitleStyle =
        widget.titleStyle ?? textTheme.headlineLarge?.copyWith(fontSize: 26);

    TextStyle? defaultSubtitleStyle = widget.subtitleStyle ??
        textTheme.bodyLarge?.copyWith(
          fontSize: (context.isMobile) ? 10 : 12,
          fontWeight: FontWeight.w400,
          letterSpacing: (context.isMobile) ? 0 : 2.5,
        );

    return MouseRegion(
      onEnter: (event) => mouseEnter(true),
      onExit: (event) => mouseEnter(false),
      child: SizedBox(
        width: context.screenWidth,
        child: Column(
          spacing: 16,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProjectData(
                  duration: Duration(milliseconds: 400),
                  projectNumber: widget.projectNumber,
                  indicatorWidth: isHovering
                      ? context.assignWidth(0.18)
                      : context.assignWidth(0.12),
                  leadingMargin: EdgeInsets.only(
                    top: (defaultTitleStyle!.fontSize! -
                            defaultNumberStyle!.fontSize!) /
                        2.5,
                    right: 8,
                  ),
                  indicatorMargin: EdgeInsets.only(
                    top: defaultNumberStyle.fontSize! / 2.5,
                    right: 8,
                  ),
                  title: widget.title,
                  subtitle: widget.subtitle,
                  titleStyle: defaultTitleStyle,
                  subtitleStyle: defaultSubtitleStyle,
                  projectNumberStyle: defaultNumberStyle,
                  indicatorColor: Colors.grey,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Align(
                alignment: Alignment.centerRight,
                child: AnimatedBubbleButton(
                  startWidth: startWidthOfButtonSm,
                  hovering: isHovering,
                  controller: controller,
                  duration: widget.duration,
                  height: startWidthOfButtonSm,
                  targetWidth: targetWidthSm,
                  controlsOwnAnimation: false,
                  startBorderRadius:
                      const BorderRadius.all(Radius.circular(100)),
                  title: "VIEW PROJECT",
                  color: widget.provider.isLightMode
                      ? Colors.grey.shade100
                      : Colors.grey.shade800,
                  titleStyle: textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  onTap: widget.onTap,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
