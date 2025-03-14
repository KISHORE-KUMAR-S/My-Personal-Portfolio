import 'package:entry/entry.dart' show Entry;
import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/extensions/context_extensions.dart';

import '../config/constants.dart';
import 'stick.dart';

class StickAnimation extends StatefulWidget {
  const StickAnimation({super.key, required this.color});

  final Color color;

  @override
  State<StickAnimation> createState() => _StickAnimationState();
}

class _StickAnimationState extends State<StickAnimation>
    with TickerProviderStateMixin {
  late AnimationController stickController;

  @override
  void initState() {
    super.initState();
    stickController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2500))
          ..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    stickController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Entry.opacity(
      delay: Constants.smallDelay,
      child: AnimatedStick(
        isVertical: true,
        controller: stickController,
        height: context.screenHeight * 0.4,
        width: 6,
        boxColor: widget.color,
        coverColor: theme.colorScheme.primary,
        visibleBoxCurve: Curves.fastLinearToSlowEaseIn,
      ),
    );
  }
}
