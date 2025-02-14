import 'package:flutter/material.dart';

import 'clipper.dart';

class CircularRevealAnimation extends StatelessWidget {
  const CircularRevealAnimation({
    super.key,
    this.alignment,
    this.offset,
    this.minRadius,
    this.maxRadius,
    required this.animation,
    required this.child,
  }) : assert(alignment == null || offset == null);

  final Alignment? alignment;
  final Offset? offset;
  final double? minRadius, maxRadius;
  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, clipperChild) {
        return ClipPath(
          clipper: CircularRevealClipper(
            fraction: animation.value,
            alignment: alignment,
            offset: offset,
            minRadius: minRadius,
            maxRadius: maxRadius,
          ),
          child: clipperChild,
        );
      },
      child: child,
    );
  }
}
