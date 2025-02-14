import 'dart:math' show max, sqrt;
import 'dart:ui' show Offset, Path, Rect, Size, lerpDouble;
import 'package:flutter/material.dart'
    show Alignment, CustomClipper, Offset, Path, Rect, Size;

class CircularRevealClipper extends CustomClipper<Path> {
  CircularRevealClipper({
    required this.fraction,
    this.alignment,
    this.offset,
    this.minRadius,
    this.maxRadius,
  });

  final double fraction;
  final Alignment? alignment;
  final Offset? offset;
  final double? minRadius;
  final double? maxRadius;

  @override
  Path getClip(Size size) {
    // Calculate the center offset based on alignment or offset
    final Offset centerOffset = alignment?.alongSize(size) ??
        offset ??
        Offset(size.width / 2, size.height / 2);

    // Determine the minimum and maximum radius
    final calculatedMinRadius = minRadius ?? 0;
    final calculatedMaxRadius = maxRadius ?? _calcMaxRadius(size, centerOffset);

    // Interpolate the radius based on the fraction
    final double radius = lerpDouble(
      calculatedMinRadius,
      calculatedMaxRadius,
      fraction,
    )!;

    // Create a circular path for clipping
    return Path()
      ..addOval(Rect.fromCircle(center: centerOffset, radius: radius));
  }

  @override
  bool shouldReclip(covariant CircularRevealClipper oldClipper) => true;

  // Helper method to calculate the maximum radius
  double _calcMaxRadius(Size size, Offset centerOffset) {
    final double w = max(centerOffset.dx, size.width - centerOffset.dx);
    final double h = max(centerOffset.dy, size.height - centerOffset.dy);
    return sqrt(w * w + h * h);
  }
}
