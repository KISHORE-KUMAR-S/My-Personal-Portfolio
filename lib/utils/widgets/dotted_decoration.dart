import 'dart:ui' show PathMetric, PathMetrics;
import 'package:flutter/material.dart';

import '../enums/enums.dart';

class DottedDecoration extends Decoration {
  const DottedDecoration({
    this.linePosition = LinePosition.bottom,
    this.shape = Shape.line,
    this.color = const Color(0xFF9E9E9E),
    this.borderRadius,
    this.dash = const <double>[5, 5],
    this.strokeWidth = 1.0,
  });

  final LinePosition linePosition;
  final Shape shape;
  final Color color;
  final BorderRadius? borderRadius;
  final List<double> dash;
  final double strokeWidth;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DottedBoxPainter(
      this,
      onChanged,
      linePosition,
      shape,
      color,
      borderRadius,
      dash,
      strokeWidth,
    );
  }
}

class _DottedBoxPainter extends BoxPainter {
  final DottedDecoration decoration;

  _DottedBoxPainter(
    this.decoration,
    VoidCallback? onChanged,
    this.linePosition,
    this.shape,
    this.color,
    this.borderRadius,
    this.dash,
    this.strokeWidth,
  ) : super(onChanged);

  final LinePosition linePosition;
  final Shape shape;
  final Color color;
  final BorderRadius? borderRadius;
  final List<double> dash; // Changed from List<int> to List<double>
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    if (configuration.size == null) {
      return; // Return early if size is null
    }

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rect = offset & configuration.size!;
    final path = Path();
    final dx = offset.dx;
    final dy = offset.dy;
    final height = configuration.size!.height;
    final width = configuration.size!.width;

    if (decoration.shape == Shape.line) {
      if (linePosition == LinePosition.left) {
        path.moveTo(dx, dy);
        path.lineTo(dx, dy + height);
      } else if (linePosition == LinePosition.top) {
        path.moveTo(dx, dy);
        path.lineTo(dx + width, dy);
      } else if (linePosition == LinePosition.right) {
        path.moveTo(dx + width, dy);
        path.lineTo(dx + width, dy + height);
      } else {
        path.moveTo(dx, dy + height);
        path.lineTo(dx + width, dy + height);
      }
    } else if (shape == Shape.box) {
      if (borderRadius != null) {
        RRect rect = RRect.fromLTRBAndCorners(
          dx,
          dy,
          dx + width,
          dy + height,
          bottomLeft: borderRadius!.bottomLeft,
          bottomRight: borderRadius!.bottomRight,
          topLeft: borderRadius!.topLeft,
          topRight: borderRadius!.topRight,
        );
        path.addRRect(rect);
      } else {
        path.addRect(Rect.fromLTWH(dx, dy, width, height));
      }
    } else if (shape == Shape.circle) {
      path.addOval(Rect.fromLTWH(dx, dy, width, height));
    }

    PathMetrics metrics = path.computeMetrics(forceClosed: false);
    Path drawPath = Path();

    for (PathMetric metric in metrics) {
      double totalLength = metric.length;
      int index = -1;

      for (double start = 0; start < totalLength;) {
        double end = start + dash[(++index) % dash.length];
        end = end > totalLength ? totalLength : end;
        bool isEven = index % 2 == 0;

        if (isEven) {
          drawPath.addPath(
            metric.extractPath(start, end, startWithMoveTo: true),
            Offset.zero,
          );
        }
        start = end;
      }
    }

    canvas.drawPath(drawPath, paint);
  }
}
