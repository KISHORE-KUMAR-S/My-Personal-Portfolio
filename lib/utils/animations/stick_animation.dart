import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

import '../config/constants.dart';
import 'stick.dart';

class StickAnimation extends StatefulWidget {
  const StickAnimation({super.key, this.color = Colors.white});

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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuerySize = MediaQuery.of(context).size;

    return Entry.opacity(
      delay: Constants.smallDelay,
      child: AnimatedStick(
        isVertical: true,
        controller: stickController,
        height: mediaQuerySize.height * 0.4,
        width: 6,
        boxColor: widget.color,
        coverColor: theme.colorScheme.primary,
        visibleBoxCurve: Curves.fastLinearToSlowEaseIn,
      ),
    );
  }
}
