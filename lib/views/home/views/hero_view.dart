import 'package:auto_size_text/auto_size_text.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

import '../../../utils/config/constants.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/extensions/theme_extensions.dart';
import '../../../utils/sizes/sizes.dart';
import '../../../widgets/overlapping_hero_text.dart';
import '../../../widgets/overlapping_text.dart';
import '../widgets/hero_widgets/location_and_time.dart';

class HeroView extends StatefulWidget {
  const HeroView({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<HeroView> createState() => _HeroViewState();
}

class _HeroViewState extends State<HeroView> {
  bool isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(scrollListener);
    super.dispose();
  }

  void scrollListener() {
    if (widget.scrollController.offset >= 200 && !isScrolled) {
      setState(() => isScrolled = true);
    } else if (widget.scrollController.offset < 200 && isScrolled) {
      setState(() => isScrolled = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    final sizes = Sizes();
    final theme = Theme.of(context);
    final animationDuration = Constants.smallDelay;
    final fontSize = sizes.heroTitleFontSize(context);

    return SizedBox(
      height: mediaQuerySize.height,
      width: mediaQuerySize.width,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              _buildBackgroundGradient(context),
              LocationAndTime(),
              ..._buildAnimatedTexts(constraints, fontSize, animationDuration),
              _buildNameAndSummary(mediaQuerySize, fontSize, theme, context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNameAndSummary(
    Size mediaQuerySize,
    double fontSize,
    ThemeData theme,
    BuildContext context,
  ) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCenteredContent(mediaQuerySize, fontSize, theme),
            _buildProfessionalSummary(context)
          ],
        ),
      ),
    );
  }

  Widget _buildProfessionalSummary(BuildContext context) {
    return Entry.opacity(
      delay: Constants.smallDelay,
      duration: Constants.smallDelay,
      child: Container(
        width: 500,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Text.rich(
          textAlign: TextAlign.center,
          maxLines: 20,
          overflow: TextOverflow.ellipsis,
          TextSpan(
            text: "Flutter Developer & Open-Source Enthusiast",
            style: TextStyle(
              fontSize: context.isDesktop ? 16 : 14,
              fontWeight: FontWeight.w800,
            ),
            children: [
              TextSpan(
                text:
                    ", creating user-centric mobile applications. Proficient in Flutter, Dart, REST API Integration, and state management using Provider and GetX. Dedicated to delivering seamless app functionality through strong problem-solving , testing and debugging expertise. Passionate about developing high-quality apps and collaborating with agile teams.",
                style: TextStyle(
                  fontSize: context.isDesktop ? 16 : 12,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundGradient(BuildContext context) {
    return Positioned(
      top: context.isMobile ? -40 : -250,
      child: Opacity(
        opacity: 0.6,
        child: Entry.offset(
          yOffset: -500,
          delay: Duration(milliseconds: 4000),
          duration: Duration(seconds: 3),
          child: Container(
            height: 900,
            width: MediaQuery.of(context).size.width + 30,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 0.8,
                stops: [-2, 1],
                colors: [
                  context.theme().colorScheme.secondary.withValues(alpha: 0.8),
                  context.theme().scaffoldBackgroundColor,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAnimatedTexts(
    BoxConstraints constraints,
    double fontSize,
    Duration duration,
  ) {
    final isMobile = context.isMobile;
    final maxWidth = constraints.maxWidth;

    return [
      _buildAnimatedPositionText(
        duration: duration,
        left: isMobile ? 20 : 150,
        bottom: isScrolled
            ? 300
            : isMobile
                ? 130
                : 150,
        useOpacity: true,
        child: OverlappingHeroText(
          text: "K",
          initialXOffset: 200,
          initialYOffset: 200,
        ),
      ),
      _buildAnimatedPositionText(
        duration: duration,
        left: maxWidth * 0.2,
        bottom: isScrolled ? -100 : -50,
        useOpacity: true,
        child: OverlappingHeroText(
          text: "S",
          initialXOffset: -200,
          initialYOffset: 200,
        ),
      ),
      _buildAnimatedPositionText(
        duration: duration,
        right: maxWidth * 0.2,
        bottom: isScrolled ? -100 : -50,
        useOpacity: true,
        child: OverlappingHeroText(
          text: "E",
          initialXOffset: -200,
          initialYOffset: 200,
        ),
      ),
      _buildAnimatedPositionText(
        duration: duration,
        right: isMobile ? 40 : maxWidth * 0.1,
        top: isScrolled ? 300 : 400,
        useOpacity: true,
        child: OverlappingHeroText(
          text: "R",
          initialXOffset: 200,
          initialYOffset: 200,
        ),
      ),
    ];
  }

  Widget _buildCenteredContent(
    Size mediaQuerySize,
    double fontSize,
    ThemeData theme,
  ) {
    final isMobile = context.isMobile;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Entry.opacity(
          delay: Constants.smallDelay,
          child: OverlappingText(
            text: "",
            backgroundText: "Kishore Kumar",
            offset: Offset(
              isMobile ? fontSize / 8 : fontSize / 3,
              isMobile ? fontSize / 1.25 : fontSize / 3,
            ),
            foregroundStyle:
                theme.textTheme.headlineLarge?.copyWith(fontSize: fontSize),
            backgroundStyle: TextStyle(
              fontSize: fontSize,
              fontFamily: 'Urbanist',
              foreground: Constants.outlinedText(context),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Entry.opacity(
          delay: Constants.smallDelay,
          child: Transform.translate(
            offset: const Offset(0, -20),
            child: AutoSizeText(
              "Kishore Kumar",
              style: theme.textTheme.headlineLarge!
                  .copyWith(height: 0.4, fontSize: fontSize),
              maxLines: 1,
              maxFontSize: fontSize,
            ),
          ),
        ),
        SizedBox(height: mediaQuerySize.height * 0.06),
      ],
    );
  }

  Widget _buildAnimatedPositionText({
    required Widget child,
    required bool useOpacity,
    required Duration duration,
    double? top,
    double? left,
    double? right,
    double? bottom,
  }) {
    return AnimatedPositioned(
      duration: duration,
      curve: Curves.easeOut,
      top: top,
      bottom: bottom,
      right: right,
      left: left,
      child: useOpacity ? Opacity(opacity: 0.8, child: child) : child,
    );
  }
}
