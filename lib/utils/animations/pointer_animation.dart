import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

import '../config/constants.dart';
import 'stick.dart';

class PointerAnimation extends StatefulWidget {
  PointerAnimation({super.key, this.color});

  Color? color;

  @override
  State<PointerAnimation> createState() => _PointerAnimationState();
}

class _PointerAnimationState extends State<PointerAnimation>
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
        boxColor: widget.color ?? Colors.white,
        coverColor: theme.colorScheme.primary,
        visibleBoxCurve: Curves.fastLinearToSlowEaseIn,
      ),
    );
  }
}
