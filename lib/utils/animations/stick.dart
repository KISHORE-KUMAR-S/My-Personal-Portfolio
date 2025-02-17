import 'package:flutter/material.dart';

/// Credits to [https://davidcobbina.com] for his extraordinary artwork

const double hiddenFactor = 2.0;

class AnimatedStick extends AnimatedWidget {
  const AnimatedStick({
    super.key,
    this.isVertical = false,
    required this.controller,
    required this.height,
    required this.width,
    this.boxColor = Colors.black,
    this.coverColor = Colors.transparent,
    this.visibleBoxCurve = Curves.fastOutSlowIn,
    this.invisibleBoxCurve = Curves.fastOutSlowIn,
    this.visibleBoxAnimation,
    this.invisibleBoxAnimation,
  }) : super(listenable: controller);

  final bool isVertical;
  final AnimationController controller;
  final double height, width;
  final Color boxColor, coverColor;
  final Curve visibleBoxCurve, invisibleBoxCurve;
  final Animation<double>? visibleBoxAnimation, invisibleBoxAnimation;

  Animation<double> get visibleAnimation {
    return visibleBoxAnimation ??
        Tween<double>(
          begin: 0,
          end: isVertical ? height : width - (hiddenFactor * 2),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.5, curve: visibleBoxCurve),
          ),
        );
  }

  Animation<double> get invisibleAnimation {
    return Tween<double>(
      begin: 0,
      end: isVertical ? height : width,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 1, curve: invisibleBoxCurve),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var factor = hiddenFactor * 2;

    var boxWidth = isVertical ? width - factor : visibleAnimation.value;
    var boxHeight = isVertical ? visibleAnimation.value : height - factor;
    var coverWidth = isVertical ? width : invisibleAnimation.value;
    var coverHeight = isVertical ? invisibleAnimation.value : height;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: hiddenFactor,
            left: hiddenFactor,
            child: Container(
              width: boxWidth,
              height: boxHeight,
              color: boxColor,
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: coverWidth,
              height: coverHeight,
              color: coverColor,
            ),
          ),
        ],
      ),
    );
  }
}
