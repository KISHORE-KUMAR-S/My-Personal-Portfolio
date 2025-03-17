import 'package:flutter/material.dart';
import '../../../../providers/app_state_provider.dart';
import '../../../../utils/extensions/context_extensions.dart';
import 'animated_bubble_button.dart';

import 'project_data.dart';

// For rendering on bigger devices eg. tablets, desktops etc.
const double startWidthOfButton = 54;
const double heightOfButton = startWidthOfButton;
const double targetWidthOfButton = 200;
const double startWidthOfButtonMd = 44;
const double heightOfButtonMd = startWidthOfButtonMd;
const double targetWidthOfButtonMd = 160;

// For rendering on mobile devices
const double startWidthOfButtonSm = 40;
const double targetWidthSm = 160;
const double heightOfButtonSm = startWidthOfButtonSm;

class ProjectItemDisplayLarge extends StatefulWidget {
  const ProjectItemDisplayLarge({
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

  @override
  State<ProjectItemDisplayLarge> createState() =>
      _ProjectItemDisplayLargeState();

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
}

class _ProjectItemDisplayLargeState extends State<ProjectItemDisplayLarge>
    with SingleTickerProviderStateMixin {
  bool isHovering = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
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
    double projectItemHeight =
        widget.projectItemHeight ?? context.assignHeight(0.4);
    double subHeight = widget.subHeight ?? (3 / 4 * projectItemHeight);
    double containerHeight = widget.coloredContainerHeight ?? (subHeight * 0.8);
    double containerWidth = widget.coloredContainerWidth ??
        context.responsiveSize(
          xs: context.assignWidth(0.25),
          lg: context.assignWidth(0.25),
          md: context.assignWidth(0.33),
          sm: context.assignWidth(0.35),
        );
    double positionOfButton = (subHeight / 2) - startWidthOfButton;
    double positionOfColoredContainer = positionOfButton + (heightOfButton / 2);

    double imageWidth = context.responsiveSize(
      xs: context.screenWidth / 2.5,
      lg: context.screenWidth / 4,
      md: context.screenWidth / 3,
      sm: context.screenWidth / 2.8,
    );

    double buttonWidth = context.responsiveSize(
      xs: startWidthOfButtonMd,
      lg: startWidthOfButton,
      md: startWidthOfButtonMd,
    );

    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? buttonStyle = textTheme.bodyLarge?.copyWith(
      color: Colors.black,
      fontSize: context.responsiveSize(xs: 14, lg: 16, md: 14),
      fontWeight: FontWeight.w500,
    );

    TextStyle? defaultNumberStyle = widget.projectNumberStyle ??
        textTheme.headlineLarge?.copyWith(
          fontSize: isHovering ? 20 : 16,
          fontWeight: isHovering ? FontWeight.w400 : FontWeight.w300,
        );

    TextStyle? defaultTitleStyle = widget.titleStyle ??
        textTheme.headlineLarge?.copyWith(
            fontSize: context.responsiveSize(xs: 24, lg: 40, md: 36, sm: 30));

    TextStyle? defaultSubtitleStyle = widget.subtitleStyle ??
        textTheme.bodyLarge?.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          letterSpacing: 2.5,
        );

    Animation<double> animation = Tween<double>(
      begin: context.responsiveSize(
        xs: -imageWidth * 2.2,
        lg: -imageWidth * 1.8,
        md: -imageWidth * 2.2,
      ),
      end: 0.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn))
      ..addListener(() => setState(() {}));

    return MouseRegion(
      onEnter: (event) => mouseEnter(true),
      onExit: (event) => mouseEnter(false),
      child: SizedBox(
        height: (context.isMobile) ? projectItemHeight / 2 : projectItemHeight,
        width: context.screenWidth,
        child: Stack(
          children: [
            Container(
              width: context.screenWidth,
              height: context.isMobile ? subHeight / 2 : subHeight,
              padding: widget.padding ?? EdgeInsets.only(top: subHeight / 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimatedOpacity(
                    opacity: isHovering ? 1 : 0.5,
                    duration: widget.duration,
                    child: ProjectData(
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
                  )
                ],
              ),
            ),
            Positioned(
              top: positionOfColoredContainer,
              right: context.assignWidth(0.1),
              child: AnimatedContainer(
                width: isHovering ? containerWidth : 0,
                color: widget.containerColor,
                height: containerHeight,
                duration: Duration(milliseconds: 450),
                curve: Curves.fastOutSlowIn,
              ),
            ),
            Positioned(
              top: positionOfButton,
              right: context.assignWidth(0.1),
              child: AnimatedBubbleButton(
                color: widget.provider.isLightMode
                    ? Colors.grey.shade100
                    : Colors.grey.shade800,
                imageColor: Colors.black,
                startOffset: Offset(0, 0),
                targetOffset: Offset(0.1, 0),
                startBorderRadius: BorderRadius.all(Radius.circular(100)),
                title: "SEE MY WORKS",
                titleStyle: textTheme.bodyLarge?.copyWith(
                  fontSize: context.responsiveSize(xs: 14, lg: 16, sm: 15),
                  fontWeight: FontWeight.w500,
                ),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
