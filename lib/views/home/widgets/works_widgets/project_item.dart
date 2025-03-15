import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/extensions/context_extensions.dart';

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

class ProjectItem extends StatefulWidget {
  const ProjectItem({
    super.key,
    required this.projectNumber,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.buttonTitle = "View",
    this.projectNumberStyle,
    this.titleStyle,
    this.subtitleStyle,
    required this.containerColor,
    required this.backgroundColor,
    required this.backgroundOnHoverColor,
    this.duration = const Duration(milliseconds: 300),
    this.projectItemHeight,
    this.subHeight,
    this.coloredContainerWidth,
    this.coloredContainerHeight,
    this.padding,
    this.onTap,
  });

  @override
  State<ProjectItem> createState() => _ProjectItemState();

  final String projectNumber;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String buttonTitle;
  final TextStyle? projectNumberStyle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Color containerColor;
  final Color backgroundColor;
  final Color backgroundOnHoverColor;
  final Duration duration;
  final double? projectItemHeight;
  final double? subHeight;
  final double? coloredContainerWidth;
  final double? coloredContainerHeight;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onTap;
}

class _ProjectItemState extends State<ProjectItem>
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

    return const Placeholder();
  }
}
