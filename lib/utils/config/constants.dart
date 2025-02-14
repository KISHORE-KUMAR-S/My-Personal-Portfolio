import 'package:flutter/material.dart'
    show BuildContext, Paint, PaintingStyle, Theme;

class Constants {
  static const smallDelay = Duration(milliseconds: 1500);
  static const mediumDelay = Duration(milliseconds: 3000);
  static const mediumAnimationSpeed = Duration(milliseconds: 400);

  static const primaryEmail = 'livekishore2001@gmail.com';
  static const secondaryEmail = 'kk2001kishorekumar@gmail.com';
  static const mobileNumber = '+91 7373 10 2828';

  static outlinedText(BuildContext context, {double strokeWidth = 1}) {
    return Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = Theme.of(context).colorScheme.secondary;
  }
}
